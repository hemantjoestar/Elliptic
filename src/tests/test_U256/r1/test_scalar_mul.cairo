use Elliptic::tests::test_U256::r1::test_utilities::{
    init_P256_R1_with_G, known_point_on_curve, point_mul
};
use Elliptic::curves::curve_traits::{AffinePoint};

fn mul(point: AffinePoint<u256>, scalar: u256) -> AffinePoint<u256> {
    point_mul(point, scalar)
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_1() {
    let k = 1;
    let x = 0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296_u256;
    let y = 0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 1 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_2() {
    let k = 2;
    let x = 0x7CF27B188D034F7E8A52380304B51AC3C08969E277F21B35A60B48FC47669978_u256;
    let y = 0x07775510DB8ED040293D9AC69F7430DBBA7DADE63CE982299E04B79D227873D1_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 2 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_3() {
    let k = 3;
    let x = 0x5ECBE4D1A6330A44C8F7EF951D4BF165E6C6B721EFADA985FB41661BC6E7FD6C_u256;
    let y = 0x8734640C4998FF7E374B06CE1A64A2ECD82AB036384FB83D9A79B127A27D5032_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 3 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_4() {
    let k = 4;
    let x = 0xE2534A3532D08FBBA02DDE659EE62BD0031FE2DB785596EF509302446B030852_u256;
    let y = 0xE0F1575A4C633CC719DFEE5FDA862D764EFC96C3F30EE0055C42C23F184ED8C6_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 4 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_5() {
    let k = 5;
    let x = 0x51590B7A515140D2D784C85608668FDFEF8C82FD1F5BE52421554A0DC3D033ED_u256;
    let y = 0xE0C17DA8904A727D8AE1BF36BF8A79260D012F00D4D80888D1D0BB44FDA16DA4_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 5 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_6() {
    let k = 6;
    let x = 0xB01A172A76A4602C92D3242CB897DDE3024C740DEBB215B4C6B0AAE93C2291A9_u256;
    let y = 0xE85C10743237DAD56FEC0E2DFBA703791C00F7701C7E16BDFD7C48538FC77FE2_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 6 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_7() {
    let k = 7;
    let x = 0x8E533B6FA0BF7B4625BB30667C01FB607EF9F8B8A80FEF5B300628703187B2A3_u256;
    let y = 0x73EB1DBDE03318366D069F83A6F5900053C73633CB041B21C55E1A86C1F400B4_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 7 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_8() {
    let k = 8;
    let x = 0x62D9779DBEE9B0534042742D3AB54CADC1D238980FCE97DBB4DD9DC1DB6FB393_u256;
    let y = 0xAD5ACCBD91E9D8244FF15D771167CEE0A2ED51F6BBE76A78DA540A6A0F09957E_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 8 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_9() {
    let k = 9;
    let x = 0xEA68D7B6FEDF0B71878938D51D71F8729E0ACB8C2C6DF8B3D79E8A4B90949EE0_u256;
    let y = 0x2A2744C972C9FCE787014A964A8EA0C84D714FEAA4DE823FE85A224A4DD048FA_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 9 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_10() {
    let k = 10;
    let x = 0xCEF66D6B2A3A993E591214D1EA223FB545CA6C471C48306E4C36069404C5723F_u256;
    let y = 0x878662A229AAAE906E123CDD9D3B4C10590DED29FE751EEECA34BBAA44AF0773_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 10 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_11() {
    let k = 11;
    let x = 0x3ED113B7883B4C590638379DB0C21CDA16742ED0255048BF433391D374BC21D1_u256;
    let y = 0x9099209ACCC4C8A224C843AFA4F4C68A090D04DA5E9889DAE2F8EEFCE82A3740_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 11 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_12() {
    let k = 12;
    let x = 0x741DD5BDA817D95E4626537320E5D55179983028B2F82C99D500C5EE8624E3C4_u256;
    let y = 0x0770B46A9C385FDC567383554887B1548EEB912C35BA5CA71995FF22CD4481D3_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 12 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_13() {
    let k = 13;
    let x = 0x177C837AE0AC495A61805DF2D85EE2FC792E284B65EAD58A98E15D9D46072C01_u256;
    let y = 0x63BB58CD4EBEA558A24091ADB40F4E7226EE14C3A1FB4DF39C43BBE2EFC7BFD8_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 13 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_14() {
    let k = 14;
    let x = 0x54E77A001C3862B97A76647F4336DF3CF126ACBE7A069C5E5709277324D2920B_u256;
    let y = 0xF599F1BB29F4317542121F8C05A2E7C37171EA77735090081BA7C82F60D0B375_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 14 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_15() {
    let k = 15;
    let x = 0xF0454DC6971ABAE7ADFB378999888265AE03AF92DE3A0EF163668C63E59B9D5F_u256;
    let y = 0xB5B93EE3592E2D1F4E6594E51F9643E62A3B21CE75B5FA3F47E59CDE0D034F36_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 15 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_16() {
    let k = 16;
    let x = 0x76A94D138A6B41858B821C629836315FCD28392EFF6CA038A5EB4787E1277C6E_u256;
    let y = 0xA985FE61341F260E6CB0A1B5E11E87208599A0040FC78BAA0E9DDD724B8C5110_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 16 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_17() {
    let k = 17;
    let x = 0x47776904C0F1CC3A9C0984B66F75301A5FA68678F0D64AF8BA1ABCE34738A73E_u256;
    let y = 0xAA005EE6B5B957286231856577648E8381B2804428D5733F32F787FF71F1FCDC_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 17 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_18() {
    let k = 18;
    let x = 0x1057E0AB5780F470DEFC9378D1C7C87437BB4C6F9EA55C63D936266DBD781FDA_u256;
    let y = 0xF6F1645A15CBE5DC9FA9B7DFD96EE5A7DCC11B5C5EF4F1F78D83B3393C6A45A2_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 18 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_19() {
    let k = 19;
    let x = 0xCB6D2861102C0C25CE39B7C17108C507782C452257884895C1FC7B74AB03ED83_u256;
    let y = 0x58D7614B24D9EF515C35E7100D6D6CE4A496716E30FA3E03E39150752BCECDAA_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 19 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_20() {
    let k = 20;
    let x = 0x83A01A9378395BAB9BCD6A0AD03CC56D56E6B19250465A94A234DC4C6B28DA9A_u256;
    let y = 0x76E49B6DE2F73234AE6A5EB9D612B75C9F2202BB6923F54FF8240AAA86F640B8_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 20 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_112233445566778899() {
    let k = 112233445566778899;
    let x = 0x339150844EC15234807FE862A86BE77977DBFB3AE3D96F4C22795513AEAAB82F_u256;
    let y = 0xB1C14DDFDC8EC1B2583F51E85A5EB3A155840F2034730E9B5ADA38B674336A21_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 112233445566778899 Fail');
}

#[test]
#[available_gas(4000000000)]
fn gen_scalar_mul_112233445566778899112233445566778899() {
    let k = 112233445566778899112233445566778899;
    let x = 0x1B7E046A076CC25E6D7FA5003F6729F665CC3241B5ADAB12B498CD32F2803264_u256;
    let y = 0xBFEA79BE2B666B073DB69A2A241ADAB0738FE9D2DD28B5604EB8C8CF097C457B_u256;

    let r1_gen = init_P256_R1_with_G();
    let gen_result = known_point_on_curve(x, y);
    assert(mul(r1_gen, k) == gen_result, 'G_R1 * 1122.. Fail', );
}

