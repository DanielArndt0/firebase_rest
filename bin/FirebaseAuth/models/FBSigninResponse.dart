class FBSigninResponse {
  final String idToken;
  final String email;
  final String refreshToken;
  final String expiresIn;
  final String localId;
  final bool registered;

  FBSigninResponse({
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
    required this.registered,
    required this.idToken,
  });

  factory FBSigninResponse.fromJson(Map<String, dynamic> json) {
    return FBSigninResponse(
      idToken: json['idToken'],
      email: json['email'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
      localId: json['localId'],
      registered: json['registered'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idToken': idToken,
      'email': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
      'registered': registered,
    };
  }
}
