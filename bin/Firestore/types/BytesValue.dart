import 'FirestoreTypes.dart';

class BytesValue with FirestoreType<String> {
  final String value;
  BytesValue({required this.value});

  factory BytesValue.fromJson(Map<String, dynamic> json) {
    return BytesValue(value: json[FirestoreTypeList.bytesValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.bytesValue.name: value};
  }

  @override
  String toString() => FirestoreTypeList.bytesValue.name;

  @override
  String getValue() => value;
}
