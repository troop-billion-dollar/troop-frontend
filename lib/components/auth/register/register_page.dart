import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop/app/app.dart';
import 'package:troop_ui/troop_ui.dart';

import '../../../../app/navigation/routes.dart';
import '../../global_widgets/global_widgets.dart';

import '../auth.dart';

TextEditingController userNameCtr = TextEditingController();
TextEditingController phoneEmailCtr = TextEditingController();
TextEditingController passwordCtr1 = TextEditingController();
TextEditingController rePasswordCtr = TextEditingController();
TextEditingController cityCtr = TextEditingController();

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authNotifierProvider.notifier);
    final state = ref.watch(authNotifierProvider);
    return Scaffold(
      backgroundColor: const Color(0xff000321),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8.5,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/troop_logo.png",
                      height: 96,
                      width: 96,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Welcome to Troop,",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TroopColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Sign Up in just 2 Steps!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TroopColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Username',
                    controller: userNameCtr,
                    keyboardType: TextInputType.name,
                    validator: (value) async {
                      if (value == null || value.isEmpty) {
                        return 'Invalid username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'E-mail Address or Phone number',
                    controller: phoneEmailCtr,
                    validator: (value) async {
                      if (value == null || value.isEmpty) {
                        return 'Invalid E-mail Address or Phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Password',
                    shouldObscure: true,
                    controller: passwordCtr1,
                    validator: (value) async {
                      if (value == null || value.isEmpty) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Re-Password',
                    shouldObscure: true,
                    controller: rePasswordCtr,
                    validator: (value) async {
                      if (value == null || value.isEmpty) {
                        return 'Invalid Re-password';
                      } else if (value != passwordCtr1.text) {
                        return 'Passwords don\'t match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'City',
                    controller: cityCtr,
                    validator: (value) async {
                      if (value == null || value.isEmpty) {
                        return 'Invalid city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            value: notifier.agreetoterms,
                            activeColor: TroopColors.white,
                            onChanged: ((value) {
                              notifier.toggleterms();
                            })),
                      ),
                      const Text(
                        "Agree terms and conditions",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TroopButton(
                    buttonTitle: "Sign up",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        notifier.register(
                          userNameCtr.text,
                          phoneEmailCtr.text,
                          passwordCtr1.text,
                          rePasswordCtr.text,
                          cityCtr.text,
                        );
                        if (state is Authenticated) {
                          Routemaster.of(context).replace(AppRoutes.home);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid Information')),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Routemaster.of(context).replace(AppRoutes.login),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5C59FF),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
