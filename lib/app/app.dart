import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app/navigation/routes.dart';
import 'package:routemaster/routemaster.dart';

class TroopApp extends ConsumerStatefulWidget {
  const TroopApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TroopAppState();
}

class _TroopAppState extends ConsumerState<TroopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        return routes;
      }),
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryColor: const Color(0xff000321),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
