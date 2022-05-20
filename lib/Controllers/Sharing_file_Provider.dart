import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';

class Sharing_File_Provider with ChangeNotifier  {

  bool progress = false;
  send_data(File? file, var action ,var Password) async {
    if (file == null) {
    } else {
     // setState(() {
        progress = true;
        notifyListeners();
     // });
      var request = new http.MultipartRequest(
          "POST", Uri.parse('https://safe-fast.space/ios/api.php?'));
      request.files
          .add(await http.MultipartFile.fromPath('action', file.path));
      request.fields['password'] = Password;
      request.fields['action'] = "$action";


      request.send().then((response) {
        http.Response.fromStream(response).then((onValue) async {
          try {
            //    get your response here...
            print("success" + onValue.body);
            Map<String, dynamic> map = jsonDecode(onValue.body);
            if (map["error"] == 0) {
                progress = false;
              notifyListeners();
              print(map["link"]);
                await FlutterShare.share(
                  title: 'Fast Share',
                 // text: 'Example share text',
                  linkUrl: map["link"],
                );
            } else {
              print("error");
                progress = false;
              notifyListeners();
            }
          } catch (e) {
            print(e.toString());

              progress = false;
            notifyListeners();
          }
        });
      });
    }
  }

}