import 'dart:convert';

import 'package:http/http.dart' as Http;

class FBAuthService {
  static Future<Http.Response> authUser({
    required String url,
    required String email,
    required String password,
  }) async {
    return await Http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      headers: {'Content-type': 'application/json'},
    );
  }
}
