import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../../app/navigation/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Routemaster.of(context).replace(AppRoutes.register),
          child: const Text('Login Page'),
        ),
      ),
    );
  }
}
