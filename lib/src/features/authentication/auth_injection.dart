import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_api.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_client.dart';
import 'package:firstflutter/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:firstflutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firstflutter/src/shared/domain/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Auth client
final authClientProvider = Provider<AuthClient>(
      (ref) => AuthClient(
    ref.watch(dioProvider),
  ),
);

// Auth api
final authApiProvider = Provider<AuthApi>(
      (ref) => AuthApi(ref.watch(authClientProvider)),
);

// Auth repository
final authRepositoryProvider = Provider<AuthRepository>(
      (ref) => AuthRepositoryImpl(
    ref.watch(authApiProvider),
  ),
);

// Auth usecase
final loginUseCaseProvider = Provider<LoginUseCase>(
      (ref) => LoginUseCase(
    ref.watch(authRepositoryProvider),
  ),
);
