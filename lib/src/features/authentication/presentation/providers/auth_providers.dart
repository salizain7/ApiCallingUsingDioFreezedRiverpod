import 'package:firstflutter/src/features/authentication/auth_injection.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firstflutter/src/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:firstflutter/src/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final LoginUseCase loginUseCase = ref.watch(loginUseCaseProvider);
    return AuthNotifier(
      loginUseCase: loginUseCase,
    );
  },
);