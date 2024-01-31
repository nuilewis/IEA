import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final Widget child;
  final String label;
  final Color? backgroundColor;
  final Color? color;
  const TopCard(
      {super.key,
        required this.child,
        required this.label,
        this.backgroundColor,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: color ?? Theme.of(context).textTheme.bodyMedium!.color),
          ),
          const Spacer(),
          child
        ],
      ),
    );
  }
}
