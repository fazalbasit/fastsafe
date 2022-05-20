import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Controllers/Sharing_file_Provider.dart';
import 'package:untitled/View/Getstarted.dart';
import 'package:untitled/utill/CustomCliper.dart';

import 'Controllers/Device_Info_Provider.dart';

void main() {

  runApp(  MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_)=> NetworkStatusService()),
      ChangeNotifierProvider(create: (_)=> Sharing_File_Provider()),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Fast Safe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Satoshi'
      ),
      home: const Getstarted(),
    );
  }
}
