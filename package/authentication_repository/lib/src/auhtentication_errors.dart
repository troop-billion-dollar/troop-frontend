class SignInException implements Exception {}

class UserException implements Exception {}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
