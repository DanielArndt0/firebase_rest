class FBUserInfoModel {
  String? providerId;
  String? displayName;
  String? photoUrl;
  String? federatedId;
  String? email;
  String? rawId;
  String? screenName;

  FBUserInfoModel({
    this.providerId,
    this.displayName,
    this.email,
    this.federatedId,
    this.photoUrl,
    this.rawId,
    this.screenName,
  });

  factory FBUserInfoModel.fromJson(Map<String, dynamic> json) {
    return FBUserInfoModel(
      email: json['email'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      federatedId: json['federatedId'],
      rawId: json['rawId'],
      screenName: json['screenName'],
      providerId: json['providerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'federatedId': federatedId,
      'screenName': screenName,
      'rawId': rawId,
      'providerId': providerId,
    };
  }
}
