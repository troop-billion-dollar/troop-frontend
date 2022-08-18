import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../../app/navigation/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Routemaster.of(context).replace(AppRoutes.login),
          child: const Text('Register Page'),
        ),
      ),
    );
  }
}
