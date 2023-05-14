use ec_verify::ec_verify::r1_point::PointR1;
use ec_verify::secp256r1_constants;
use ec_verify::ec_verify::curve_traits::CurveTraits;
use result::ResultTrait;
use debug::PrintTrait;

#[test]
#[available_gas(4000000000)]
fn key_gen_1() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_1 = PointR1 {
        x: 0xd0720dc691aa80096ba32fed1cb97c2b620690d06de0317b8618d5ce65eb728f_u256,
        y: 0x9681b517b1cda17d0d83d335d9c4a8a9a9b0b1b3c7106d8f3c72bc5093dc275f_u256,
    };

    let key = 0xc9806898a0334916c860748880a541f093b579a9b1f32934d86c363c39800357_u256;
    assert(gen.scalar_mul(key) == pair_1, 'key_gen_1 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_2() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_2 = PointR1 {
        x: 0xf6836a8add91cb182d8d258dda6680690eb724a66dc3bb60d2322565c39e4ab9_u256,
        y: 0x1f837aa32864870cb8e8d0ac2ff31f824e7beddc4bb7ad72c173ad974b289dc2_u256,
    };

    let key = 0x710735c8388f48c684a97bd66751cc5f5a122d6b9a96a2dbe73662f78217446d_u256;
    assert(gen.scalar_mul(key) == pair_2, 'key_gen_2 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_3() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_3 = PointR1 {
        x: 0x76711126cbb2af4f6a5fe5665dad4c88d27b6cb018879e03e54f779f203a854e_u256,
        y: 0xa26df39960ab5248fd3620fd018398e788bd89a3cea509b352452b69811e6856_u256,
    };

    let key = 0x78d5d8b7b3e2c16b3e37e7e63becd8ceff61e2ce618757f514620ada8a11f6e4_u256;
    assert(gen.scalar_mul(key) == pair_3, 'key_gen_3 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_4() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_4 = PointR1 {
        x: 0xe1aa7196ceeac088aaddeeba037abb18f67e1b55c0a5c4e71ec70ad666fcddc8_u256,
        y: 0xd7d35bdce6dedc5de98a7ecb27a9cd066a08f586a733b59f5a2cdb54f971d5c8_u256,
    };

    let key = 0x2a61a0703860585fe17420c244e1de5a6ac8c25146b208ef88ad51ae34c8cb8c_u256;
    assert(gen.scalar_mul(key) == pair_4, 'key_gen_4 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_5() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_5 = PointR1 {
        x: 0x1f038c5422e88eec9e88b815e8f6b3e50852333fc423134348fc7d79ef8e8a10_u256,
        y: 0x43a047cb20e94b4ffb361ef68952b004c0700b2962e0c0635a70269bc789b849_u256,
    };

    let key = 0x01b965b45ff386f28c121c077f1d7b2710acc6b0cb58d8662d549391dcf5a883_u256;
    assert(gen.scalar_mul(key) == pair_5, 'key_gen_5 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_6() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_6 = PointR1 {
        x: 0x7258f2ab96fc84ef6ccb33e308cd392d8b568ea635730ceb4ebd72fa870583b9_u256,
        y: 0x489807ca55bdc29ca5c8fe69b94f227b0345cccdbe89975e75d385cc2f6bb1e2_u256,
    };

    let key = 0xfac92c13d374c53a085376fe4101618e1e181b5a63816a84a0648f3bdc24e519_u256;
    assert(gen.scalar_mul(key) == pair_6, 'key_gen_6 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_7() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_7 = PointR1 {
        x: 0xd2e01411817b5512b79bbbe14d606040a4c90deb09e827d25b9f2fc068997872_u256,
        y: 0x503f138f8bab1df2c4507ff663a1fdf7f710e7adb8e7841eaa902703e314e793_u256,
    };

    let key = 0xf257a192dde44227b3568008ff73bcf599a5c45b32ab523b5b21ca582fef5a0a_u256;
    assert(gen.scalar_mul(key) == pair_7, 'key_gen_7 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_8() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_8 = PointR1 {
        x: 0x55bed2d9c029b7f230bde934c7124ed52b1330856f13cbac65a746f9175f85d7_u256,
        y: 0x32805e311d583b4e007c40668185e85323948e21912b6b0d2cda8557389ae7b0_u256,
    };

    let key = 0xadd67e57c42a3d28708f0235eb86885a4ea68e0d8cfd76eb46134c596522abfd_u256;
    assert(gen.scalar_mul(key) == pair_8, 'key_gen_8 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_9() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_9 = PointR1 {
        x: 0x5190277a0c14d8a3d289292f8a544ce6ea9183200e51aec08440e0c1a463a4e4_u256,
        y: 0xecd98514821bd5aaf3419ab79b71780569470e4fed3da3c1353b28fe137f36eb_u256,
    };

    let key = 0x4494860fd2c805c5c0d277e58f802cff6d731f76314eb1554142a637a9bc5538_u256;
    assert(gen.scalar_mul(key) == pair_9, 'key_gen_9 Fail');
}

#[test]
#[available_gas(4000000000)]
fn key_gen_10() {
    let gen = PointR1 { x: secp256r1_constants::R1_G_X, y: secp256r1_constants::R1_G_Y };
    let pair_10 = PointR1 {
        x: 0xfbcea7c2827e0e8085d7707b23a3728823ea6f4878b24747fb4fd2842d406c73_u256,
        y: 0x2393c85f1f710c5afc115a39ba7e18abe03f19c9d4bb3d47d19468b818efa535_u256,
    };

    let key = 0xd40b07b1ea7b86d4709ef9dc634c61229feb71abd63dc7fc85ef46711a87b210_u256;
    assert(gen.scalar_mul(key) == pair_10, 'key_gen_10 Fail');
}

