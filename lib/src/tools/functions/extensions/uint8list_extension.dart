part of 'extensions.dart';

Uint8List hexToUint8List(String hexString) {
  List<int> bytes = [];
  for (int i = 0; i < hexString.length; i += 2) {
    String hexPair = hexString.substring(i, i + 2);
    int byte = int.parse(hexPair, radix: 16);
    bytes.add(byte);
  }
  return Uint8List.fromList(bytes);
}

extension Uint8ListExtension on Uint8List {
  String toHexString() {
    final StringBuffer buffer = StringBuffer();

    for (final int byte in this) {
      buffer.write(byte.toRadixString(16).padLeft(2, '0'));
    }

    return buffer.toString();
  }

  String toUtf8String() => utf8.decode(this);

  String toUtf16String() => String.fromCharCodes(this);
}

extension IntListExtension on List<int> {
  String toUtf16String() => String.fromCharCodes(this);

  String toUtf8String() => utf8.decode(this);

  String toHexString() {
    final StringBuffer buffer = StringBuffer();

    for (final int byte in this) {
      buffer.write(byte.toRadixString(16).padLeft(2, '0'));
    }

    return buffer.toString();
  }
}
