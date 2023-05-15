use Elliptic::tests::test_U256::r1::test_utilities::{
    add_r1_points, point_mul, init_P256_R1_with_G, known_point_on_curve, point_mul_with_G_r1
};
use Elliptic::curves::curve_traits::{ModularArithmetic, CurvePoint};
use Elliptic::curves::U256::u256_common;
use Elliptic::curves::U256::r1_point::{secp256r1_constants};
use Elliptic::egcd;

// TODO. r == 0 loop check
// done against std r1 curve so know known
fn get_sig(pk: u256, randomK: u256, pubK: CurvePoint<u256>, mHash: u256) -> CurvePoint<u256> {
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
    CurvePoint { x: r, y: s }
}
// TODO: pubK checks pending, 1. not Identity, 2. on curve, 3. order mul ie n*pubK != Identity
fn verify_sig(pubK: CurvePoint<u256>, sig: CurvePoint<u256>, mHash: u256) -> bool {
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
    let r_prime = add_r1_points(r_prime_left, r_prime_right);
    r == r_prime.x
}
#[test]
#[available_gas(40000000000)]
fn against_known_sha() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    // sha_256('starknet')
    let sha256_message: u256 = 0xfd187671a1d5f861b976693a967019778bb2aaac30a36b419311ab63c741e9c9;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'starknet sig ver fail');
}
#[test]
#[available_gas(40000000000)]
fn against_known_sha_1() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    let sha256_message: u256 = 0x9781f2eccf6075d6971346c33cdf205378d0fe2f600aae5483982746d2080200;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'Hash > 512 sig ver fail');
}
#[test]
#[available_gas(40000000000)]
fn against_known_sha_2() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    let sha256_message: u256 = 0x55e6d9b9697db24aa6b143d8f4d0866a44748a876e1ab262c3a9df982290cabd;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'Hash CWP sig ver fail');
}
