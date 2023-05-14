use zeroable::Zeroable;
use ec_verify::egcd;
use traits::Into;

#[derive(Drop, Copy, PartialEq)]
struct CurvePoint<T> {
    x: T,
    y: T,
}

impl ECCurveTraitsImpl<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of ECCurveTraits<T> {
    fn new(x: T, y: T) -> Result<CurvePoint<T>, felt252> {
        new_point(x, y)
    }
    fn scalar_mul(self: CurvePoint<T>, scalar: T) -> CurvePoint<T> {
        let mut result = CurvePointZeroable::zero();
        let mut tmp = self;
        let mut index = scalar;
        loop {
            if index.is_zero() {
                break ();
            }
            if index % TConstants::TWO() == TConstants::ONE() {
                result += tmp;
            }
            tmp += tmp;
            index = index / TConstants::TWO();
        };
        result
    }
}

impl CurvePointAdd<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    // TODO: Fix this. i think becuae egcd doesnt take traits 
    // Breaks Everything by autousing concrete type of felt
    // impl TIntoGCD: TryInto<T, u256>,
    // impl GCDintoT: TryInto<u256, T>,
    // TODO: Fix bove
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of Add<CurvePoint<T>> {
    fn add(lhs: CurvePoint<T>, rhs: CurvePoint<T>) -> CurvePoint<T> {
        if lhs.is_zero() {
            return rhs;
        }
        if rhs.is_zero() {
            return lhs;
        }
        let mut lambda = TConstants::ZERO();
        let (P, _, _, (_, _), _) = CParams::get_curve_paramters();
        if lhs == rhs {
            if lhs.y == CurvePointZeroable::zero().y {
                return CurvePointZeroable::zero();
            } else {
                // lambda = get_lambda_point_double(lhs, rhs);
                return CurvePointZeroable::zero();
            }
        } else {
            if lhs.x == rhs.x {
                return CurvePointZeroable::zero();
            } else {
                let numerator = TModA::modular_sub(rhs.y, lhs.y, P);
                let inv_denominator = numerator;
            // let inv_denominator = egcd::mod_inv(
            //     // TODO: Fix this. i think becuae egcd doesnt take traits 
            //     // V Bad. 
            //     TIntoGCD::try_into(P).unwrap(),
            //     TIntoGCD::try_into(TModA::modular_sub(rhs.x, lhs.x, P)).unwrap(),
            // );
            // lambda =
            //     TModA::modular_mul(numerator, GCDintoT::try_into(inv_denominator).unwrap(), P);
            }
        }
        let x_r = TModA::modular_sub(
            TModA::modular_sub(TModA::modular_mul(lambda, lambda, P), lhs.x, P), rhs.x, P
        );
        let y_r = TModA::modular_sub(
            TModA::modular_mul(lambda, TModA::modular_sub(lhs.x, x_r, P), P), lhs.y, P
        );
        CurvePoint { x: x_r, y: y_r }
    }
}
// fn get_lambda_point_double(lhs: CurvePoint, rhs: CurvePoint) -> u256 {
//     // let numerator_left = THREE.modular_mul(lhs.x.modular_mul(lhs.x));
//     // let numerator_right = secp256r1_constants::R1_A;
//     // let numerator = numerator_left.modular_add(numerator_right);
//     // let inv_denominator = egcd::mod_inv(secp256r1_constants::R1_P, TWO.modular_mul(lhs.y));
//     // numerator.modular_mul(inv_denominator)
//                 return CurvePointZeroable::zero();
// }
impl CurvePointAddEq<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of AddEq<CurvePoint<T>> {
    #[inline(always)]
    fn add_eq(ref self: CurvePoint<T>, other: CurvePoint<T>) {
        self = CurvePointAdd::add(self, other);
    }
}
impl CurvePointZeroable<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TZero: Zeroable<T>,
    impl TPartialEq: PartialEq<T>,
> of Zeroable<CurvePoint<T>> {
    fn zero() -> CurvePoint<T> {
        CurvePoint { x: TZero::zero(), y: TZero::zero() }
    }
    #[inline(always)]
    fn is_zero(self: CurvePoint<T>) -> bool {
        self == CurvePointZeroable::<T>::zero()
    }
    #[inline(always)]
    fn is_non_zero(self: CurvePoint<T>) -> bool {
        !self.is_zero()
    }
}

fn new_point<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
>(
    x: T, y: T
) -> Result<CurvePoint<T>, felt252> {
    let (P, A, B, (_, _), _) = CParams::get_curve_paramters();
    let lhs = TModA::modular_mul(y, y, P);
    let rhs_left = TModA::modular_mul(TModA::modular_mul(x, x, P), x, P);
    let rhs_centre = TModA::modular_mul(A, x, P);
    let rhs_right = B;
    let rhs = TModA::modular_add(TModA::modular_add(rhs_left, rhs_centre, P), rhs_right, P);
    if lhs == rhs {
        return Result::Ok(CurvePoint { x, y });
    }
    let err: felt252 = 'POINT_NOT_ON_CURVE'.into();
    Result::Err(err)
}


trait ModularArithmetic<T> {
    fn modular_sub(self: T, rhs: T, modulus: T) -> T;
    fn modular_add(self: T, rhs: T, modulus: T) -> T;
    fn modular_mul(self: T, rhs: T, modulus: T) -> T;
}
trait CurveParameters<T> {
    fn get_curve_paramters() -> (T, T, T, (T, T), T);
}
trait ECCurveTraits<T> {
    fn new(x: T, y: T) -> Result<CurvePoint<T>, felt252>;
    fn scalar_mul(self: CurvePoint<T>, scalar: T) -> CurvePoint<T>;
}
trait TYPEConstants<T> {
    fn ZERO() -> T;
    fn ONE() -> T;
    fn TWO() -> T;
}
