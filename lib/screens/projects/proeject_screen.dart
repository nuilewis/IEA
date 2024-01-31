import 'package:flutter/material.dart';

import '../../core/core.dart';

class ProjectScreen extends StatefulWidget {
  static  const  id = "project screen";
    const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {


  


  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class CategoryItem extends StatelessWidget {
  final bool onSelected;
  final String title;
    const CategoryItem({
    super.key,
    this.onSelected = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding:
            const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding2x),
        color: onSelected ? Theme.of(context).colorScheme.primary  : theme.cardColor,
      ),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium!
            .copyWith(color: onSelected ? Colors.white : theme.iconTheme.color),
      ),
    );
  }
}
