import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/global_components/custom_card.dart';

class DisplayFlowRate extends StatelessWidget {
  final DatabaseReference =
      FirebaseDatabase.instance.reference().child("N18aJdt80LfP9OxnYpi");
  DisplayFlowRate({
    Key? key,
  }) : super(key: key);

//function to read flowrate from realtime database
  readflowrate() {
    DatabaseReference.once().then((snapshot) {
      print(snapshot.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
              // FirebaseAnimatedList(query: DatabaseReference, itemBuilder: (BuildContext context, DataSnapshot snapshot,Animation animation,int index){

              // })

              Text("Current Flow Rate",
                  style: theme.textTheme.bodyText1!.copyWith(color: kPurple)),
              const SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "6.3",
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
                  style: theme.textTheme.bodyText1!.copyWith(color: kPurple)),
              const SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "5.1",
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
  }
}
