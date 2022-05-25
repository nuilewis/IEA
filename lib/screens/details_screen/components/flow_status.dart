
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../global_components/custom_card.dart';

class FlowStatus extends StatelessWidget {
  final bool isNormal;
  const FlowStatus({
    Key? key, required this.isNormal,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
    bgColor: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Status", style: theme.textTheme.bodyText1),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: isNormal ? kGreen: kFuchsia,
                borderRadius:
                    BorderRadius.circular(kDefaultPadding2x)),
            child: Text( isNormal? "Normal":"Abnormal", style:  theme.textTheme.bodyText1!.copyWith(fontSize: 20),),
          )
        ],
      ),
    );
  }
}
