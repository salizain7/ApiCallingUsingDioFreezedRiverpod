import 'package:dartz/dartz.dart';
import 'package:firstflutter/src/core/network/error/failures.dart';
import 'package:firstflutter/src/features/authentication/domain/entities/params/login_params.dart';
import 'package:firstflutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firstflutter/src/shared/domain/usecases/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginUseCase extends UseCase<String, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    final result = await repository.login(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

