import 'package:dartz/dartz.dart';
import 'package:firstflutter/src/core/network/error/failures.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';

abstract class AuthRepository {
  // Login Method Repository
  Future<Either<Failure, String>> login(LoginParams params);
}
