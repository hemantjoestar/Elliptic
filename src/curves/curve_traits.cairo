#[derive(Drop, Copy, PartialEq)]
struct CurvePoint<T> {
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
    fn new(x: T, y: T) -> Result<CurvePoint<T>, felt252>;
    fn scalar_mul(self: CurvePoint<T>, scalar: T) -> CurvePoint<T>;
}

trait TYPEConstants<T> {
    fn ZERO() -> T;
    fn ONE() -> T;
    fn TWO() -> T;
    fn THREE() -> T;
}
