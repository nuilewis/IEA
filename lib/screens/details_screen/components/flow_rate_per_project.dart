import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_card.dart';

class FlowRatePerProject extends StatelessWidget {
  final bool isNormal;
  const FlowRatePerProject({
    Key? key,
    required this.isNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: 271.86,
      height: 208,
      child: CustomCard(
        showShadow: true,
        shadowColor: kPurple20,
        bgColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 100,
          ),
          child: Container(
            width: 136,
            height: 96,

            // alignment: Alignment.bottomLeft,

            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(20)),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 28),
                  child: Text(
                    "3,456",
                    style: theme.textTheme.displayLarge!
                        .copyWith(fontSize: 20, color: Colors.black87),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "m/s2",
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
