import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop/theme/troop_theme_extension.dart';
import 'package:troop_ui/troop_ui.dart';

import '../../../../app/navigation/routes.dart';
import '../../../global_widgets/global_widgets.dart';

TextEditingController userNameCtr = TextEditingController();
TextEditingController phoneEmailCtr = TextEditingController();
TextEditingController passwordCtr1 = TextEditingController();
TextEditingController rePasswordCtr = TextEditingController();
TextEditingController cityCtr = TextEditingController();

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  height: 25,
                ),
                Text(
                  "Welcome to Troop,",
                  key: const ValueKey("welcome_to_troop_text"),
                  style: Theme.of(context)
                      .textTheme
                      .normalSize
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sign Up in just 2 Steps!",
                  key: const ValueKey("sign_up_text"),
                  style: Theme.of(context)
                      .textTheme
                      .normalSize
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  hintText: 'Username',
                  key: const ValueKey("username_field"),
                  controller: userNameCtr,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  hintText: 'E-mail Address or Phone number',
                  key: const ValueKey("email_and_phone_field"),
                  controller: phoneEmailCtr,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  hintText: 'Password',
                  key: const ValueKey("password_field"),
                  controller: passwordCtr1,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  hintText: 'Re-Password',
                  key: const ValueKey("re_password_field"),
                  controller: rePasswordCtr,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(
                  hintText: 'City',
                  key: const ValueKey("city_field"),
                  controller: cityCtr,
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
                          value: true,
                          activeColor: TroopColors.white,
                          onChanged: ((value) {})),
                    ),
                    Text(
                      "Agree terms and conditions",
                      key: const ValueKey("agree_terms_and_conditions_text"),
                      style: Theme.of(context)
                          .textTheme
                          .normalSize
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TroopButton(
                  buttonTitle: "Sign up",
                  key: const ValueKey("sign_up_buttpn"),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Already have an account?",
                    key: const ValueKey("already_have_an_account_text"),
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
                  onTap: () => Routemaster.of(context).replace(AppRoutes.login),
                  child: Center(
                    child: Text(
                      "Log In",
                      key: const ValueKey("login_text"),
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
