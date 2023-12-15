class Precondition {
  final bool? exists;
  final String? updateTime;

  Precondition({
    this.exists,
    this.updateTime,
  });

  factory Precondition.fromJson(Map<String, dynamic> json) {
    return Precondition(
      exists: json['exists'],
      updateTime: json['updateTime'],
    );
  }

  Map<String, dynamic> toJson() => {
        'exists': exists,
        'updateTime': updateTime,
      };
}
