import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/global_components/custom_card.dart';
import 'package:water_project/providers/flow_rate_data.dart';

class DisplayFlowRate extends StatefulWidget {
  const DisplayFlowRate({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayFlowRate> createState() => _DisplayFlowRateState();
}

class _DisplayFlowRateState extends State<DisplayFlowRate> {
  final databaseReference = FirebaseDatabase.instance.ref("\"");

  ///function to read flow rate from realtime database
  readFlowRate() async {
    DatabaseEvent value = await databaseReference.once();
    print("database value is ${value.snapshot.value}");
    // databaseReference.once().then((snapshot) {
    //   debugPrint("data from database is:");
    //   debugPrint(snapshot.value);
    //   //databaseValue= snaphshot.value;
    // });
  }

  @override
  void initState() {
    readFlowRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FlowRateData>(
      builder: (BuildContext context, flowRateData, child) {
        late String flowRate;
        late String flowVelocity;
        return FutureBuilder(
          future: flowRateData.getFlowData(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              flowRate = flowRateData.flowData!.flowRate.toString();
              flowVelocity = flowRateData.flowData!.velocity.toString();
              return CustomCard(
                bgColor: Colors.white,
                shadowColor: kPurple20,
                showShadow: true,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Current Flow Rate",
                            style:
                            theme.textTheme.bodyText1!.copyWith(color: kPurple)),
                        const SizedBox(height: kDefaultPadding),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: flowRate,
                                  style: theme.textTheme.headline1!
                                      .copyWith(fontSize: 48, color: kPurple)),
                              TextSpan(
                                  text: "m3/min",
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      fontSize: 18, color: kPurple.withOpacity(.5))),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Flow Velocity",
                            style:
                            theme.textTheme.bodyText1!.copyWith(color: kPurple)),
                        const SizedBox(height: kDefaultPadding),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: flowVelocity,
                                  style: theme.textTheme.headline1!
                                      .copyWith(fontSize: 48, color: kPurple)),
                              TextSpan(
                                  text: "m/sec",
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      fontSize: 24, color: kPurple.withOpacity(.5)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Container(child: null) ;
            }
          }
        );
      },
    );
  }
}
