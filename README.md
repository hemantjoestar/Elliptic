Parameters
- https://neuromancer.sk/std/x962/prime256v1

Important Resources used
- https://cacr.uwaterloo.ca/hac/about/chap14.pdf
- https://www.bearssl.org/bigint.html
- https://www.math.brown.edu/johsilve/Presentations/WyomingEllipticCurve.pdf
- https://rosettacode.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm#Python
- https://www.cs.uaf.edu/2015/spring/cs463/lecture/02_20_ECC.html
- https://crypto.stanford.edu/pbc/notes/elliptic/group.html

Need to checkout 
- https://eprint.iacr.org/2015/1060.pdf .. Fixed steps for computing

Projectitve
- https://www.nayuki.io/page/elliptic-curve-point-addition-in-projective-coordinates


Test vectors
For Key Pair
- https://csrc.nist.gov/Projects/cryptographic-algorithm-validation-program/digital-signatures
TODO: NIST thas some out of range error.. i have not accomodated for it. file: PKV.rsp

For Scalar Mul, They have scalars greater than U256, i havent accounted for them now
- http://point-at-infinity.org/ecc/nisttv
