import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';
import 'package:water_project/screens/widgets/custom_card.dart';

class FlowRatePerProject extends StatelessWidget {
  final bool isNormal;
    const FlowRatePerProject({
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
                color: AppColours.neutral10, borderRadius: BorderRadius.circular(20)),

            child: Column(
              children: [
                Padding(
                  padding:   const EdgeInsets.only(top: 25, right: 28),
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
