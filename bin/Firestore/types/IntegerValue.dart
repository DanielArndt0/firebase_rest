import 'FirestoreTypes.dart';

class IntegerValue with FirestoreType {
  final int value;
  IntegerValue({required this.value});

  factory IntegerValue.fromJson(Map<String, dynamic> json) {
    return IntegerValue(value: json[FirestoreTypeList.integerValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.integerValue.name: value.toString()};
  }

  @override
  String toString() => FirestoreTypeList.integerValue.name;

  @override
  getValue() => value;
}
