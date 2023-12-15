import 'package:http/http.dart' as Http;
import '../FirebaseAuthConstants.dart';
import 'FBAuthService.dart';

class FBSigninService {
  String? _signinEndpoint;
  final String apiKey;

  FBSigninService({
    required this.apiKey,
  }) {
    _signinEndpoint = FirebaseAuthConstants.signinEndpoint;
  }

  Future<Http.Response> signinUser({
    required String email,
    required String password,
  }) =>
      FBAuthService.authUser(
        url: _signinEndpoint! + apiKey,
        email: email,
        password: password,
      );

  set signinEndpoint(String endpoint) => _signinEndpoint = endpoint;
}
