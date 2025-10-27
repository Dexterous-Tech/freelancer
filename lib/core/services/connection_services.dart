// connection_service.dart
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  ConnectionService() {
    _connectivity.onConnectivityChanged.listen((result) async {
      final hasInternet =
          await InternetConnectionChecker.instance.hasConnection;
      _connectionController.add(hasInternet);
    });
  }

  Future<bool> checkInitialConnection() async {
    return await InternetConnectionChecker.instance.hasConnection;
  }

  void dispose() {
    _connectionController.close();
  }
}
