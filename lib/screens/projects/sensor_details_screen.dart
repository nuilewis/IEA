import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_project/core/constants.dart';
import '../home/components/top_card.dart';
import '../widgets/header.dart';

class SensorDetailsScreen extends StatefulWidget {
  static const id ="sensor details screen";
  const SensorDetailsScreen({super.key});

  @override
  State<SensorDetailsScreen> createState() => _SensorDetailsScreenState();
}

class _SensorDetailsScreenState extends State<SensorDetailsScreen> {
  bool _isChipSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Header
                const Gap(16),
                const Align(alignment: Alignment.centerRight, child: Header()),


                Text(
                  "Sensor 001",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(16),

                /// Top Cards
                Row(
                  children: [

                    Expanded(
                      flex: 1,
                      child: TopCard(
                          label: "Current Flow Rate",
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "367",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),),

                              TextSpan(
                                  text: " m/s2",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),)
                            ],),
                          ),),
                    ),
                    const Gap(16),
                    Expanded(
                      flex: 1,
                      child: TopCard(
                        backgroundColor: AppColours.green70,
                        color: Colors.white,
                        label: "Status ",
                        child: Text("Normal",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color:
                                        Colors.white)),
                      ),
                    ),

                    const Gap(16),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Map goes here",
                            ),
                          ),
                        )),
                  ],
                ),
                const Gap(32),

                ///Projects Card
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(16),
                Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.sizeOf(context).height *.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FilterChip(

                            label: Row(

                              children: [
                                Icon(FluentIcons.calendar_24_regular, color: _isChipSelected? AppColours.white : Theme.of(context).iconTheme.color,),
                                const Gap(8),
                                Text("This Week", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: _isChipSelected? AppColours.white : Theme.of(context).iconTheme.color,),),
                              ],
                            ),
                            onSelected: (bool value) {

                              setState(() {

                                _isChipSelected = value;
                              });

                            },

                            elevation: 0,
                            backgroundColor: AppColours.blue90,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            padding: const EdgeInsets.all(12),
                            selectedColor: Theme.of(context).colorScheme.primary,
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                           selected: _isChipSelected,
                            checkmarkColor:  _isChipSelected? AppColours.white : Theme.of(context).iconTheme.color,

                          )
                        ],
                      ), const Expanded(
                        child: Center(
                          child: Text(
                            "Graph goes here",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
