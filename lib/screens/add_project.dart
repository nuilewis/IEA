import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';
import 'package:water_project/screens/widgets/button.dart';


class AddProject extends StatefulWidget {
  static   const id = "add project screen";
    const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
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
  final Key nameKey = GlobalKey();
  final Key confirmPasskey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          margin:   const EdgeInsets.only(
              left: 234, right: 234, top: 90, bottom: 100),
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0)),
                      ),
                      height: 708,
                      width: 406,
                      child:   const Text(''))),
              Expanded(
                flex: 11,
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Center(
                        child: SizedBox(
                          // width: screenSize.width * .2,
                          child: Padding(
                            padding:   const EdgeInsets.only(left: 54, right: 53),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Project Name",
                                  style: theme.textTheme.bodyMedium,
                                ),
                                  const SizedBox(height: kDefaultPadding / 2),
                                TextFormField(
                                  key: nameKey,
                                  decoration: AppInputDecoration.inputDecoration(context)
                                      .copyWith(hintText: "project Name"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please input a project name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                  const SizedBox(height: kDefaultPadding2x),
                                  const Text(
                                  "Description",
                                ),
                                  const SizedBox(height: kDefaultPadding / 2),

                                TextFormField(
                                  key: emailKey,
                                  controller: emailController,
                                  decoration: AppInputDecoration.inputDecoration(context)
                                      .copyWith(hintText: "email"),
                                  validator: (value) {
                                    if (!value!.contains("@")) {
                                      return "Please Input a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  maxLines: 10,
                                  minLines: 8,
                                ),

                                  const SizedBox(height: kDefaultPadding2x),
                                Text(
                                  "Location",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                  const SizedBox(height: kDefaultPadding / 2),

                                TextFormField(
                                  key: confirmPasskey,
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: AppInputDecoration.inputDecoration(context)
                                      .copyWith(hintText: "Password"),
                                  validator: (value) {
                                    return null;
                                  
                                    ///Todo: validate form field
                                  },
                                ),
                                //   SizedBox(height: kDefaultPadding/2),
                                Padding(
                                  padding:   const EdgeInsets.only(left: 293),
                                  child: CustomButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        ///TODO: add methods to sign the user in
                                      }
                                    },
                                    text: "SignUp",
                                    textColor: Colors.white,
                                    bgColor: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                  const SizedBox(height: kDefaultPadding),
                              ],
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
      ),
    );
  }
}
