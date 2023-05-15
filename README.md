Attempt at using using traits and impls to abstract EC functionality. A PoC.

This wouldnt be possible without advanced u256 integer operations built by [orizi](https://github.com/orizi) , u256 literal by [greged93](https://github.com/greged93) and [Shahar Papini](https://github.com/spapinistarkware) for explanation on how to use the trait and impl system. Thank you very much. I couldnt get radix limb operations for modular u256 math to work. 

Thank you Cairo team for giving us this language, its design and for building in public.

An impl of NIST-256 or seck256r1 is available and working.
One can see the [tests](https://github.com/hemantjoestar/Elliptic/tree/master/src/tests/test_U256/r1) to use this implementation

Available:
- key-gen, on curve verification. with respective nist test vectors
- signing and verfification. need to add NIST test vectors

Issues/Problems to fix:
- Implementations not efficient. Tests will validate this. especially during signature verficiation
- egcd is not robust and written assuming primes and not using traits lead to a workaround
- no message hashing inside the verification example. The cairo impl used to generate hashes is [here] (https://github.com/hemantjoestar/sha256)
- Till i improve the ec add operation itll be difficult. i cant run complete sha + verify. My machine is getting overwhelmed. I dont have enough RAM and Swap. Please add [ignore] to tests in sig_ver if problems

For suggestions, suggestions and criticism regarding implementation and design, i would definitely like to hear them and improve from advice. Please raise a PR or One can ping [twitter](https://twitter.com/0xspleen) and discord @ 0xspleen#1434


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
