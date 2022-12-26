import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class RealtimeDatabaseService {
  final FirebaseDatabase realtimeDB = FirebaseDatabase.instance;

  Future<DatabaseEvent> getData(String ref) async {
    DatabaseEvent db = await realtimeDB.ref(ref).once();

    return db;
  }

  Future<Stream<DatabaseEvent>> getStreamData(String ref) async {
    //getting the stream
    Stream<DatabaseEvent> valueStream = realtimeDB.ref(ref).onValue;

    //Subscribing to the stream
    return valueStream;
  }
}
