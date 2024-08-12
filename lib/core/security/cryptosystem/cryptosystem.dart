import 'icryptosystem.dart';

class CryptoSystemImpl {
  ICryptoSystem? cryptoSystem;

  CryptoSystemImpl({this.cryptoSystem});

  String decrypt(String? cipherText) {
    return cipherText == null ? "" : cryptoSystem!.decrypt(cipherText);
  }

  String encrypt(String? plainText) {
    return plainText == null ? "" : cryptoSystem!.encrypt(plainText);
  }
}
