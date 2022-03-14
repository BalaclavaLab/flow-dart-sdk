import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:flow_dart_sdk/fcl/constants.dart';
import 'package:rlp/src/address.dart';

T? enumFromString<T>(List<T> values, String value) {
  return values.firstWhereOrNull((v) => v.toString().split('.')[1] == value);
}

String padLeft(int size, String value) {
  return value.padLeft(size * 2, "0");
}

String withZeroPrefix(String address) {
  if (address.startsWith(ZERO_PREFIX)) {
    return ZERO_PREFIX + padLeft(ADDRESS_BYTE_LENGTH, address.substring(2));
  }
  return ZERO_PREFIX + padLeft(ADDRESS_BYTE_LENGTH, address);
}

String sansZeroPrefix(String address) {
  if (address.startsWith(ZERO_PREFIX)) {
    return padLeft(ADDRESS_BYTE_LENGTH, address.substring(2));
  }
  return padLeft(ADDRESS_BYTE_LENGTH, address);
}

Address toAddress(List<int> address) {
  return Address(withZeroPrefix(hex.encode(address)));
}

Address toBlockId(List<int> blockId) {
  return Address("0x" + padLeft(BLOCK_ID_BYTE_LENGTH, hex.encode(blockId)));
}
