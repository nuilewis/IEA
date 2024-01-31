import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_project/models/models.dart';
import 'package:water_project/screens/widgets/header.dart';

import 'components/sensor_info_list_view_item.dart';

class MapsScreen extends StatelessWidget {
  static const String id = "maps_screen";
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 8),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),
                  const Header(),

                  Text(
                    "Project 1",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Gap(16),
                  Container(
                    height: MediaQuery.sizeOf(context).height*.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).cardColor),
                    child: const Center(child: Text("This is where the map goes")),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(width: 1, color: Theme.of(context).cardColor))


                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(48),
                      Text(
                        "Project Sensors",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Gap(16),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 30,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const SensorInfoListViewItem(
                            sensor: Sensor(
                                id: "id",
                                diameter: 50,
                                location: GeoPoint(6.0000, 13.000)),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                            color: Theme.of(context).cardColor,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

