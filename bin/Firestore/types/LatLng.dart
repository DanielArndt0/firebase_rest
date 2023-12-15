import 'FirestoreTypes.dart';

class LatLng with FirestoreType {
  final num latitude;
  final num longitude;
  LatLng({
    required this.latitude,
    required this.longitude,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return LatLng(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  getValue() {}
}
