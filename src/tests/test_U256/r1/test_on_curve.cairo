use ec_verify::curves::U256::r1_point;
use option::OptionTrait;
use result::ResultTrait;
use debug::PrintTrait;


#[test]
fn generator_test_r1() {
    let r1_gen = r1_point::init_P256_R1_curve_with(
        0xd0720dc691aa80096ba32fed1cb97c2b620690d06de0317b8618d5ce65eb728f_u256,
        0x9681b517b1cda17d0d83d335d9c4a8a9a9b0b1b3c7106d8f3c72bc5093dc275f_u256
    );
}

