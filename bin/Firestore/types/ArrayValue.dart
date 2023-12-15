import 'FirestoreTypes.dart';

class ArrayValue with FirestoreType<List<FirestoreType>> {
  final List<FirestoreType> value;
  ArrayValue({required this.value});

  factory ArrayValue.fromJson(Map<String, dynamic> json) {
    return ArrayValue(value: json[FirestoreTypeList.arrayValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      FirestoreTypeList.arrayValue.name: {'values': value}
    };
  }

  @override
  String toString() => FirestoreTypeList.arrayValue.name;

  @override
  List<FirestoreType> getValue() => value;
}
