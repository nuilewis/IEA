import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseDBService {
  final FirebaseDatabase _reference = FirebaseDatabase.instance;

  Future<DatabaseEvent> getData(String ref) async {
    DatabaseEvent db = await _reference.ref(ref).once();
    //debugPrint("database value is ${value.snapshot.value}");

    return db;
  }

  getStreamData(String ref) async {
    //getting the stream
    Stream<DatabaseEvent> valueStream = _reference.ref(ref).onValue;

    //Subscribing to the stream
    valueStream.listen((DatabaseEvent event) {
      ///Dow aht ever you want with the stream
      debugPrint("Event TYpe ${event.type}");
      debugPrint("Event snapshot ${event.snapshot}");
    });
  }
}
