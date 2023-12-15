import 'FirestoreTypes.dart';

class ReferenceValue with FirestoreType<String> {
  final String value;
  ReferenceValue({required this.value});

  factory ReferenceValue.fromJson(Map<String, dynamic> json) {
    return ReferenceValue(value: json[FirestoreTypeList.referenceValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.referenceValue.name: value};
  }

  @override
  String toString() => FirestoreTypeList.referenceValue.name;

  @override
  String getValue() => value;
}
