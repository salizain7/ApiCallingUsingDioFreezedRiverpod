import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firstflutter/src/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier({
    required this.loginUseCase,
  }) : super(const AuthState.initial());

  // Login method
  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await loginUseCase
        .call(LoginParams(email: "email", password: "password"));

    state = await response.fold(
      (failure) {
        return AuthState.failure(failure.errorMessage);
      },
      (user) async {
        return const AuthState.success();
      },
    );
  }
}
