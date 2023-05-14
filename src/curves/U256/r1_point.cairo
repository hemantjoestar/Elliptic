use ec_verify::curves::curve_traits::CurveParameters;

mod secp256r1_constants {
    const R1_P: u256 = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF;
    const R1_PMINUS2: u256 = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFD;
    const R1_A: u256 = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC;
    const R1_B: u256 = 0x5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B;
    const R1_G_X: u256 = 0x6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296;
    const R1_G_Y: u256 = 0x4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5;
    const R1_N: u256 = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551;
}

impl R1CurveParameters of CurveParameters<u256> {
    fn get_curve_paramters() -> (u256, u256, u256, (u256, u256), u256) {
        (
            secp256r1_constants::R1_P,
            secp256r1_constants::R1_A,
            secp256r1_constants::R1_B,
            (secp256r1_constants::R1_G_X, secp256r1_constants::R1_G_Y),
            secp256r1_constants::R1_N,
        )
    }
}
