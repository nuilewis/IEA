
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';

class SensorInfoListViewItem extends StatelessWidget {
  final Sensor sensor;
  const SensorInfoListViewItem({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "345",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: " m/s2", style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ),
          const Spacer(),
          Text(
            "${sensor.diameter.toString()} cm",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            "normal",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColours.green60),
          ),
          const Spacer(),
          IconButton.filled(
              style: IconButton.styleFrom(
                fixedSize: const Size.square(36),
                backgroundColor: Theme.of(context).cardColor,
                elevation: 0,
              ),
              onPressed: () {},
              icon: Icon(FluentIcons.location_24_regular, color: Theme.of(context).colorScheme.primary, ))
        ],
      ),
    );
  }
}