use ec_verify::curves::U256::{r1_point, u256_common};
use ec_verify::curves::U256::r1_point::secp256r1_constants;
use ec_verify::curves::curve_traits::{ECCurveTraitsImpl, ECCurveTraits};
use result::ResultTrait;
use debug::PrintTrait;


#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_1() {
    let r2_gen = r1_point::init_P256_R1_curve_with(
        secp256r1_constants::R1_G_X, secp256r1_constants::R1_G_Y
    );
    let r1_gen = ECCurveTraitsImpl::<u256>::new(
        0xd0720dc691aa80096ba32fed1cb97c2b620690d06de0317b8618d5ce65eb728f_u256,
        0x9681b517b1cda17d0d83d335d9c4a8a9a9b0b1b3c7106d8f3c72bc5093dc275f_u256
    )
        .unwrap();
    let gen_1_result = r1_point::init_P256_R1_curve_with(
        x: 0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296_u256,
        y: 0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5_u256,
    );
    assert(r2_gen.scalar_mul(1_u256) == gen_1_result, 'G_R1 * 1 Fail');
}
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_2() {
//     let gen_2 = PointR1 {
//         x: 0x7CF27B188D034F7E8A52380304B51AC3C08969E277F21B35A60B48FC47669978_u256,
//         y: 0x07775510DB8ED040293D9AC69F7430DBBA7DADE63CE982299E04B79D227873D1_u256,
//     };
//     assert(gen.scalar_mul(2) == gen_2, 'G_R1 * 2 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_3() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_3 = PointR1 {
//         x: 0x5ECBE4D1A6330A44C8F7EF951D4BF165E6C6B721EFADA985FB41661BC6E7FD6C_u256,
//         y: 0x8734640C4998FF7E374B06CE1A64A2ECD82AB036384FB83D9A79B127A27D5032_u256,
//     };
//     assert(gen.scalar_mul(3) == gen_3, 'G_R1 * 3 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_4() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_4 = PointR1 {
//         x: 0xE2534A3532D08FBBA02DDE659EE62BD0031FE2DB785596EF509302446B030852_u256,
//         y: 0xE0F1575A4C633CC719DFEE5FDA862D764EFC96C3F30EE0055C42C23F184ED8C6_u256,
//     };
//     assert(gen.scalar_mul(4) == gen_4, 'G_R1 * 4 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_5() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_5 = PointR1 {
//         x: 0x51590B7A515140D2D784C85608668FDFEF8C82FD1F5BE52421554A0DC3D033ED_u256,
//         y: 0xE0C17DA8904A727D8AE1BF36BF8A79260D012F00D4D80888D1D0BB44FDA16DA4_u256,
//     };
//     assert(gen.scalar_mul(5) == gen_5, 'G_R1 * 5 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_6() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_6 = PointR1 {
//         x: 0xB01A172A76A4602C92D3242CB897DDE3024C740DEBB215B4C6B0AAE93C2291A9_u256,
//         y: 0xE85C10743237DAD56FEC0E2DFBA703791C00F7701C7E16BDFD7C48538FC77FE2_u256,
//     };
//     assert(gen.scalar_mul(6) == gen_6, 'G_R1 * 6 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_7() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_7 = PointR1 {
//         x: 0x8E533B6FA0BF7B4625BB30667C01FB607EF9F8B8A80FEF5B300628703187B2A3_u256,
//         y: 0x73EB1DBDE03318366D069F83A6F5900053C73633CB041B21C55E1A86C1F400B4_u256,
//     };
//     assert(gen.scalar_mul(7) == gen_7, 'G_R1 * 7 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_8() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_8 = PointR1 {
//         x: 0x62D9779DBEE9B0534042742D3AB54CADC1D238980FCE97DBB4DD9DC1DB6FB393_u256,
//         y: 0xAD5ACCBD91E9D8244FF15D771167CEE0A2ED51F6BBE76A78DA540A6A0F09957E_u256,
//     };
//     assert(gen.scalar_mul(8) == gen_8, 'G_R1 * 8 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_9() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_9 = PointR1 {
//         x: 0xEA68D7B6FEDF0B71878938D51D71F8729E0ACB8C2C6DF8B3D79E8A4B90949EE0_u256,
//         y: 0x2A2744C972C9FCE787014A964A8EA0C84D714FEAA4DE823FE85A224A4DD048FA_u256,
//     };
//     assert(gen.scalar_mul(9) == gen_9, 'G_R1 * 9 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_10() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_10 = PointR1 {
//         x: 0xCEF66D6B2A3A993E591214D1EA223FB545CA6C471C48306E4C36069404C5723F_u256,
//         y: 0x878662A229AAAE906E123CDD9D3B4C10590DED29FE751EEECA34BBAA44AF0773_u256,
//     };
//     assert(gen.scalar_mul(10) == gen_10, 'G_R1 * 10 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_11() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_11 = PointR1 {
//         x: 0x3ED113B7883B4C590638379DB0C21CDA16742ED0255048BF433391D374BC21D1_u256,
//         y: 0x9099209ACCC4C8A224C843AFA4F4C68A090D04DA5E9889DAE2F8EEFCE82A3740_u256,
//     };
//     assert(gen.scalar_mul(11) == gen_11, 'G_R1 * 11 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_12() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_12 = PointR1 {
//         x: 0x741DD5BDA817D95E4626537320E5D55179983028B2F82C99D500C5EE8624E3C4_u256,
//         y: 0x0770B46A9C385FDC567383554887B1548EEB912C35BA5CA71995FF22CD4481D3_u256,
//     };
//     assert(gen.scalar_mul(12) == gen_12, 'G_R1 * 12 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_13() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_13 = PointR1 {
//         x: 0x177C837AE0AC495A61805DF2D85EE2FC792E284B65EAD58A98E15D9D46072C01_u256,
//         y: 0x63BB58CD4EBEA558A24091ADB40F4E7226EE14C3A1FB4DF39C43BBE2EFC7BFD8_u256,
//     };
//     assert(gen.scalar_mul(13) == gen_13, 'G_R1 * 13 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_14() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_14 = PointR1 {
//         x: 0x54E77A001C3862B97A76647F4336DF3CF126ACBE7A069C5E5709277324D2920B_u256,
//         y: 0xF599F1BB29F4317542121F8C05A2E7C37171EA77735090081BA7C82F60D0B375_u256,
//     };
//     assert(gen.scalar_mul(14) == gen_14, 'G_R1 * 14 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_15() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_15 = PointR1 {
//         x: 0xF0454DC6971ABAE7ADFB378999888265AE03AF92DE3A0EF163668C63E59B9D5F_u256,
//         y: 0xB5B93EE3592E2D1F4E6594E51F9643E62A3B21CE75B5FA3F47E59CDE0D034F36_u256,
//     };
//     assert(gen.scalar_mul(15) == gen_15, 'G_R1 * 15 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_16() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_16 = PointR1 {
//         x: 0x76A94D138A6B41858B821C629836315FCD28392EFF6CA038A5EB4787E1277C6E_u256,
//         y: 0xA985FE61341F260E6CB0A1B5E11E87208599A0040FC78BAA0E9DDD724B8C5110_u256,
//     };
//     assert(gen.scalar_mul(16) == gen_16, 'G_R1 * 16 Fail');
// }
// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_17() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_17 = PointR1 {
//         x: 0x47776904C0F1CC3A9C0984B66F75301A5FA68678F0D64AF8BA1ABCE34738A73E_u256,
//         y: 0xAA005EE6B5B957286231856577648E8381B2804428D5733F32F787FF71F1FCDC_u256,
//     };
//     assert(gen.scalar_mul(17) == gen_17, 'G_R1 * 17 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_18() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_18 = PointR1 {
//         x: 0x1057E0AB5780F470DEFC9378D1C7C87437BB4C6F9EA55C63D936266DBD781FDA_u256,
//         y: 0xF6F1645A15CBE5DC9FA9B7DFD96EE5A7DCC11B5C5EF4F1F78D83B3393C6A45A2_u256,
//     };
//     assert(gen.scalar_mul(18) == gen_18, 'G_R1 * 18 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_19() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_19 = PointR1 {
//         x: 0xCB6D2861102C0C25CE39B7C17108C507782C452257884895C1FC7B74AB03ED83_u256,
//         y: 0x58D7614B24D9EF515C35E7100D6D6CE4A496716E30FA3E03E39150752BCECDAA_u256,
//     };
//     assert(gen.scalar_mul(19) == gen_19, 'G_R1 * 19 Fail');
// }

// #[test]
// #[available_gas(4000000000)]
// fn gen_scalar_mul_20() {
//     let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y,  };
//     let gen_20 = PointR1 {
//         x: 0x83A01A9378395BAB9BCD6A0AD03CC56D56E6B19250465A94A234DC4C6B28DA9A_u256,
//         y: 0x76E49B6DE2F73234AE6A5EB9D612B75C9F2202BB6923F54FF8240AAA86F640B8_u256,
//     };
//     assert(gen.scalar_mul(20) == gen_20, 'G_R1 * 20 Fail');
// }


