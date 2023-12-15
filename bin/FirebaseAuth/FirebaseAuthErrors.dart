enum FirebaseAuthErrors {
  // ignore: constant_identifier_names
  INVALID_ID_TOKEN(
    message:
        'The user\'s credential is no longer valid. The user must sign in again.',
  ),
  // ignore: constant_identifier_names
  USER_NOT_FOUND(
    message: 'There is no user record corresponding to this identifier.',
  ),
  // ignore: constant_identifier_names
  EMAIL_NOT_FOUND(
    message: 'There is no user record corresponding to this identifier.',
  ),
  // ignore: constant_identifier_names
  INVALID_PASSWORD(
    message: ' The password is invalid or the user does not have a password.',
  ),
  // ignore: constant_identifier_names
  USER_DISABLED(
    message:
        'The user account has been disabled by an administrator.The user account has been disabled by an administrator.',
  ),
  // ignore: constant_identifier_names
  EMAIL_EXISTS(
    message: 'The email address is already in use by another account.',
  ),
  // ignore: constant_identifier_names
  OPERATION_NOT_ALLOWED(
    message: 'Password sign-in is disabled for this project.',
  ),
  // ignore: constant_identifier_names
  TOO_MANY_ATTEMPTS_TRY_LATER(
    message:
        'We have blocked all requests from this device due to unusual activity. Try again later.',
  ),
  // ignore: constant_identifier_names
  INVALID_EMAIL(
    message: 'Invalid Email',
  ),
  // ignore: constant_identifier_names
  WEAK_PASSWORD(
    message: 'Password should be at least 6 characters',
  ),
  // ignore: constant_identifier_names
  UNKNOWN(
    message: 'Unknown Error.',
  );

  const FirebaseAuthErrors({required this.message});
  final String message;

  static String error(String message) {
    for (var error in FirebaseAuthErrors.values) {
      if (message == error.name) {
        return error.message;
      }
    }
    return message;
  }
}
