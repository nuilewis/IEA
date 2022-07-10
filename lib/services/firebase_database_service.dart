import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';

class FirebaseDBService {
  final FirebaseDatabase _reference = FirebaseDatabase.instance;

  Future<DatabaseEvent> getData(String ref) async {
    DatabaseEvent value = await _reference.ref(ref).once();
    //debugPrint("database value is ${value.snapshot.value}");

    return value;
  }

  Stream<DatabaseEvent> getStreamData(String ref) {
    //getting the stream
    Stream<DatabaseEvent> dataStream = _reference.ref(ref).onValue;
    
   return dataStream;
    
  }
}
