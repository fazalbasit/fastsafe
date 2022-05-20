import 'package:flutter/material.dart';
import 'package:untitled/View/Add_Password/Add_Password.dart';
import 'package:untitled/View/Add_Password/Add_PasswordPage.dart';
import 'package:untitled/View/Add_Password/passwod_previewpage.dart';
import 'package:untitled/View/Device_Info/Device_Information.dart';
import 'package:untitled/View/HomePage.dart';
import 'package:untitled/View/Send_File/Send_File.dart';
import 'package:untitled/View/Send_Photo/Send_Photo.dart';
import 'package:untitled/View/Send_Video/Send_Video.dart';
import 'package:untitled/View/Subscription_Page.dart';
class Navigator_Service {
  static navigate_to_Hompage(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>HomePage(),
        ));
  }
  static navigate_to_Device_Information(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Device_Infromation(),
        ));
  }
  static navigate_to_Send_File(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Send_File(),
        ));
  }
  static navigate_to_Send_Photo(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Send_photo(),
        ));
  }
  static navigate_to_Send_Video(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Send_Video(),
        ));
  }
  static navigate_to_Add_Password_Home(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Password_Home_Page(),
        ));
  }
  static navigate_to_Password_Preview(context, var Index, var title,var Email, var Password) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>password_previewpage(Index: Index,Title: title ,Email: Email,Password: Password,),
        ));
  }
  static navigate_to_Add_PasswordPage(context, var status, var index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Add_PasswordPage(Status: status,Index: index,),
        ));
  }
  static navigate_to_Subscription_Page(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>Subscription_Page(),
        ));
  }

}
