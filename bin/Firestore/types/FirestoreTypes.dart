mixin FirestoreType<T> {
  Map<String, dynamic> toJson();

  T getValue();
}

enum FirestoreTypeList {
  nullValue,
  booleanValue,
  integerValue,
  doubleValue,
  timestampValue,
  stringValue,
  bytesValue,
  referenceValue,
  geoPointValue,
  arrayValue,
  mapValue,
}
