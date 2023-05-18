use Elliptic::curves::curve_traits::{
    ECCurveTraits, ModularArithmetic, CurveParameters, TYPEConstants, AffinePoint
};
use zeroable::Zeroable;
use Elliptic::egcd;
use traits::Into;

impl ECCurveTraitsImpl<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    impl TPartialEq: PartialEq<T>,
    // TODO: Fix this. i think becuae egcd doesnt take traits 
    impl TIntoGCD: Into<T, u256>,
    impl GCDIntoT: Into<u256, T>,
    // TODO: Fix above
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of ECCurveTraits<T> {
    fn new(x: T, y: T) -> Result<AffinePoint<T>, felt252> {
        // TODO: TO deciide to keep here or remove to seperate function
        // Initially was. Allows for modularity
        // But requires functions wil long signatures for traits passing
        let (P, A, B, (_, _), _) = CParams::get_curve_paramters();
        let lhs = TModA::modular_mul(y, y, P);
        let rhs_left = TModA::modular_mul(TModA::modular_mul(x, x, P), x, P);
        let rhs_centre = TModA::modular_mul(A, x, P);
        let rhs_right = B;
        let rhs = TModA::modular_add(TModA::modular_add(rhs_left, rhs_centre, P), rhs_right, P);
        if lhs == rhs {
            return Result::Ok(AffinePoint { x, y });
        }
        let err: felt252 = 'POINT_NOT_ON_CURVE'.into();
        Result::Err(err)
    }
    fn scalar_mul(self: AffinePoint<T>, scalar: T) -> AffinePoint<T> {
        let mut result = AffinePointZeroable::zero();
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

impl AffinePointAdd<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    // TODO: Fix this. i think becuae egcd doesnt take traits 
    // Breaks Everything by autousing concrete type of felt
    impl TIntoGCD: Into<T, u256>,
    impl GCDIntoT: Into<u256, T>,
    // impl GCDintoT: TryInto<u256, T>,
    // TODO: Fix above
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of Add<AffinePoint<T>> {
    fn add(lhs: AffinePoint<T>, rhs: AffinePoint<T>) -> AffinePoint<T> {
        if lhs.is_zero() {
            return rhs;
        }
        if rhs.is_zero() {
            return lhs;
        }
        let mut lambda = TConstants::ZERO();
        let (P, A, _, (_, _), _) = CParams::get_curve_paramters();
        if lhs == rhs {
            if lhs.y == AffinePointZeroable::zero().y {
                return AffinePointZeroable::zero();
            } else {
                // TODO: Fix this. i think becuae egcd doesnt take traits 
                let numerator_left = TModA::modular_mul(
                    TConstants::THREE(), TModA::modular_mul(lhs.x, lhs.x, P), P
                );
                let numerator_right = A;
                let numerator = TModA::modular_add(numerator_left, numerator_right, P);
                let inv_denominator = egcd::mod_inv(
                    P.into(), TModA::modular_mul(TConstants::TWO(), lhs.y, P).into()
                )
                    .into();
                lambda = TModA::modular_mul(numerator, inv_denominator, P);
            }
        } else {
            if lhs.x == rhs.x {
                return AffinePointZeroable::zero();
            } else {
                let numerator = TModA::modular_sub(rhs.y, lhs.y, P);
                let inv_denominator = numerator;
                // TODO: Fix this. i think becuae egcd doesnt take traits 
                // it was OK as an excercise into concrete conversion
                // but trait being asked all over the place ex. in ECCurvetraits
                let inv_denominator = egcd::mod_inv(
                    P.into(), TModA::modular_sub(rhs.x, lhs.x, P).into()
                )
                    .into();
                // V Bad. 
                lambda = TModA::modular_mul(numerator, inv_denominator, P);
            }
        }
        let x_r = TModA::modular_sub(
            TModA::modular_sub(TModA::modular_mul(lambda, lambda, P), lhs.x, P), rhs.x, P
        );
        let y_r = TModA::modular_sub(
            TModA::modular_mul(lambda, TModA::modular_sub(lhs.x, x_r, P), P), lhs.y, P
        );
        AffinePoint { x: x_r, y: y_r }
    }
}

impl AffinePointAddEq<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TRem: Rem<T>,
    impl TDiv: Div<T>,
    // TODO: Fix this. i think becuae egcd doesnt take traits 
    impl TIntoGCD: Into<T, u256>,
    impl GCDIntoT: Into<u256, T>,
    impl TPartialEq: PartialEq<T>,
    impl TModA: ModularArithmetic<T>,
    impl CParams: CurveParameters<T>,
    impl TZero: Zeroable<T>,
    impl TConstants: TYPEConstants<T>,
> of AddEq<AffinePoint<T>> {
    #[inline(always)]
    fn add_eq(ref self: AffinePoint<T>, other: AffinePoint<T>) {
        self = AffinePointAdd::add(self, other);
    }
}

impl AffinePointZeroable<
    T,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>,
    impl TZero: Zeroable<T>,
    impl TPartialEq: PartialEq<T>,
> of Zeroable<AffinePoint<T>> {
    fn zero() -> AffinePoint<T> {
        AffinePoint { x: TZero::zero(), y: TZero::zero() }
    }
    #[inline(always)]
    fn is_zero(self: AffinePoint<T>) -> bool {
        self == AffinePointZeroable::<T>::zero()
    }
    #[inline(always)]
    fn is_non_zero(self: AffinePoint<T>) -> bool {
        !self.is_zero()
    }
}

