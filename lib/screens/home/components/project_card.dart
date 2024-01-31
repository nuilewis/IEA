import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/models.dart';
import '../../widgets/button.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(project.name, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          const Gap(8),
          Text(project.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium),
          const Gap(16),

          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 200,
              child: CustomButton(
                label: "View Project",
                iconData: FluentIcons.arrow_right_24_regular,
                onPressed: () {
                  ///Todo:Navigate to the project details page
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}