class FBAuthErrorResponse {
  final List<FBAuthError> errors;
  final num code;
  final String message;

  FBAuthErrorResponse({
    required this.code,
    required this.message,
    required this.errors,
  });

  factory FBAuthErrorResponse.fromJson(Map<String, dynamic> json) {
    return FBAuthErrorResponse(
      code: json['code'],
      message: json['message'],
      errors:
          (json['errors'] as List).map((e) => FBAuthError.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'errors': errors,
      };
}

class FBAuthError {
  final String domain;
  final String reason;
  final String message;

  FBAuthError({
    required this.domain,
    required this.reason,
    required this.message,
  });

  factory FBAuthError.fromJson(Map<String, dynamic> json) {
    return FBAuthError(
      domain: json['domain'],
      reason: json['reason'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'domain': domain,
        'reason': domain,
        'message': message,
      };
}
