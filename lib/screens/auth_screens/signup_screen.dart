import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/widgets/button.dart';

class SignUpScreen extends StatefulWidget {
  static const id = "sign up screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key emailKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: screenSize.width * .3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register",
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  "Email",
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: kDefaultPadding),
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
                const SizedBox(height: kDefaultPadding),
                TextFormField(
                  key: passkey,
                  controller: passwordController,
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
                const Text("Confirm Password"),
                const SizedBox(height: kDefaultPadding),
                TextFormField(
                  key: passkey,
                  controller: confirmPassController,
                  decoration:
                      customTextFieldDecoration.copyWith(hintText: "Password"),
                  validator: (value) {
                    if (confirmPassController.text == passwordController.text) {
                      return "Your password's don't match";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: kDefaultPadding2x),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ///TODO: add methods to register the user

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
