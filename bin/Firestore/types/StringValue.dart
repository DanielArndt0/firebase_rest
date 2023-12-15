import 'FirestoreTypes.dart';

class StringValue with FirestoreType<String> {
  final String value;
  StringValue({required this.value});

  factory StringValue.fromJson(Map<String, dynamic> json) {
    return StringValue(value: json[FirestoreTypeList.stringValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.stringValue.name: value};
  }

  @override
  String toString() => FirestoreTypeList.stringValue.name;

  @override
  String getValue() => value;
}
