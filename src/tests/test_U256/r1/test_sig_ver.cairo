use Elliptic::tests::test_U256::r1::test_utilities::{get_sig, verify_sig, known_point_on_curve};

#[test]
#[available_gas(40000000000)]
fn against_known_sha() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    // sha_256('starknet')
    let sha256_message: u256 = 0xfd187671a1d5f861b976693a967019778bb2aaac30a36b419311ab63c741e9c9;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'starknet sig ver fail');
}
#[test]
#[available_gas(40000000000)]
fn against_known_sha_1() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    let sha256_message: u256 = 0x9781f2eccf6075d6971346c33cdf205378d0fe2f600aae5483982746d2080200;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'Hash > 512 sig ver fail');
}
#[test]
#[available_gas(40000000000)]
fn against_known_sha_2() {
    let pk: u256 = 0xb6faf2c8922235c589c27368a3b3e6e2f42eb6073bf9507f19eed0746c79dced;
    let k: u256 = 0x9980b9cdfcef3ab8e219b9827ed6afdd4dbf20bd927e9cd01f15762703487007;

    let Qx: u256 = 0xe0e7b99bc62d8dd67883e39ed9fa0657789c5ff556cc1fd8dd1e2a55e9e3f243;
    let Qy: u256 = 0x63fbfd0232b95578075c903a4dbf85ad58f8350516e1ec89b0ee1f5e1362da69;

    let pubK = known_point_on_curve(x: Qx, y: Qy);

    let sha256_message: u256 = 0x55e6d9b9697db24aa6b143d8f4d0866a44748a876e1ab262c3a9df982290cabd;

    let sig = get_sig(pk, k, pubK, sha256_message);
    assert(verify_sig(pubK, sig, sha256_message), 'Hash CWP sig ver fail');
}
