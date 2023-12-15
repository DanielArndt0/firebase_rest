import 'FirestoreTypes.dart';
import 'LatLng.dart';

class GeoPointValue with FirestoreType<LatLng> {
  final LatLng value;
  GeoPointValue({required this.value});

  factory GeoPointValue.fromJson(Map<String, dynamic> json) {
    return GeoPointValue(value: json[FirestoreTypeList.geoPointValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {FirestoreTypeList.geoPointValue.name: value.toJson()};
  }

  @override
  String toString() => FirestoreTypeList.geoPointValue.name;

  @override
  LatLng getValue() => value;
}
