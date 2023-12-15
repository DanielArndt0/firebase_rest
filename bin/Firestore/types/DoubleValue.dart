import 'FirestoreTypes.dart';

class DoubleValue with FirestoreType<num> {
  final num value;
  DoubleValue({required this.value});

  factory DoubleValue.fromJson(Map<String, dynamic> json) {
    return DoubleValue(value: json[FirestoreTypeList.doubleValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.doubleValue.name: value.toDouble()};
  }

  @override
  String toString() => FirestoreTypeList.doubleValue.name;

  @override
  num getValue() => value;
}
