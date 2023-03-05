import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_card.dart';

class FlowStatus extends StatelessWidget {
  final bool isNormal;
  const FlowStatus({
    Key? key,
    required this.isNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      showShadow: true,
      shadowColor: kPurple20,
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
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
            decoration: BoxDecoration(
                color: isNormal ? kGreen : kFuchsia,
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
