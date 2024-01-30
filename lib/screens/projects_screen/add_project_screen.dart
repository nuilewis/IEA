import 'package:flutter/material.dart';

import 'components/components.dart';

class AddProjectScreen extends StatelessWidget {
  static const id = "add project screen";
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
            child: const Center(child: AddProjectForm(),),
          ),
        ],
      ),
    );
  }
}

