import 'dart:async';
import 'dart:io';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:provider/provider.dart';
import '../../Controllers/Device_Info_Provider.dart';
import '../../utill/Clippers.dart';
import 'package:sim_info/sim_info.dart';

class Device_Infromation extends StatefulWidget {
  const Device_Infromation({Key? key}) : super(key: key);

  @override
  _Device_InfromationState createState() => _Device_InfromationState();
}

class _Device_InfromationState extends State<Device_Infromation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  String Model = "";
  String Name = "";
  String OS = "";
  String _TotalSpace = "";
  String Charging_level = "";
  String Charging_status = "";
  String carrierName = "";
  String string = "";

  init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.machine}');
    print('Running on ${iosInfo.systemVersion}');
    print('Running on ${iosInfo.systemName}');
    _TotalSpace = ((await DiskSpace.getTotalDiskSpace)! / 1000).toString();
    Charging_level =
        (await BatteryInfoPlugin().iosBatteryInfo)!.batteryLevel.toString();
    Charging_status = (await BatteryInfoPlugin().iosBatteryInfo)!
        .chargingStatus
        .toString()
        .trim();
    print(Charging_status);
    if ((await BatteryInfoPlugin().iosBatteryInfo)!
            .chargingStatus
            .toString()
            .trim() ==
        'ChargingStatus.Charging') {
      print("Charging");
      Charging_status = "Charging";
    } else {
      print("Not Charging");
      Charging_status = "Not Charging";
    }
    carrierName = await SimInfo.getCarrierName;
    Name = iosInfo.utsname.nodename!;
    Model = iosInfo.utsname.machine!;
    OS = "${iosInfo.systemName}(${iosInfo.systemVersion})";
Provider.of<NetworkStatusService>(context, listen: false).GetNetwork();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                child: ClipPath(
                  clipper: MainPages_Clipper(),
                  child: Opacity(
                    opacity: .98,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xffFFE5CC),
                      ),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_before,
                                        size: 40,
                                        color: Color(0xff1D1D1F),
                                      ))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/device_information.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Device Information",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: ListView(
                      children: [
                        CustomCardsDesign(
                            "Device Name", "$Name", "phone_model"),
                        CustomCardsDesign(
                            "Device model", "$Model", "phone_name"),
                        CustomCardsDesign(
                            "Operating system", "$OS", "Operating_system"),
                        CustomCardsDesign(
                            "Storage", "$_TotalSpace GB", "storage"),
                        CustomCardsDesign("Battery level", "$Charging_level",
                            "battery_level"),
                        CustomCardsDesign("Network", "${Provider.of<NetworkStatusService>(context,listen: false).Status}", "network"),
                        CustomCardsDesign(
                            "Carrier", "$carrierName", "cellular"),
                        CustomCardsDesign("Battery charging",
                            "$Charging_status", "battery_charging"),
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  Widget CustomCardsDesign(
      String title, String Description, String Image_link) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/$Image_link.png")),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1D1D1F),
                  ),
                ),
                Text(
                  "$Description",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3E3E3F),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();

  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
