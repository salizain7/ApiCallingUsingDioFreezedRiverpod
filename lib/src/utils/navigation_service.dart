import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!
        .pushNamed(routeName);
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }

  // goBackUntil(String routeName) {
  //   MaterialPageRoute(settings: RouteSettings(name: '/home'), builder: (BuildContext context) { return HomeScreen(); });
  //   return navigatorKey.currentState!.popUntil( ModalRoute.withName('/$routeName'));
  // }

  goBackUntilAndPush(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,ModalRoute.withName('/'));
  }

  Route createRoute(destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  Route createPopUp(destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      opaque: false,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}