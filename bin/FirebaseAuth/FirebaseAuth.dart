import 'dart:convert';

import 'package:http/http.dart' as Http;

import 'models/FBAuthErrorResponse.dart';
import 'models/FBUserModel.dart';
import 'models/FBSigninResponse.dart';
import 'models/FBSignupResponse.dart';
import 'services/FBGetUserService.dart';
import 'services/FBEmailValidationService.dart';
import 'services/FBResetPasswordService.dart';
import 'services/FBSigninService.dart';
import 'services/FBSignupService.dart';
import 'exceptions/FBAuthException.dart';

class FirebaseAuth {
  final String apiKey;
  late FBUserModel _currentUserData;

  late final FBSigninService _signinService;
  late final FBSignupService _signupService;
  late final FBEmailValidationService _emailValidationService;
  late final FBResetPasswordService _resetPasswordService;
  late final FBGetUserService _getUserService;

  FirebaseAuth({
    required this.apiKey,
  }) {
    _signinService = FBSigninService(apiKey: apiKey);
    _signupService = FBSignupService(apiKey: apiKey);
    _emailValidationService = FBEmailValidationService(apiKey: apiKey);
    _resetPasswordService = FBResetPasswordService(apiKey: apiKey);
    _getUserService = FBGetUserService(apiKey: apiKey);
  }

  bool _validateStatusCode(Http.Response response) =>
      response.statusCode / 100 == 2;

  Future<FBUserModel> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _signupService.signupUser(
      email: email,
      password: password,
    );
    if (_validateStatusCode(response)) {
      final resBody = FBSignupResponse.fromJson(jsonDecode(response.body));
      _currentUserData = await _getCurrentUser(idToken: resBody.idToken);
      return currentUser();
    }
    final error =
        FBAuthErrorResponse.fromJson(jsonDecode(response.body)['error']);
    return Future.error(
      FBAuthException(message: error.message, errorObject: error),
      StackTrace.current,
    );
  }

  Future<FBUserModel> signupWithEmailAndPasswordAndConfirmEmail({
    required String email,
    required String password,
  }) async {
    final response = await _signupService.signupUser(
      email: email,
      password: password,
    );
    if (_validateStatusCode(response)) {
      final resBody = FBSignupResponse.fromJson(jsonDecode(response.body));
      await _emailValidationService.sendEmailVerification(
        idToken: resBody.idToken,
      );
      _currentUserData = await _getCurrentUser(idToken: resBody.idToken);
      return currentUser();
    }
    final error =
        FBAuthErrorResponse.fromJson(jsonDecode(response.body)['error']);
    return Future.error(
      FBAuthException(message: error.message, errorObject: error),
      StackTrace.current,
    );
  }

  Future<FBUserModel> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _signinService.signinUser(
      email: email,
      password: password,
    );
    if (_validateStatusCode(response)) {
      final resBody = FBSigninResponse.fromJson(jsonDecode(response.body));
      _currentUserData = await _getCurrentUser(idToken: resBody.idToken);
      return currentUser();
    }
    final error =
        FBAuthErrorResponse.fromJson(jsonDecode(response.body)['error']);
    return Future.error(
      FBAuthException(message: error.message, errorObject: error),
      StackTrace.current,
    );
  }

  Future<Http.Response> sendResetPasswordEmail({required String email}) async {
    final response = await _resetPasswordService.sendPasswordReset(
      email: email,
    );
    if (_validateStatusCode(response)) {
      return response;
    }
    final error =
        FBAuthErrorResponse.fromJson(jsonDecode(response.body)['error']);
    return Future.error(
      FBAuthException(message: error.message, errorObject: error),
      StackTrace.current,
    );
  }

  FBUserModel currentUser() => _currentUserData;

  Future<FBUserModel> _getCurrentUser({required String idToken}) async {
    final response = await _getUserService.getUserData(idToken: idToken);
    if (_validateStatusCode(response)) {
      return (jsonDecode(response.body)['users'] as List)
          .map((e) => FBUserModel.fromJson(e))
          .toList()
          .first;
    }
    final error =
        FBAuthErrorResponse.fromJson(jsonDecode(response.body)['error']);
    return Future.error(
      FBAuthException(message: error.message, errorObject: error),
      StackTrace.current,
    );
  }
}
