import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop/components/global_widgets/busyButton.dart';
import 'package:troop_ui/troop_ui.dart';

import '../../../../app/navigation/routes.dart';
import '../../../global_widgets/inputTextField.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: GestureDetector(
            onTap: () => Routemaster.of(context).replace(AppRoutes.login),
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/troop_logo.svg",
                      height: 96,
                      width: 96,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'E-mail Address or Phone number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'Re-Password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    hintText: 'City',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: ((value) {})),
                      const Text(
                        "Agree terms and conditions",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BusyButton(title: "Signup"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "LogIn",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5C59FF),
                      fontSize: 14,
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
