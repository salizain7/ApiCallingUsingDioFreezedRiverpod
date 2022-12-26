import 'package:firstflutter/src/app.dart';
import 'package:firstflutter/src/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  await init();

  runApp(const
  ProviderScope(
       child: MyApp(),
  )

  );
}

