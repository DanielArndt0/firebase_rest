import 'FirestoreTypes.dart';

class BooleanValue with FirestoreType<bool> {
  final bool value;
  BooleanValue({required this.value});

  factory BooleanValue.fromJson(Map<String, dynamic> json) {
    return BooleanValue(value: json[FirestoreTypeList.booleanValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.booleanValue.name: value};
  }

  @override
  String toString() => FirestoreTypeList.booleanValue.name;

  @override
  bool getValue() => value;
}
