import 'package:flutter/material.dart';
import 'package:troop/components/auth/presentation/login/login.dart';

TextEditingController passwordCtr = TextEditingController();
TextEditingController phoneEmailUsernameCtr = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    key: const ValueKey("troop_logo_image"),
                    height: 96,
                    width: 96,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InputField(
                  hintText: 'Phone number, username or email',
                  key: const ValueKey("email_and_phone_field"),
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
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot password?",
                      key: const ValueKey("forgot_password_text"),
                      style: Theme.of(context).textTheme.normalSize,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TroopButton(
                  buttonTitle: "Log in",
                  onTap: () {
                    Routemaster.of(context).replace(AppRoutes.home);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Create new account?",
                    key: const ValueKey("create_new_account_text"),
                    style: Theme.of(context)
                        .textTheme
                        .normalSize
                        .copyWith(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () =>
                      Routemaster.of(context).replace(AppRoutes.register),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      key: const ValueKey("sign_up_text"),
                      style: Theme.of(context).textTheme.underlineStyle,
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
