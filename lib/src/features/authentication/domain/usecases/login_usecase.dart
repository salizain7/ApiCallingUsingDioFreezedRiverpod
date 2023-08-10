import 'package:dartz/dartz.dart';
import 'package:firstflutter/src/core/network/error/failures.dart';
import 'package:firstflutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firstflutter/src/shared/domain/usecases/usecase.dart';


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

class LoginParams {
  LoginParams({
    required this.email,
    required this.password,
  });

  late final String email;
  late final String password;

  LoginParams.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data..removeWhere((key, value) => value == null);
  }
}
