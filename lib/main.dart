import 'dart:io';

import 'package:firstflutter/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'src/core/utils/constant/local_storage_constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final container = ProviderContainer();

Future<void> main() async {
  var path = Directory.current.path;
  Hive.init(path);
  await Hive.openBox(langBox);

  runApp(const ProviderScope(child: MyApp()));
}
