import 'package:firebase_auth/firebase_auth.dart';
import 'package:troop/models/base_state.dart';

abstract class AuthState extends BaseState {}

class Authenticated extends AuthState {
  final User? user;

  Authenticated({required this.user});
}

class Unauthenticated extends AuthState {}