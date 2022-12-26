import 'package:firebase_database/firebase_database.dart';
import 'package:water_project/services/firebase_base_services.dart';

class SensorRealtimeDBService extends RealtimeDatabaseService {
  Future<DatabaseEvent> getSensorData() async {
    ///Get data is inherited from the Realtime Database Service since the code
    ///is the same, oly the reference changes
    DatabaseEvent sensorData = await getData("sensor");
    return sensorData;
  }

  Future<Stream<DatabaseEvent>> getSensorDataAsStream() async {
    ///Same thing here.
    Stream<DatabaseEvent> sensorDataStream = await getStreamData("sensor");
    return sensorDataStream;
  }
}
