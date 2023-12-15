import '../models/FBAuthErrorResponse.dart';

class FBAuthException implements Exception {
  final String message;
  final FBAuthErrorResponse errorObject;
  FBAuthException({
    required this.message,
    required this.errorObject,
  });

  @override
  String toString() => message;
}
