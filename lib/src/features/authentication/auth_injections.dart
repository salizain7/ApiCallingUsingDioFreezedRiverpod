import 'package:dio/dio.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_api.dart';
import 'package:firstflutter/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:firstflutter/src/shared/injections.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';

initAuthInjections() {
  // Api layer
  sl.registerSingleton<AuthApi>(AuthApi(sl()));

  // Repository layer
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  // Use-Cases layer
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
}
