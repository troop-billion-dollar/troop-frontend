import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:troop/components/auth/controller/auth_states.dart';

import '../../../app/repo_container.dart';
import '../../../app/utils.dart';

final authNotifierProvider = StateNotifierProvider(
  ((ref) =>
      AuthNotifier(authenticationRepository: RepoContainer.authRepository)),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authenticationRepository;

  //register
  final userNameCtr = TextEditingController();
  final phoneEmailCtr = TextEditingController();
  final passwordCtr1 = TextEditingController();
  final rePasswordCtr = TextEditingController();
  final cityCtr = TextEditingController();

  //login
  final passwordCtr = TextEditingController();
  final phoneEmailUsernameCtr = TextEditingController();


  AuthNotifier({required this.authenticationRepository})
      : super(Unauthenticated());

  bool agreetoterms = true;

  void toggleterms() {
    if (state is Authenticated) return;
    agreetoterms = !agreetoterms;
    state = Unauthenticated();
  }

  Future<String?> register() async {
    try {
      state = Unauthenticated()..isLoading = true;
      User? user =
          await authenticationRepository.registerUserWithEmailAndPassowrd(
              phoneEmailCtr.text.trim(), passwordCtr1.text.trim());
      state = Authenticated(user: user);
    } on AuthException catch (e) {
      state = Unauthenticated();
      log(e.message);
      return e.message;
    }
    return null;
  }

  Future<String?> login(String email, String password) async {
    try {
      state = Unauthenticated()..isLoading = true;
      User? user = await authenticationRepository.signInWithEmailAndPassword(
          email, password);
      state = Authenticated(user: user);
    } on AuthException catch (e) {
      state = Unauthenticated();
      log(e.message);
      return e.message;
    }
    return null;
  }

  Future<void> forgotPassword() async {
    //TODO: implement forgotPassword
  }

  Future<void> logout() async {
    state = Unauthenticated();
  }

  Future<String?> emailValidator(String? value) async {
    if (value == null) {
      return 'Required';
    }
    if (!validateEmail(value)) {
      return 'Invalid E-mail Address ';
    }
    return null;
  }

  Future<String?> passwordValidator(String? value) async {
    if (value == null) {
      return 'Required';
    }
    if (value.length < 8) {
      return 'Enter atleast 8 characters';
    }
    return null;
  }



}
