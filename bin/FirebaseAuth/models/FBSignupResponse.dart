class FBSignupResponse {
  final String idToken;
  final String email;
  final String refreshToken;
  final String expiresIn;
  final String localId;

  FBSignupResponse({
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  factory FBSignupResponse.fromJson(Map<String, dynamic> json) {
    return FBSignupResponse(
      idToken: json['idToken'],
      email: json['email'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
      localId: json['localId'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idToken': idToken,
      'email': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
    };
  }
}
