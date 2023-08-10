import 'package:firstflutter/src/features/authentication/presentation/providers/auth_providers.dart';
import 'package:firstflutter/src/shared/presentation/pages/background_page.dart';
import 'package:firstflutter/src/shared/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);

    return BackgroundPage(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.toString()),
          ButtonWidget(
            text: "Call Api",
            onPressed: () {
              ref.read(authStateNotifierProvider.notifier).loginUser(
                    "username",
                    "password",
                  );
            },
          )
        ],
      ),
    ));
  }
}
