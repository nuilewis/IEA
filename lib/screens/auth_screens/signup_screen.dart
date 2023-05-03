import 'package:flutter/material.dart';

import '../../core/core.dart';


class SignUpScreen extends StatefulWidget {
  static const id = "sign up screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key confirmPassKey = GlobalKey();
  final Key emailKey = GlobalKey();
  final Key nameKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Sign up", style: theme.textTheme.displayLarge),
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
                        key: _formKey,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Name",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                TextFormField(
                                  key: nameKey,
                                  controller: nameController,
                                  decoration: customTextFieldDecoration
                                      .copyWith(hintText: "name"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please input a name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: kDefaultPadding),
                                Text(
                                  "Email",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                TextFormField(
                                  key: emailKey,
                                  controller: emailController,
                                  decoration: customTextFieldDecoration
                                      .copyWith(hintText: "email"),
                                  validator: (value) {
                                    if (!value!.contains("@")) {
                                      return "Please Input a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: kDefaultPadding),
                                const Text("Password"),
                                TextFormField(
                                  key: passkey,
                                  controller: passwordController,
                                  decoration: customTextFieldDecoration
                                      .copyWith(hintText: "Password"),
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return "Your password is too short";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: kDefaultPadding),
                                const Text("Confirm Password"),
                                TextFormField(
                                  key: confirmPassKey,
                                  controller: confirmPassController,
                                  decoration: customTextFieldDecoration
                                      .copyWith(hintText: "Password"),
                                  validator: (value) {
                                    if (confirmPassController.text ==
                                        passwordController.text) {
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
                                  text: "Sign up",
                                  textColor: Colors.white,
                                  bgColor: kPurple,
                                ),
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
