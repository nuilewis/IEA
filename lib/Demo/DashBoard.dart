import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:map_admin/models/MyFiles.dart';
import 'search_field.dart';
import 'constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static String tag = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Boxes(),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),,.kl
                    height: 500,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Column(children: const [
                      Text(
                        "Umap Analysis",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Chart()
                    ]),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}






class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "Dashboard",
        style: Theme.of(context).textTheme.headline6,
      ),
      const Spacer(),
      const Expanded(
        child: SearchField(),
      ),
      const Profile()
    ]);
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: secondaryColor),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.jpg",
            height: 38,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Alouzeh Brandone"),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Piechart(),
    );
  }
}
