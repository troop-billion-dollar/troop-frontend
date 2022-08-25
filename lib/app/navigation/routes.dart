import 'package:troop/components/home/home_page.dart';

import 'transition_page.dart' as customTransition;
import '../../components/auth/auth.dart';
import 'package:routemaster/routemaster.dart';

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
    _login: (_) => const customTransition.TransitionPage(
          child: LoginPage(),
        ),
    _register: (_) => const customTransition.TransitionPage(
          child: RegisterPage(),
        ),
  },
);

final routesLoggedIn = RouteMap(routes: {
  _home: (_) => const customTransition.TransitionPage(child: HomePage())
});
