import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop_ui/troop_ui.dart';

import '../../../../app/navigation/routes.dart';
import '../../global_widgets/global_widgets.dart';

import '../auth.dart';

//TODO: Implement routing without context
class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authNotifierProvider.notifier);
    
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
                    controller: notifier.userNameCtr,
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
                    hintText: 'E-mail Address',
                    controller: notifier.phoneEmailCtr,
                    validator: notifier.emailValidator,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Password',
                    shouldObscure: true,
                    controller: notifier.passwordCtr1,
                    validator: notifier.passwordValidator,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Re-Password',
                    shouldObscure: true,
                    controller: notifier.rePasswordCtr,
                    validator: (value) async {
                      if (value == null ||
                          value.isEmpty ||
                          value != notifier.passwordCtr1.text) {
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
                    controller: notifier.cityCtr,
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
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        final e = await notifier.register();
                        if (e == null) {
                          Routemaster.of(context).replace(AppRoutes.home);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e)),
                          );
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
