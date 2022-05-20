import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/Credentials.dart';
import 'package:untitled/View/Add_Password/Add_Password.dart';
import 'package:untitled/View/HomePage.dart';

import '../../utill/Clippers.dart';
import '../../utill/Navigator_Services.dart';
import '../../utill/Widgets.dart';

class password_previewpage extends StatefulWidget {
  int Index;
  String Title;
  String Email;
  String Password;

  password_previewpage(
      {Key? key,
      required this.Index,
      required this.Title,
      required this.Email,
      required this.Password})
      : super(key: key);

  @override
  _password_previewpageState createState() => _password_previewpageState();
}

class _password_previewpageState extends State<password_previewpage> {
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
                        color: Color(0xff7733FD).withOpacity(0.3),
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
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>Password_Home_Page(),
                                            ));
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
                                    Image.asset("assets/lock_icon.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${widget.Title}",
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
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffE8E8E8),
                              borderRadius: BorderRadius.circular(32)),
                          margin: EdgeInsets.symmetric(horizontal: 26),
                          padding: EdgeInsets.symmetric(
                              horizontal: 43, vertical: 45),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.asset("assets/mail.png")),
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Email",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffADADAD),
                                                  )),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator_Service
                                                        .navigate_to_Add_PasswordPage(
                                                            context,
                                                            1,
                                                            widget.Index);
                                                  },
                                                  child: Image.asset(
                                                      "assets/Edit.png"))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              "${widget.Email}",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff1D1D1F)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                          "assets/unlock_Icon.png")),
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Password",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffADADAD),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              "${widget.Password}",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff1D1D1F)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ConfirmationDialog(widget.Index);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 30),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 30),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black,
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  child: Text(
                                    "Okay",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  void ConfirmationDialog(@required int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Confirmation"),
            content: new Text("Are you sure you want to delete this?"),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: DailogButton("Cancel")),
                    GestureDetector(
                        onTap: () {
                          Delete(index);
                        },
                        child: DailogButton("Yes"))
                  ],
                ),
              ),
            ],
          );
        });
  }

  void Delete(int index) async {
    print(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //getlist
    final String? musicsString = await prefs.getString('passwords_list');
    List<Credentials>? musics;
    try {
      musics = Credentials.decode(musicsString!);
    } catch (e) {}
    // add it to the existing list
    musics!.removeAt(index);
    // encode it
    final String encodedData = Credentials.encode(musics);
    // save it int prefrense
    await prefs.setString('passwords_list', encodedData).then((value) {
      Navigator.pop(context);
      Navigator_Service.navigate_to_Add_Password_Home(context);
    });
  }
}
