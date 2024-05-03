import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart' as oldProvider;

import '../../../core/core.dart';
import '../../widgets/button.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key emailKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePasswordText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Consumer(
      builder: (BuildContext context, WidgetRef widget, Widget? child){
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:   const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap( kDefaultPadding),
                  Text("Login", style: theme.textTheme.headlineSmall),
                  const Gap( kDefaultPadding2x),
                  Text(
                    "Email",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const Gap( 8),
                  TextFormField(
                    key: emailKey,
                    controller: emailController,
                    decoration:
                    AppInputDecoration.inputDecoration(context).copyWith(hintText: "Email"),
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return "Please Input a valid email address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap( kDefaultPadding),
                  Text("Password", style: theme.textTheme.bodyMedium,), const Gap( 8),
                  TextFormField(
                    obscureText: _obscurePasswordText,
                    key: passkey,
                    controller: passwordController,
                    decoration:
                    AppInputDecoration.inputDecoration(context).copyWith(hintText: "Password",        suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePasswordText = !_obscurePasswordText;
                        });
                      },
                      icon: Icon(_obscurePasswordText
                          ? FluentIcons.eye_24_regular
                          : FluentIcons.eye_off_24_regular,  color: theme.colorScheme.primary,),
                    ),),
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Your password should be at least 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap( kDefaultPadding2x),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ///TODO: add methods to register the user
                      }
                    },
                    label: "Login",

                  ),
                  const Gap( kDefaultPadding),
                  CustomButton(
                    onPressed: () {
                      ///TODO: add methods to sign in with Google
                    },
                    buttonType: ButtonType.secondary,
                    label: "Continue with Google",
                    iconPath: "assets/svg/google_logo.svg",
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
