import 'FirestoreTypes.dart';

class MapValue with FirestoreType<Map<String, FirestoreType>> {
  final Map<String, FirestoreType> value;
  MapValue({required this.value});

  factory MapValue.fromJson(Map<String, dynamic> json) {
    return MapValue(value: json[FirestoreTypeList.mapValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      FirestoreTypeList.mapValue.name: {'fields': value}
    };
  }

  @override
  String toString() => FirestoreTypeList.mapValue.name;

  @override
  Map<String, FirestoreType> getValue() => value;
}
