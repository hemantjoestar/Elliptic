const ZERO: u256 = 0_u256;
const ONE: u256 = 1_u256;

fn egcd_prime(prime: u256, other: u256, t_1: u256, t_2: u256, iter: u256) -> (u256, u256) {
    let quotient = prime / other;
    let rem = prime % other;
    if rem == ZERO {
        (t_2, iter)
    } else {
        let t = t_1 + quotient * t_2;
        let iter = iter + 1;
        egcd_prime(other, rem, t_2, t, iter)
    }
}
fn mod_inv(prime: u256, other: u256) -> u256 {
    // Initialize
    // assert prime > other. egcd doesnt account for that
    let (psuedo_inverse, iter) = egcd_prime(prime, other, 0, 1, 0);
    if iter % 2_u256 != 0 {
        prime - psuedo_inverse
    } else {
        psuedo_inverse
    }
}
