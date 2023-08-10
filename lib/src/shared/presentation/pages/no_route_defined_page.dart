import 'package:firstflutter/src/core/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';

class NoRouteDefinedPage extends StatelessWidget {
  final String? routeName;

  const NoRouteDefinedPage({Key? key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${routeName ?? defaultStr}'),
      ),
    );
  }
}
