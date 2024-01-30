import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../widgets/button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key confirmPassKey = GlobalKey();
  final Key emailKey = GlobalKey();
  final Key nameKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(kDefaultPadding),
                Text("Sign up", style: theme.textTheme.headlineSmall),
                const Gap(kDefaultPadding2x),
                Text(
                  "Name",
                  style: theme.textTheme.bodyMedium,
                ),
                const Gap(8),
                TextFormField(
                  key: nameKey,
                  controller: nameController,
                  decoration: AppInputDecoration.inputDecoration(context)
                      .copyWith(hintText: "Your Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please input a name";
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(kDefaultPadding),
                Text(
                  "Email",
                  style: theme.textTheme.bodyLarge,
                ),
                const Gap(8),
                TextFormField(
                  key: emailKey,
                  controller: emailController,
                  decoration: AppInputDecoration.inputDecoration(context)
                      .copyWith(hintText: "Email"),
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Please Input a valid email address";
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(kDefaultPadding),
                const Text("Password"),
                const Gap(8),
                TextFormField(
                  key: passkey,
                  controller: passwordController,
                  obscureText: _obscurePasswordText,
                  decoration:
                  AppInputDecoration.inputDecoration(context).copyWith(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePasswordText = !_obscurePasswordText;
                        });
                      },
                      icon: Icon(_obscurePasswordText
                          ? FluentIcons.eye_24_regular
                          : FluentIcons.eye_off_24_regular,  color: theme.colorScheme.primary,),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Your password should be at least 8 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(kDefaultPadding),
                const Text("Confirm Password"),
                const Gap(8),
                TextFormField(
                  obscureText: _obscureConfirmPasswordText,
                  key: confirmPassKey,
                  controller: confirmPassController,
                  decoration: AppInputDecoration.inputDecoration(context)
                      .copyWith(hintText: "Password",        suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
                      });
                    },
                    icon: Icon(_obscureConfirmPasswordText
                        ? FluentIcons.eye_24_regular
                        : FluentIcons.eye_off_24_regular, color: theme.colorScheme.primary,),
                  ),),
                  validator: (value) {
                    if (confirmPassController.text == passwordController.text) {
                      return null;
                    } else {
                      return "Your passwords don't match";
                    }
                  },
                ),
                const Gap(kDefaultPadding2x),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ///TODO: add methods to register the user
                    }
                  },
                  label: "Sign up",
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
      ),
    );
  }
}
