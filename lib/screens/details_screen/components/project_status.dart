import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/custom_card.dart';

class ProjectStatus extends StatelessWidget {
  final bool isNormal;
    const ProjectStatus({
    super.key,
    required this.isNormal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 271.86,
      height: 208,
      child: CustomCard(
        showShadow: true,
        shadowColor: Theme.of(context).cardColor,
        bgColor: Colors.white,
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
                color: AppColours.green70, borderRadius: BorderRadius.circular(20)),

            child: const Column(
              children:   [
                Padding(
                  padding: EdgeInsets.only(top: 25, right: 10),
                  child: Text(
                    "All Systems",
                    // style: theme.textTheme.bodySmall!
                    //     .copyWith(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "normal",
                    // style: theme.textTheme.bodyText2!
                    //     .copyWith(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
