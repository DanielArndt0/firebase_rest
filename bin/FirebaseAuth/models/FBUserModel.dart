import '../models/FBUserInfoModel.dart';

class FBUserModel {
  String? localId;
  String? email;
  bool? emailVerified;
  String? displayName;
  List<FBUserInfoModel?>? providerUserInfo;
  String? photoUrl;
  String? passwordHash;
  num? passwordUpdatedAt;
  String? validSince;
  bool? disabled;
  String? lastLoginAt;
  String? createdAt;
  bool? customAuth;

  FBUserModel({
    this.createdAt,
    this.customAuth,
    this.displayName,
    this.disabled,
    this.email,
    this.emailVerified,
    this.lastLoginAt,
    this.localId,
    this.passwordHash,
    this.passwordUpdatedAt,
    this.photoUrl,
    this.providerUserInfo,
    this.validSince,
  });

  factory FBUserModel.fromJson(Map<String, dynamic> json) {
    return FBUserModel(
      localId: json['localId'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      displayName: json['displayName'],
      providerUserInfo: (json['providerUserInfo'] as List)
          .map((e) => FBUserInfoModel.fromJson(e))
          .toList(),
      photoUrl: json['photoUrl'],
      passwordHash: json['passwordHash'],
      passwordUpdatedAt: json['passwordUpdatedAt'],
      validSince: json['validSince'],
      disabled: json['disabled'],
      lastLoginAt: json['lastLoginAt'],
      createdAt: json['createdAt'],
      customAuth: json['customAuth'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'localId': localId,
      'email': email,
      'emailVerified': emailVerified,
      'displayName': displayName,
      'providerUserInfo': providerUserInfo,
      'photoUrl': photoUrl,
      'passwordHash': passwordHash,
      'passwordUpdatedAt': passwordUpdatedAt,
      'validSince': validSince,
      'disabled': disabled,
      'lastLoginAt': lastLoginAt,
      'createdAt': createdAt,
      'customAuth': customAuth,
    };
  }
}
