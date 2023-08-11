import 'package:firstflutter/src/core/network/dio_injection.dart';
import 'package:firstflutter/src/features/authentication/auth_injections.dart';
import 'package:firstflutter/src/shared/data/data_source/local/app_local_storage.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> initInjections() async {
  // Dio injection
  await initDioInjection();

  // Core injection
  await initCoreInjections();

  // Auth injection
  await initAuthInjections();
}


// Inject all core dependencies
Future<void> initCoreInjections() async {
  // App local data injection
 sl.registerSingleton<AppLocalStorage>(AppLocalStorage());
}
