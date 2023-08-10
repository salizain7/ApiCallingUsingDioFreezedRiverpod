import 'package:dartz/dartz.dart';
import 'package:firstflutter/src/core/network/error/failures.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_api.dart';
import 'package:firstflutter/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:firstflutter/src/features/authentication/domain/entities/params/login_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  // Login Method Repository
  Future<Either<Failure, String>> login(LoginParams params);
}


