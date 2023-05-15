use Elliptic::curves::U256::u256_common;
use Elliptic::curves::U256::r1_point::{secp256r1_constants, R1CurveParameters};
use Elliptic::curves::curve_traits::{ECCurveTraits, CurvePoint};
use Elliptic::curves::double_and_add::{CurvePointAdd, ECCurveTraitsImpl};
use result::ResultTrait;

// to conduct test against standard curve with know Generator
fn init_P256_R1_with_G() -> CurvePoint<u256> {
    let x = secp256r1_constants::R1_G_X;
    let y = secp256r1_constants::R1_G_Y;
    ECCurveTraitsImpl::<u256>::new(x, y).unwrap()
}
fn known_point_on_curve(x: u256, y: u256) -> CurvePoint<u256> {
    ECCurveTraitsImpl::<u256>::new(x, y).unwrap()
}
fn point_mul(point: CurvePoint<u256>, scalar: u256) -> CurvePoint<u256> {
    point.scalar_mul(scalar)
}
fn point_mul_with_G_r1(scalar: u256) -> CurvePoint<u256> {
    let x = secp256r1_constants::R1_G_X;
    let y = secp256r1_constants::R1_G_Y;
    ECCurveTraitsImpl::<u256>::new(x, y).unwrap().scalar_mul(scalar)
}
fn add_r1_points(lhs: CurvePoint<u256>, rhs: CurvePoint<u256>) -> CurvePoint<u256> {
    lhs + rhs
}
