import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/screens/details_screen/components/flow_rate_per_project.dart';
import 'package:water_project/screens/details_screen/components/header.dart';
import 'package:water_project/screens/details_screen/components/side_menu.dart';
import 'package:water_project/core/theme.dart';

import '../details_screen/components/flow_status.dart';

class MapsScreen extends StatelessWidget {
  static const id = "maps screen";
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: const [
        Expanded(flex: 3, child: SideMenu()),
        Expanded(flex: 9, child: Maps()),
        Expanded(flex: 4, child: SensorInfo(isNormal: true,)),
      ],
    ));
  }
}

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

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
          Spacer(),
          Header(),
          
          SizedBox(height: 50,),
          
          
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text('Project 1',
                  style: kHeading,
               ),
                )
              ],
            ),
            
            
          ),
          SizedBox(height: 12),
          Container(
            height: 800,
            width: 900,
           
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            
          )
       
        ],
      ),
    );
  }
}
class SensorInfo extends StatelessWidget {
  final bool isNormal;
  const SensorInfo({super.key,  required this.isNormal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 125,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text('Project sensors',
              textAlign: TextAlign.left,
              style: kHeading,),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
           
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
             border: Border.all(color: kPurple20) 
            ),
            child: Column(
              children: [
                project_sensor_info(isNormal: true),
               
                
              ],
            ),
            
          ),
        ),
      ],
    );
  }
}

class project_sensor_info extends StatelessWidget {
  const project_sensor_info({
    Key? key,
    required this.isNormal,
  }) : super(key: key);

  final bool isNormal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: kDefaultPadding*3,),
        Text('345 ', style: kBodyBold,),
        Text('m2/sec'),

       SizedBox(width: kDefaultPadding*3,),
        Text('50 cm'),
        SizedBox(width: kDefaultPadding*3,),
        Padding(
          padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
          child: Container(
    padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
    decoration: BoxDecoration(
          color: isNormal ? kGreen : kFuchsia,
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
