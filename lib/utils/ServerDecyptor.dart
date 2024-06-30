class ServerDecryptor{
  String decryptAllAnimeServer(String decrypt) {
    StringBuffer decryptedString = StringBuffer();

    for (int i = 0; i < decrypt.length; i += 2) {
      String hex = decrypt.substring(i, i + 2);
      int dec = int.parse(hex, radix: 16);
      int xor = dec ^ 56;
      String oct = xor.toRadixString(8).padLeft(3, '0');
      int decryptedCharCode = int.parse(oct, radix: 8);
      decryptedString.write(String.fromCharCode(decryptedCharCode));
    }

    return decryptedString.toString();
  }
}