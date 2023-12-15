class Document {
  final String name;
  final Map<String, dynamic>? fields;
  final String createTime;
  final String updateTime;

  Document({
    required this.name,
    required this.fields,
    required this.createTime,
    required this.updateTime,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      name: json['name'],
      fields: json['fields'],
      createTime: json['createTime'],
      updateTime: json['updateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'fields': fields,
      'createTime': createTime,
      'updateTime': updateTime,
    };
  }
}
