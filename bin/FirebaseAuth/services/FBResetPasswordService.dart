import 'dart:convert';
import 'package:http/http.dart' as Http;
import '../FirebaseAuthConstants.dart';

class FBResetPasswordService {
  String? _resetPasswordEndpoint;
  final String apiKey;

  FBResetPasswordService({
    required this.apiKey,
  }) {
    _resetPasswordEndpoint = FirebaseAuthConstants.passwordResetEndpoint;
  }

  Future<Http.Response> sendPasswordReset({
    required String email,
    Function(Http.Response response)? onComplete,
    Function(Http.Response response)? onError,
  }) =>
      Http.post(
        Uri.parse(_resetPasswordEndpoint! + apiKey),
        body: jsonEncode({
          'email': email,
          'requestType': 'PASSWORD_RESET',
        }),
        headers: {'Content-type': 'application/json'},
      );

  set resetPasswordEndpoint(String endpoint) =>
      _resetPasswordEndpoint = endpoint;
}
