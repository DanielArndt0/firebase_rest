import 'FirestoreTypes.dart';

class TimestampValue with FirestoreType<DateTime> {
  final DateTime value;
  TimestampValue({required this.value});

  factory TimestampValue.fromJson(Map<String, dynamic> json) {
    return TimestampValue(value: json[FirestoreTypeList.timestampValue.name]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      FirestoreTypeList.timestampValue.name: value.toIso8601String()
    }; // TODO: format to firestore standard
  }

  @override
  String toString() => FirestoreTypeList.timestampValue.name;

  @override
  DateTime getValue() => value;
}
