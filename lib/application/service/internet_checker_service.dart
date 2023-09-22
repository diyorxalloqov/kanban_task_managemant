import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionCheckerService {
  // final Connectivity connectivity = Connectivity();
  // bool isConnected = false;

  Future<bool> findConnectionState() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
