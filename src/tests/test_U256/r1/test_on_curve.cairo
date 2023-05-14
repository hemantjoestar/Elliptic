use Elliptic::curves::U256::u256_common;
use Elliptic::curves::U256::r1_point::R1CurveParameters;
use Elliptic::curves::curve_traits::{CurvePoint};
use Elliptic::curves::double_and_add::ECCurveTraitsImpl;
use option::OptionTrait;
use result::ResultTrait;
use debug::PrintTrait;

// helper functions 
fn init_P256_R1_curve_with(x: u256, y: u256) -> CurvePoint<u256> {
    match ECCurveTraitsImpl::<u256>::new(x, y) {
        Result::Ok(x) => x,
        Result::Err(err) => panic_with_felt252(err),
    }
}

#[test]
fn generator_test_r1() {
    let r1_gen = init_P256_R1_curve_with(
        0xd0720dc691aa80096ba32fed1cb97c2b620690d06de0317b8618d5ce65eb728f_u256,
        0x9681b517b1cda17d0d83d335d9c4a8a9a9b0b1b3c7106d8f3c72bc5093dc275f_u256
    );
}

