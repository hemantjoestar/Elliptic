use ec_verify::curves::curve_traits::{ModularArithmetic, TYPEConstants};
use integer::{
    u512_safe_div_rem_by_u256, u256_try_as_non_zero, u256_wide_mul, u256_overflow_sub,
    u256_overflowing_add
};
use zeroable::Zeroable;
use option::OptionTrait;

mod U256_constants {
    const ZERO: u256 = 0_u256;
    const ONE: u256 = 1_u256;
    const TWO: u256 = 2_u256;
    const THREE: u256 = 3_u256;
}
impl U256ConstantsImpl of TYPEConstants<u256> {
    fn ZERO() -> u256 {
        U256_constants::ZERO
    }
    fn ONE() -> u256 {
        U256_constants::ONE
    }
    fn TWO() -> u256 {
        U256_constants::TWO
    }
}

impl U256Zeroable of Zeroable<u256> {
    fn zero() -> u256 {
        U256_constants::ZERO
    }
    #[inline(always)]
    fn is_zero(self: u256) -> bool {
        self == U256_constants::ZERO
    }
    #[inline(always)]
    fn is_non_zero(self: u256) -> bool {
        !self.is_zero()
    }
}

impl U256ModularArithmetic of ModularArithmetic<u256> {
    fn modular_sub(self: u256, rhs: u256, modulus: u256) -> u256 {
        // 'ms'.print();
        let (d, c) = u256_overflow_sub(self, rhs);
        let (e, c_prime) = u256_overflowing_add(d, modulus);
        if c == c_prime {
            return e;
        } else {
            return d;
        }
    }
    fn modular_add(self: u256, rhs: u256, modulus: u256) -> u256 {
        // 'ma'.print();
        let (d, c) = u256_overflowing_add(self, rhs);
        let (e, c_prime) = u256_overflow_sub(d, modulus);
        if c == c_prime {
            return e;
        } else {
            return d;
        }
    }
    // TODO: If corelib doesnt work maybe we need to implement Montgomery reduction
    fn modular_mul(self: u256, rhs: u256, modulus: u256) -> u256 {
        // 'mm'.print();
        let z: NonZero<u256> = u256_try_as_non_zero(modulus).unwrap();
        let (_, rem) = u512_safe_div_rem_by_u256(u256_wide_mul(self, rhs), z);
        rem
    }
}
