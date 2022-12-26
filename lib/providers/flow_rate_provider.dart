import 'package:flutter/material.dart';
import 'package:water_project/models/flow_data_model.dart';

enum FlowRateState { initial, submitting, success, error }

class FlowRateProvider extends ChangeNotifier {
  FlowRate? flowData;
  List<FlowRate>? flowDataList = [];

  // Future<bool> getFlowData() async {
  //   //DatabaseEvent dbEvent = await FirebaseDBService().getData("sources");
  //   Map<String, dynamic> jsonData =
  //       dbEvent.snapshot.value as Map<String, dynamic>;
  //   jsonData.forEach((key, value) {
  //     var newFlowRate = value["flow_rate"];
  //     var newVelocity = value["velocity"];
  //
  //     // assert(newFlowRate is double || newFlowRate is int, "Flow rate type is invalid");
  //     flowDataList!.add(
  //         FlowRate(flowRate: newFlowRate ?? 0, velocity: newVelocity ?? 0));
  //     debugPrint(
  //         "Source: $key,  Flow Rate: $newFlowRate , velocity: $newVelocity");
  //     flowData = FlowRate(
  //         flowRate: newFlowRate ?? 0, velocity: newVelocity); //todo: thissh
  //   });
  //
  //   notifyListeners();
  //   return true;
  // }
}
