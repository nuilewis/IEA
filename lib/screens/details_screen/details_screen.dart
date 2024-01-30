import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_card.dart';
import '../widgets/header.dart';
import 'components/display_flow_rate.dart';
import 'components/flow_status.dart';
import 'components/sensor_metadata.dart';
import '../../core/core.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

class DetailsScreen extends StatefulWidget {
  static  const id = "details screen";
    const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<SensorProvider>(builder: (context, sensorData, child) {
      return Scaffold(
        body: Row(
          children: [
              const SizedBox(width: kDefaultPadding2x),
            Expanded(
              flex: 13,
              child: ListView(
                children: [
                    const SizedBox(
                    height: kDefaultPadding2x,
                  ),
                    const Align(
                      alignment: Alignment.centerRight, child: Header()),
                  Text(
                    "Sensor 1",
                    style: theme.textTheme.displayLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary ),
                  ),
                    const SizedBox(
                    height: kDefaultPadding * 3,
                  ),
                  const SizedBox(
                    height: 160,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SensorMetaData(),
                            SizedBox(width: kDefaultPadding2x),

                          ///Current Flow Rate
                            DisplayFlowRate(
                            flowRate: FlowRate(flowRate: 10, velocity: 10),
                          ),
                            SizedBox(
                            width: kDefaultPadding2x,
                          ),

                          ///Normal or Abnormal
                            FlowStatus(
                            isNormal: true,
                          ),
                            SizedBox(width: kDefaultPadding2x),
                          // CustomButton(
                          //   onPressed: () {},
                          //   text: "Locate On Map",
                          //   showIcon: true,
                          //   iconLink: "assets/svg/map_pin.svg",
                          // )
                        ],
                      ),
                    ),
                  ),
                    const SizedBox(height: kDefaultPadding2x),
                  CustomCard(
                    bgColor: Colors.white,
                    shadowColor: Theme.of(context).cardColor,
                    child: const Column(
                      children: [
                        Row(
                          children:   [
                            CategoryItem(
                              title: "Today",
                              onSelected: true,
                            ),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Weekly"),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Monthly"),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Lifetime"),
                          ],
                        ),
                          SizedBox(height: kDefaultPadding2x),
                      ],
                    ),
                  )
                ],
              ),
            ),
              const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SizedBox(
                height: double.infinity,
              ),
            )
          ],
        ),
      );
    });
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
