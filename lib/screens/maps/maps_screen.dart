import 'package:flutter/material.dart';
import '../../core/core.dart';

class MapsScreen extends StatelessWidget {
  static const  id = "maps screen";
    const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Row(
      children:   [
        Expanded(flex: 9, child: Maps()),
        Expanded(flex: 4, child: SensorInfo()),
      ],
    ));
  }
}

class Maps extends StatefulWidget {
    const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
            const Spacer(),
            const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Project 1',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
            ],
          ),
            const SizedBox(height: 12),
          Padding(
            padding:   const EdgeInsets.only(bottom: 15.0),
            child: Container(
              height: 800,
              width: 900,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child:   const Maps(),
            ),
          )
        ],
      ),
    );
  }
}

class SensorInfo extends StatelessWidget {
    const SensorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const SizedBox(
          height: 125,
        ),
        Row(
          children:  [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Project sensors',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        Padding(
          padding:   const EdgeInsets.all(10.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Theme.of(context).cardColor)),
            child: const Column(
              children:   [
                ProjectSensorInfo(isNormal: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectSensorInfo extends StatelessWidget {
    const ProjectSensorInfo({
    super.key,
    required this.isNormal,
  });

  final bool isNormal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          const SizedBox(
          width: kDefaultPadding * 3,
        ),
          Text(
          '345 ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
          const Text('m2/sec'),
          const SizedBox(
          width: kDefaultPadding * 3,
        ),
          const Text('50 cm'),
          const SizedBox(
          width: kDefaultPadding * 3,
        ),
        Padding(
          padding:   const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Container(
            padding:   const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
            decoration: BoxDecoration(
                color: isNormal ? AppColours.green70 : AppColours.redSeed,
                borderRadius: BorderRadius.circular(kDefaultPadding2x)),
            child: Text(
              isNormal ? "Normal" : "Abnormal",
            ),
          ),
        )
      ],
    );
  }
}
