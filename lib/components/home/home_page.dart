import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:troop/app/navigation/routes.dart';

import '../auth/controller/auth_notifier.dart';

//TODO: Implement routing without context
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: (() {
            notifier.logout();
            Routemaster.of(context).replace(AppRoutes.login);
          }),
        ),
      ),
      body: Container(
        child: const Text('Home'),
      ),
    );
  }
}
