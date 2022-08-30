import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:troop/components/auth/controller/auth_states.dart';

import '../../../app/repo_container.dart';

final authNotifierProvider = StateNotifierProvider(
  ((ref) =>
      AuthNotifier(authenticationRepository: RepoContainer.authRepository)),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthNotifier({required this.authenticationRepository})
      : super(Unauthenticated());

  bool agreetoterms = true;

  void toggleterms() {
    agreetoterms = !agreetoterms;
    state = Unauthenticated();
  }

  Future<void> register(String username, String email, String password,
      String repassword, String city) async {
    try {
      state = Unauthenticated()..isLoading = true;
      User? user = await authenticationRepository
          .registerUserWithEmailAndPassowrd(email, password);
      state = Authenticated(user: user)..isLoading = false;
    } on AuthException catch (e) {
      log(e.message);
      state = Unauthenticated();
    }
    log(state.runtimeType.toString());
  }

  Future<void> login(String email, String password) async {
    try {
      state = Unauthenticated()..isLoading = true;
      User? user = await authenticationRepository.signInWithEmailAndPassword(
          email, password);
      state = Authenticated(user: user)..isLoading = false;
    } on AuthException catch (e) {
      log(e.message);
      state = Unauthenticated()..isLoading = false;
    }
    log(state.runtimeType.toString());
  }

  Future<void> forgotPassword() async {
    //TODO: implement forgotPassword
  }

  Future<void> logout() async {
    state = Unauthenticated()..isLoading = false;
  }
}
