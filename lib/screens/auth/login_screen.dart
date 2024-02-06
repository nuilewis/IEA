import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import 'components/login_form.dart';

class LoginScreen extends ConsumerWidget {
  static const id = "log up screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

        final authData = ref.watch(authProvider);

        return Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: screenSize.width > 700 ? 1 : 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Expanded(
                flex: screenSize.width > 700 ? 1 : 3,
                child: const Center(
                  child: LoginForm(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
