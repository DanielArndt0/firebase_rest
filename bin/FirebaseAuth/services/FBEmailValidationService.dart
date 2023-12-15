import 'dart:convert';

import 'package:http/http.dart' as Http;
import '../FirebaseAuthConstants.dart';

class FBEmailValidationService {
  String? _emailValidationEndpoint;
  final String apiKey;

  FBEmailValidationService({
    required this.apiKey,
  }) {
    _emailValidationEndpoint = FirebaseAuthConstants.emailValidationEndpoint;
  }

  Future<Http.Response> sendEmailVerification({
    required String idToken,
    Function(Http.Response response)? onComplete,
    Function(Http.Response response)? onError,
  }) =>
      Http.post(
        Uri.parse(_emailValidationEndpoint! + apiKey),
        body: jsonEncode({
          'idToken': idToken,
          'requestType': 'VERIFY_EMAIL',
        }),
        headers: {'Content-type': 'application/json'},
      );

  set emailValidationEndpoint(String endpoint) =>
      _emailValidationEndpoint = endpoint;
}
