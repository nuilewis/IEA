import 'package:flutter/material.dart';

import '../../widgets/custom_card.dart';

class NumberOfProjects extends StatelessWidget {
  final bool isNormal;
    const NumberOfProjects({
    super.key,
    required this.isNormal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: 271.86,
      height: 208,
      child: CustomCard(
        showShadow: true,
        bgColor: Theme.of(context).cardColor,
        child: Padding(
          padding:   const EdgeInsets.only(
            top: 50,
            right: 100,
          ),
          child: Container(
            width: 136,
            height: 96,

            // alignment: Alignment.bottomLeft,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)),

            child: Column(
              children: [
                Padding(
                  padding:   const EdgeInsets.only(top: 25, right: 40),
                  child: Text(
                    "02",
                    style: theme.textTheme.displayLarge!
                        .copyWith(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Text(
                  "Projects",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
