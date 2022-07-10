import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/flow_data_model.dart';
import 'package:water_project/services/firebase_database_service.dart';

class FlowRateData extends ChangeNotifier {
  FlowRate? currentflowData;
  List<FlowRate>? flowDataList;

  getFlowRateData() async {
    Stream<DatabaseEvent?> streamData = FirebaseDBService().getStreamData("\"");

    streamData.listen((event) {
      DataSnapshot? data = event?.snapshot;
      print("listening data from ${data?.value}");
      var encodedData = jsonEncode(data?.value);
      Map<dynamic, dynamic> fakedata= data?.value as Map;
 for(value in encodedData){}
    

       
    currentflowData = FlowRate(flowRate: 5);

    },);
    // var encodedData = jsonEncode(streamData);
    // var decodeData = jsonDecode(encodedData);
  

  
   // notifyListeners();
  }
}
