import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'auhtentication_errors.dart';

/// Thrown when signing in anonymously process fails.

/// {@template authentication_repository}
/// Repository which manages user authentication using Firebase Authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  const AuthenticationRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  /// Registers user with email and password
  ///
  /// Throws [AuthException] when registration fails.
  Future<firebase_auth.User?> registerUserWithEmailAndPassowrd(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await signInWithEmailAndPassword(email, password);
    } catch (e) {
      if (e is firebase_auth.FirebaseAuthException)
        throw _handleAuthExceptions(e, email);
      throw AuthException('Some error occured');
    }
  }

  /// Logs in into the app as with Email and Password
  ///
  /// Throws [AuthException] when operation fails.
  Future<firebase_auth.User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCred.user;
    } catch (e) {
      if (e is firebase_auth.FirebaseAuthException)
        throw _handleAuthExceptions(e, email);
      throw AuthException('Some error occured.');
    }
  }

  /// Updates User's DisplayName
  ///
  /// Throws [UserException] when operation fails.
  Future<void> updateDisplayName(String name) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
    } catch (_) {
      throw UserException();
    }
  }

  /// Sign-out user
  ///
  /// Throws [UserException] when operation fails.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw UserException();
    }
  }

  /// Forgot password
  ///
  /// Throws [AuthException] when operation fails.
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (e is firebase_auth.FirebaseAuthException)
        throw _handleAuthExceptions(e, email);
      throw AuthException("Some unexpected error occured.");
    }
  }

  /// Get's email verification status
  bool get isEmailVerified => _firebaseAuth.currentUser?.emailVerified ?? false;

  /// Handles [firebase_auth.FirebaseAuthException]
  /// returns [AuthException] with appropriate message.
  AuthException _handleAuthExceptions(
    firebase_auth.FirebaseAuthException e,
    String? email,
  ) {
    if (e.code.contains('user-disabled'))
      return AuthException('User is disabled.');
    if (e.code.contains('invalid-email'))
      return AuthException('Email: $email is invalid.');
    if (e.code.contains('wrong-password'))
      return AuthException('Entered password is incorrect.');
    if (e.code.contains('user-not-found'))
      return AuthException('User not found.');
    if (e.code.contains('email-already-in-use'))
      return AuthException('Email: $email is already registered.');
    if (e.code.contains('weak-password'))
      return AuthException(
          'Password is too weak. Please enter strong password.');
    if (e.code.contains('user-not-found'))
      return AuthException('Email address not registered.');
    return AuthException("Some unexpected error occured.");
  }
}
