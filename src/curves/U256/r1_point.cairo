use ec_verify::curves::U256::u256_common;
use ec_verify::curves::curve_traits::{CurveParameters, ECCurveTraitsImpl, CurvePoint};
use result::ResultTrait;

// helper functions 
fn init_P256_R1_curve_with(x: u256, y: u256) -> CurvePoint<u256> {
    match ECCurveTraitsImpl::<u256>::new(x, y) {
        Result::Ok(x) => x,
        Result::Err(err) => panic_with_felt252(err),
    }
}

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
// impl R1CurveTraitsImpl of CurveTraits<PointR1, u256> {
//     fn get_identity() -> PointR1 {
//         PointR1 { x: ZERO, y: ZERO }
//     }
//     fn is_identity(self: PointR1) -> bool {
//         self == R1CurveTraitsImpl::get_identity()
//     }
//     fn on_curve(self: PointR1) -> bool {
//         let lhs = (self.y).modular_mul(self.y);
//         let rhs_left = ((self.x).modular_mul(self.x)).modular_mul(self.x);
//         let rhs_centre = (secp256r1_constants::R1_A).modular_mul(self.x);
//         let rhs_right = secp256r1_constants::R1_B;
//         let rhs = ((rhs_left).modular_add(rhs_centre)).modular_add(rhs_right);
//         lhs == rhs
//     }
//     fn scalar_mul(self: PointR1, scalar: u256) -> PointR1 {
//         let mut result = PointR1 { x: ZERO, y: ZERO };
//         let mut tmp = self;
//         let mut index = scalar;
//         loop {
//             if index == ZERO {
//                 break ();
//             }
//             if index % TWO == ONE {
//                 result += tmp;
//             }
//             tmp += tmp;
//             index = index / TWO;
//         };
//         result
//     }
// }

// impl PointR1Add of Add<PointR1> {
//     fn add(lhs: PointR1, rhs: PointR1) -> PointR1 {
//         // if lhs.is_identity() {
//         //     // 'lhs_infinity'.print();
//         //     return rhs;
//         // }
//         // if rhs.is_identity() {
//         //     // 'rhs_infinity'.print();
//         //     return lhs;
//         // }
//         let mut lambda = ZERO;
//         if lhs == rhs {
//             if lhs.y == ZERO {
//                 // 'lhs.y == zero'.print();
//                 return PointR1 { x: ZERO, y: ZERO };
//             } else {
//                 // 'lambda_double'.print();
//                 lambda = get_lambda_point_double(lhs, rhs);
//             }
//         } else {
//             if lhs.x == rhs.x {
//                 // 'lhs.x == rhs.x'.print();
//                 return PointR1 { x: ZERO, y: ZERO };
//             } else {
//                 // 'lambda_other'.print();
//                 lambda = get_lambda(lhs, rhs);
//             }
//         }
//         let x_r = ((lambda.modular_mul(lambda)).modular_sub(lhs.x)).modular_sub(rhs.x);
//         let y_r = (lambda.modular_mul(lhs.x.modular_sub(x_r))).modular_sub(lhs.y);
//         PointR1 { x: x_r, y: y_r }
//     }
// }

// fn get_lambda(lhs: PointR1, rhs: PointR1) -> u256 {
//     // TODO: Do we need a zero check, the cases before call here are supposed to manage for it
//     let numerator = rhs.y.modular_sub(lhs.y);
//     let inv_denominator = egcd::mod_inv(secp256r1_constants::R1_P, rhs.x.modular_sub(lhs.x));
//     numerator.modular_mul(inv_denominator)
// }

// fn get_lambda_point_double(lhs: PointR1, rhs: PointR1) -> u256 {
//     let numerator_left = THREE.modular_mul(lhs.x.modular_mul(lhs.x));
//     let numerator_right = secp256r1_constants::R1_A;
//     let numerator = numerator_left.modular_add(numerator_right);
//     let inv_denominator = egcd::mod_inv(secp256r1_constants::R1_P, TWO.modular_mul(lhs.y));
//     numerator.modular_mul(inv_denominator)
// }

// // https://www.bearssl.org/bigint.html
// // TODO: move this inside respective add segment
// // now outside to be visible
// // COORDINATES ARE ALREADY MODULOED TO BE WITHIN THE FIELD
// // to be able to use guarantess from Handbook of Applied Cryptography by A. Menezes, P. van Oorschot and S. Vanstone.
// impl PointR1Neg of Neg<PointR1> {
//     fn neg(a: PointR1) -> PointR1 {
//         PointR1 { x: a.x, y: secp256r1_constants::R1_P - a.y }
//     }
// }

// impl PointR1Sub of Sub<PointR1> {
//     fn sub(lhs: PointR1, rhs: PointR1) -> PointR1 {
//         // '-P Called'.print();
//         lhs + (-rhs)
//     }
// }

// impl PointR1AddEq of AddEq<PointR1> {
//     #[inline(always)]
//     fn add_eq(ref self: PointR1, other: PointR1) {
//         self = Add::add(self, other);
//     }
// }

// impl PointR1SubEq of SubEq<PointR1> {
//     #[inline(always)]
//     fn sub_eq(ref self: PointR1, other: PointR1) {
//         self = Sub::sub(self, other);
//     }
// }


