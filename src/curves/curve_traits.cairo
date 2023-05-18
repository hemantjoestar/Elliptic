#[derive(Drop, Copy, PartialEq)]
struct AffinePoint<T> {
    x: T,
    y: T,
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
    fn new(x: T, y: T) -> Result<AffinePoint<T>, felt252>;
    fn scalar_mul(self: AffinePoint<T>, scalar: T) -> AffinePoint<T>;
}

trait TYPEConstants<T> {
    fn ZERO() -> T;
    fn ONE() -> T;
    fn TWO() -> T;
    fn THREE() -> T;
}
