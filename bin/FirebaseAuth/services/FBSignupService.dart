import 'package:http/http.dart' as Http;
import '../FirebaseAuthConstants.dart';
import 'FBAuthService.dart';

class FBSignupService {
  final String apiKey;
  String? _signupEndpoint;

  FBSignupService({
    required this.apiKey,
  }) {
    _signupEndpoint = FirebaseAuthConstants.signupEndpoint;
  }

  Future<Http.Response> signupUser({
    required String email,
    required String password,
  }) async =>
      await FBAuthService.authUser(
        url: _signupEndpoint! + apiKey,
        email: email,
        password: password,
      );

  set signupEndpoint(String endpoint) => _signupEndpoint = endpoint;
}
