import 'package:flutter/material.dart';
import '../../core/core.dart';

class LoginScreen extends StatefulWidget {
  static const id = "log up screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red,
      ),
      body: Center(
        child: SizedBox(
          width: screenSize.width > 1200 ? 800 : screenSize.width * .7,
          height: screenSize.height * .9,
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
                    child: LoginForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key passkey = GlobalKey();
  final Key emailKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                const SizedBox(height: kDefaultPadding),
                Text("Login", style: theme.textTheme.displayLarge),
                const SizedBox(height: kDefaultPadding2x),
                Text(
                  "Email",
                  style: theme.textTheme.bodyLarge,
                ),
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
                const SizedBox(height: kDefaultPadding),
                const Text("Password"),
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
                SizedBox(height: kDefaultPadding),
                CustomButton(
                  onPressed: () {
                    ///TODO: add methods to sing in with Google
                  },
                  isSecondary: true,
                  text: "Continue with Google",
                  showIcon: true,
                  iconLink: "assets/svg/google_icon.svg",
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
