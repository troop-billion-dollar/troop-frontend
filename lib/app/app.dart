import 'package:flutter/material.dart';
import 'package:troop/theme/troop_theme.dart';
import '../app/navigation/routes.dart';
import 'package:routemaster/routemaster.dart';

class TroopApp extends StatefulWidget {
  const TroopApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TroopAppState();
}

class _TroopAppState extends State<TroopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        return routesLoggedOut;
      }),
      theme: TroopTheme.current(),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
