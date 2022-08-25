import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop_ui/troop_ui.dart';
import '../../../../app/navigation/routes.dart';
import '../../global_widgets/global_widgets.dart';
import '../auth.dart';

TextEditingController passwordCtr = TextEditingController();
TextEditingController phoneEmailUsernameCtr = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000321),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
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
                  height: 60,
                ),
                InputField(
                  hintText: 'Phone number, username or email',
                  controller: phoneEmailUsernameCtr,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  hintText: 'Password',
                  controller: passwordCtr,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: TroopColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TroopButton(
                  buttonTitle: "Log in",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Create new account?",
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
                      Routemaster.of(context).replace(AppRoutes.register),
                  child: const Center(
                    child: Text(
                      "Sign Up",
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
    );
  }
}
