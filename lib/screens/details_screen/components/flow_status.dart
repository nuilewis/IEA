import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/custom_card.dart';

class FlowStatus extends StatelessWidget {
  final bool isNormal;
    const FlowStatus({
    super.key,
    required this.isNormal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      showShadow: true,
      bgColor: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Text("Status", style: theme.textTheme.bodyLarge),
            const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            padding:   const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
            decoration: BoxDecoration(
                color: isNormal ? AppColours.green70 : AppColours.redSeed,
                borderRadius: BorderRadius.circular(kDefaultPadding2x)),
            child: Text(
              isNormal ? "Normal" : "Abnormal",
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
