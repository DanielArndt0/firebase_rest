import 'FirestoreTypes.dart';

class NullValue with FirestoreType<Null> {
  // ignore: prefer_void_to_null
  final Null value;
  NullValue({required this.value});

  factory NullValue.fromJson(Map<String, dynamic> json) {
    return NullValue(value: json[FirestoreTypeList.nullValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.nullValue.name: null};
  }

  @override
  String toString() => FirestoreTypeList.nullValue.name;

  @override
  Null getValue() => value;
}
