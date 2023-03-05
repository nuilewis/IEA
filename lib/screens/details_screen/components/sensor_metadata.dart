import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_card.dart';

class SensorMetaData extends StatelessWidget {
  const SensorMetaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      bgColor: Colors.white,
      shadowColor: kPurple20,
      child: Column(
        //  mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [],
      ),
    );
  }
}
