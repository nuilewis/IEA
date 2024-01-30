import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_project/screens/widgets/button.dart';

import '../../../core/core.dart';

class AddProjectForm extends StatefulWidget {
  const AddProjectForm({super.key});

  @override
  State<AddProjectForm> createState() => _AddProjectFormState();
}

class _AddProjectFormState extends State<AddProjectForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:   const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap( kDefaultPadding),
              Text("Create a New Project", style: theme.textTheme.headlineSmall),
              const Gap( kDefaultPadding2x),
              Text(
                "Project Name",
                style: theme.textTheme.bodyMedium,
              ),
            const Gap( kDefaultPadding / 2),
              TextFormField(
                controller: nameController,
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
            const Gap( kDefaultPadding),
              const Text(
                "Description",
              ),
            const Gap(8),
              TextFormField(
                controller: emailController,
                decoration: AppInputDecoration.inputDecoration(context)
                    .copyWith(hintText: "Description"),
                // validator: (value) {
                //   if (!value!.contains("@")) {
                //     return "Please Input a valid email address";
                //   } else {
                //     return null;
                //   }
                // },
                maxLines: 3,
              ),
            const Gap( kDefaultPadding),
              Text(
                "Location",
                style: theme.textTheme.bodyLarge,
              ),
            const Gap(8),
              TextFormField(
        
                controller: locationController,
                obscureText: true,
                decoration: AppInputDecoration.inputDecoration(context)
                    .copyWith(hintText: "Location"),
                validator: (value) {
                  return null;
        
                  ///Todo: validate form field
                },
              ),
            const Gap( kDefaultPadding2x),
              CustomButton(onPressed: (){}, label: "Create Project")
            ],
          ),
        ),
      ),
    );
  }
}
