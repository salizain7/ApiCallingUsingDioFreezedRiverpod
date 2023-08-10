import 'dart:io';

import 'package:firstflutter/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'src/core/utils/constant/local_storage_constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final container = ProviderContainer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initial hive local db and open box for language
  var path = (await getApplicationDocumentsDirectory()).path;
  Hive.init(path);
  await Hive.openBox(langBox);
  await Hive.openBox(themeBox);

  runApp(const ProviderScope(child: MyApp()));
}
