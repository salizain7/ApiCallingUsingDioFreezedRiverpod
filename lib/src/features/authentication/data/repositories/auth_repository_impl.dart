import 'package:dartz/dartz.dart';
import 'package:firstflutter/src/core/network/error/exceptions.dart';
import 'package:firstflutter/src/core/network/error/failures.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_api.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_client.dart';
import 'package:firstflutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  // Login Method Repository
  @override
  Future<Either<Failure, String>> login(LoginParams params) async {
    try {
      final result = await authApi.login(params);
      return Right(result.data!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }


}