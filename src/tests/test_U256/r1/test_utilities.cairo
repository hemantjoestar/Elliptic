use Elliptic::curves::U256::u256_common;
use Elliptic::curves::U256::u256_common::{U256Zeroable};
use Elliptic::curves::U256::r1_point::{secp256r1_constants, R1CurveParameters};
use Elliptic::curves::curve_traits::{ModularArithmetic, ECCurveTraits, AffinePoint};
use Elliptic::curves::double_and_add::{AffinePointAdd, ECCurveTraitsImpl};
use result::ResultTrait;
use Elliptic::egcd;

// to conduct test against standard curve with know Generator
fn init_P256_R1_with_G() -> AffinePoint<u256> {
    let x = secp256r1_constants::R1_G_X;
    let y = secp256r1_constants::R1_G_Y;
    ECCurveTraitsImpl::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::new(x, y).unwrap()
    // ECCurveTraitsImpl::<u256>::new(x, y).unwrap()
}
fn known_point_on_curve(x: u256, y: u256) -> AffinePoint<u256> {
    ECCurveTraitsImpl::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::new(x, y).unwrap()
}
fn point_mul(point: AffinePoint<u256>, scalar: u256) -> AffinePoint<u256> {
    ECCurveTraitsImpl::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::scalar_mul(point,scalar)
}
fn point_mul_with_G_r1(scalar: u256) -> AffinePoint<u256> {
    let x = secp256r1_constants::R1_G_X;
    let y = secp256r1_constants::R1_G_Y;
    
    let point =ECCurveTraitsImpl::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::new(x, y).unwrap();
    ECCurveTraitsImpl::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::scalar_mul(point,scalar)
}
fn add_r1_points(lhs: AffinePoint<u256>, rhs: AffinePoint<u256>) -> AffinePoint<u256> {
    AffinePointAdd::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::add(lhs,rhs)
}
// TODO. r == 0 loop check
// done against std r1 curve so know known
fn get_sig(pk: u256, randomK: u256, pubK: AffinePoint<u256>, mHash: u256) -> AffinePoint<u256> {
    // 2. r = z.x
    // 3. s = (( m + r*n ) %k) mod p
    // randomK order check
    assert(randomK < secp256r1_constants::R1_N, 'rand pt. !< order -1');
    // keygen check
    // let gen_pubK = point_mul_with_G_r1(pk);
    // assert(gen_pubK == pubK, 'gen_pubK != pubK');

    // 1. calculate point z =  k*G
    let z = point_mul_with_G_r1(randomK);
    let r = z.x % secp256r1_constants::R1_N;
    assert(r != 0_u256, 'r is zero');

    let s_right = mHash
        .modular_add(r.modular_mul(pk, secp256r1_constants::R1_N), secp256r1_constants::R1_N);
    let k_inverse = egcd::mod_inv(secp256r1_constants::R1_N, randomK);
    //     assert(k_inverse != 0_u256, 'k_inverse is zero');
    let s = k_inverse.modular_mul(s_right, secp256r1_constants::R1_N);

    assert(r < secp256r1_constants::R1_N, 'r !< R1_N');
    assert(s < secp256r1_constants::R1_N, 's !< R1_N');
    AffinePoint { x: r, y: s }
}
// TODO: pubK checks pending, 1. not Identity, 2. on curve, 3. order mul ie n*pubK != Identity
fn verify_sig(pubK: AffinePoint<u256>, sig: AffinePoint<u256>, mHash: u256) -> bool {
    let r = sig.x;
    let s = sig.y;
    assert(r < secp256r1_constants::R1_N, 'r !< R1_N');
    assert(s < secp256r1_constants::R1_N, 's !< R1_N');

    let s_inverse = egcd::mod_inv(secp256r1_constants::R1_N, s);
    let u_1 = mHash.modular_mul(s_inverse, secp256r1_constants::R1_N);
    let u_2 = r.modular_mul(s_inverse, secp256r1_constants::R1_N);

    let r_prime_left = point_mul_with_G_r1(u_1);
    // field operation is commutative
    let r_prime_right = point_mul(pubK, u_2);
    // let r_prime = add_r1_points(r_prime_left, r_prime_right);
    let r_prime = AffinePointAdd::<u256,_,_,_,_,_,_,_,_,_,U256Zeroable>::add(r_prime_left,r_prime_right);
    r == r_prime.x
}
