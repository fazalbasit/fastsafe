import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/Credentials.dart';
import 'package:untitled/View/HomePage.dart';
import 'package:untitled/utill/Navigator_Services.dart';
import '../../utill/Clippers.dart';

class Password_Home_Page extends StatefulWidget {
  const Password_Home_Page({Key? key}) : super(key: key);

  @override
  _Password_Home_PageState createState() => _Password_Home_PageState();
}

class _Password_Home_PageState extends State<Password_Home_Page> {
  List<Widget> containers = [
    View_Password(),
    Add_Password(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                                                builder: (context) =>HomePage(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/add_password.png"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Add Password",
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xffE2E2E2),
                                  borderRadius: BorderRadius.circular(8)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 40),
                              child: TabBar(
                                //labelColor: Colors.white,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 10.0, color: Colors.black),
                                //For Un-selected Tabs
                                // labelColor: Colors.pink[800],
                                unselectedLabelColor: Colors.black54,

                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // Creates border
                                  color: Color(0xff3E3E3F),
                                ),
                                tabs: <Widget>[
                                  Tab(
                                    text: 'View Password',
                                  ),
                                  Tab(
                                    text: 'Add Password',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 12,
                            child: TabBarView(
                              children: containers,
                            ),
                          ),
                        ],
                      )

                      // ListView(
                      //   children: [],
                      // )
                      ),
                ),
              ],
            )),
      ),
    );
  }
}

class Add_Password extends StatefulWidget {
  const Add_Password({Key? key}) : super(key: key);

  @override
  _Add_PasswordState createState() => _Add_PasswordState();
}

class _Add_PasswordState extends State<Add_Password> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [AddpasswordButton()],
    );
  }

  Widget AddpasswordButton() {
    return GestureDetector(
      onTap: () {
        //0 means add password data and 1 mean Edit that dat
        Navigator_Service.navigate_to_Add_PasswordPage(context, 0, 0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              "Add new password",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class View_Password extends StatefulWidget {
  const View_Password({Key? key}) : super(key: key);

  @override
  _View_PasswordState createState() => _View_PasswordState();
}

class _View_PasswordState extends State<View_Password> {
  Future<List<Credentials>> FetchCredentials_List() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? musicsString = prefs.getString('passwords_list');
    List<Credentials> _credentials_list = Credentials.decode(musicsString!);
    return _credentials_list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Credentials>>(
        future: FetchCredentials_List(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return PasswordCardDesign(
                      index,
                      snapshot.data?[index].value_name,
                      snapshot.data?[index].value_email,
                      snapshot.data?[index].value_pass);
                });
          } else {
            return Container(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Add_Password(),
                      ),
                    );
                  },
                  // child: Image.asset('assets/back_image.png')),
                  child: Text("No passwords found")),
            );
          }
        });
  }

  Widget PasswordCardDesign(var index, var title, var email, var password) {
    return GestureDetector(
      onTap: () {
        Navigator_Service.navigate_to_Password_Preview(
            context, index, title, email, password);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 38),
        padding: EdgeInsets.symmetric(vertical: 21, horizontal: 21),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(0xffE2E2E2)),
        child: Row(
          children: [
            Expanded(flex: 2, child: Image.asset("assets/lock_icon.png")),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$title"),
                      Text("$email"),
                    ],
                  ),
                  Image.asset("assets/arrow_right.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
