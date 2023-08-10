import 'package:firstflutter/src/features/authentication/presentation/pages/login_page.dart';
import 'package:firstflutter/src/shared/presentation/pages/no_route_defined_page.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static String currentRoute = "/";

  // Route for application
  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {

    // Login Page
      case '/login_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginPage(),
        );


      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => NoRouteDefinedPage(
            routeName: settings.name,
          ),
        );
    }
  }

}
