import 'package:troop/components/home/presentation/home_page.dart';

import 'transition_page.dart' as custom_transition;
import '../../components/auth/presentation/auth.dart';

const _login = '/login';
const _register = '/register';
const _home = '/home';

abstract class AppRoutes {
  static String get home => _home;
  static String get login => _login;
  static String get register => _register;
}

final routesLoggedOut = RouteMap(
  onUnknownRoute: (_) => const Redirect(_login),
  routes: {
    _login: (_) => const custom_transition.TransitionPage(
          child: LoginPage(),
        ),
    _register: (_) => const custom_transition.TransitionPage(
          child: RegisterPage(),
        ),
    _home: (_) => const custom_transition.TransitionPage(
          child: HomePage(),
        ),
  },
);
