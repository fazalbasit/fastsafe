
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
enum NetworkStatus { Wifi,Mobile, Offline }
class NetworkStatusService with ChangeNotifier  {
  String Status="";
  StreamController<NetworkStatus> networkStatusController =
  StreamController<NetworkStatus>();
  Future GetNetwork() async{
    await Connectivity().onConnectivityChanged.listen((status){
      networkStatusController.add(_getNetworkStatus(status));
    });
  }
    _getNetworkStatus(ConnectivityResult status) {
    if(status==  ConnectivityResult.mobile){
      Status="Mobile";
    }else if(status==ConnectivityResult.wifi){
      Status="Wifi";
    }else{
      Status="Offline";
    }
  }

}