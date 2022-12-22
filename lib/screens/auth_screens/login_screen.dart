import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';

import '../../core/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  static const id = "log in screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key emailKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SizedBox(
            width: screenSize.width * .3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Log In",
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  "Email",
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                TextFormField(
                  key: emailKey,
                  controller: emailController,
                  decoration:
                      customTextFieldDecoration.copyWith(hintText: "email"),
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Please Input a valid email address";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: kDefaultPadding2x),
                const Text("Password"),
                const SizedBox(height: kDefaultPadding / 2),
                TextFormField(
                  key: passkey,
                  controller: passwordController,
                  obscureText: true,
                  decoration:
                      customTextFieldDecoration.copyWith(hintText: "Password"),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Your password is too short";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: kDefaultPadding * 3),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ///TODO: add methods to sign the user in

                    }
                  },
                  text: "Login",
                  textColor: Colors.white,
                  bgColor: kPurple,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomButton(
                  isSecondary: true,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ///TODO: add methods to sign the user in

                    }
                  },
                  text: "Login",
                  textColor: Colors.white,
                  bgColor: kPurple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
