import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/flow_data_model.dart';
import 'package:water_project/services/firebase_database_service.dart';

class FlowRateData extends ChangeNotifier {
  FlowRate? flowData;
  List<FlowRate>? flowDataList = [];

  Future<bool> getFlowData() async {
    DatabaseEvent _dbEvent = await FirebaseDBService().getData("\"");
    Map<String, dynamic> jsonData = _dbEvent.snapshot.value as Map<String, dynamic>;
    jsonData.forEach((key, value) {
      String newFlowRateString = value["Flow_Rate"];
      String newVelocityString = value["Velocity"];

       ///Parse the strings from firebase
       double? newFlowRate = double.tryParse(newFlowRateString);

      double? newVelocity = double.tryParse(newVelocityString);
     
    
      
      assert(newFlowRate is double || newFlowRate is int, "Flow rate type is invalid");
      flowDataList!.add(FlowRate(flowRate: newFlowRate?? 0, velocity: newVelocity ?? 0));
      debugPrint("Source: $key,  Flow Rate: $newFlowRate , velocity: $newVelocity");
      flowData = FlowRate(flowRate: newFlowRate ?? 0, velocity: newVelocity);//todo: thissh
    });

    notifyListeners();
    return true;
  }
}










