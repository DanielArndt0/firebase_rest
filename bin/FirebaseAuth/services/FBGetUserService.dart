import 'dart:convert';

import 'package:http/http.dart' as Http;
import '../FirebaseAuthConstants.dart';

class FBGetUserService {
  String? _getUserEndpoint;
  final String apiKey;

  FBGetUserService({
    required this.apiKey,
  }) {
    _getUserEndpoint = FirebaseAuthConstants.userDataEndpoint;
  }

  Future<Http.Response> getUserData({
    required String idToken,
    Function(Http.Response response)? onComplete,
    Function(Http.Response response)? onError,
  }) =>
      Http.post(
        Uri.parse(_getUserEndpoint! + apiKey),
        body: jsonEncode({
          'idToken': idToken,
        }),
        headers: {'Content-type': 'application/json'},
      );

  set getUserEndpoint(String endpoint) => _getUserEndpoint = endpoint;
}
