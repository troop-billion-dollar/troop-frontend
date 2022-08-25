import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:troop/components/auth/controller/auth_states.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthNotifier({required this.authenticationRepository})
      : super(Unauthenticated());

  Future<void> register(String username, String email, String password,
      String repassword, String city) async {
    try {
      state = Unauthenticated()..isLoading = true;

      User? user = await authenticationRepository
          .registerUserWithEmailAndPassowrd(email, password);
      state = Authenticated(user: user)..isLoading;
    } catch (e) {
      state = Unauthenticated();
    }
  }

  Future<void> login() async {
    try {
      state = Unauthenticated()..isLoading = true;
    } catch (e) {}
  }

  Future<void> forgotPassword() async {
    try {
      state = Unauthenticated()..isLoading = true;
    } catch (e) {}
  }

  Future<void> logout() async {
    try {
      state = Unauthenticated()..isLoading = true;
    } catch (e) {}
  }
}
