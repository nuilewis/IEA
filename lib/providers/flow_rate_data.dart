import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/flow_data_model.dart';
import 'package:water_project/services/firebase_database_service.dart';

class FlowRateData extends ChangeNotifier {
  FlowRate? flowData;
  List<FlowRate>? flowDataList;

  getFlowData() async {
    DatabaseEvent value = await FirebaseDBService().getData("\"");
    var encodedData = jsonEncode(value.snapshot.value);
    var decodeData = jsonDecode(encodedData);
    var data = value.snapshot.value;
    // print("\nencoded Data is $encodedData");
    // print("\nDecoded data is $decodeData");
    // print("\nnormal Data is $data");
    print("\nisolated data is ${decodeData["-N27ICgwWtn9WH69ri5C"]}");

    List listofData = [value.snapshot.key];
    print("list of data keys $listofData");
    flowData = FlowRate(flowRate: 5);
    notifyListeners();
  }
}
