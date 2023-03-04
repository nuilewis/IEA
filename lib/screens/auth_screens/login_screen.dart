import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Log In", style: theme.textTheme.displayLarge),
            const SizedBox(height: kDefaultPadding2x),
            SizedBox(
              width: screenSize.width * .7,
              height: screenSize.height * .7,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: kPurple40,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(kDefaultPadding2x))),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(kDefaultPadding2x))),
                      child: Form(
                        key: formKey,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Email",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                TextFormField(
                                  key: emailKey,
                                  controller: emailController,
                                  decoration:
                                      customTextFieldDecoration.copyWith(
                                    hintText: "email",
                                  ),
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
                                  decoration: customTextFieldDecoration
                                      .copyWith(hintText: "Password"),
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return "Your password cannot be less than 8 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: kDefaultPadding * 3),
                                CustomButton(
                                    text: "Login",
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        ///TODO: add methods to sign the user in
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
