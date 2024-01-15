import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


class ConnectionChecker {
  final InternetConnection internetConnectionChecker;

  ConnectionChecker(this.internetConnectionChecker);


  Future<bool> get isConnected => internetConnectionChecker.hasInternetAccess;
}
