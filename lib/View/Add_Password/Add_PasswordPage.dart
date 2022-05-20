import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Credentials.dart';
import 'package:untitled/View/Add_Password/Add_Password.dart';
import 'package:untitled/View/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/utill/Navigator_Services.dart';

import '../../utill/Clippers.dart';
import '../../utill/Widgets.dart';

class Add_PasswordPage extends StatefulWidget {
  int Status;
  int Index;

  Add_PasswordPage({Key? key, required this.Status, required this.Index})
      : super(key: key);

  @override
  _Add_PasswordPageState createState() => _Add_PasswordPageState();
}

class _Add_PasswordPageState extends State<Add_PasswordPage> {
  TextEditingController Account_Name = TextEditingController();
  TextEditingController EmailAddress = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.Status == 1) {
      get();
    } else {}
  }

  List<Credentials>? _credentials_list;

  Future<List<Credentials>?>? get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? musicsString = await prefs.getString('passwords_list');
    _credentials_list = Credentials.decode(musicsString!);
    print("${_credentials_list![widget.Index].value_name}");
    Account_Name.text = _credentials_list![widget.Index].value_name!;
    EmailAddress.text = _credentials_list![widget.Index].value_email!;
    Password.text = _credentials_list![widget.Index].value_pass!;
    return _credentials_list;
  }
  bool _isObscure = true;

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
                                    Image.asset("assets/add_password.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Add new Password",
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
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 54),
                            width: 250,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black26,width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: new TextField(
                              controller: Account_Name,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                hintText: 'Account Name',
                                labelText: 'Account Name ',
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 54),
                            width: 250,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black26,width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: new TextField(
                              controller: EmailAddress,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                hintText: 'Email Address',
                                labelText: 'Email Address ',
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 54),
                            width: 250,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black26,width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: new TextField(
                              obscureText: _isObscure,
                              controller: Password,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                hintText: 'Password',
                                labelText: 'Password',
                              ),
                            )),
                        SizedBox(
                          height: 100,
                        ),
                        AddButton()
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  Widget AddButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.Status == 1) {
              Update();
            } else {
              set();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueAccent),
            child: Text(
              widget.Status == 1 ? "Update" : "Add",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  void set() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (Account_Name.text.isEmpty ||
        EmailAddress.text.isEmpty ||
        Password.text.isEmpty) {
      MyErrorDailog("Error", "Kindly fill all fields", context);
    } else {
      //getlist
      final String? musicsString = prefs.getString('passwords_list');
      List<Credentials>? _credentials_list;
      try {
        _credentials_list = Credentials.decode(musicsString!);
      } catch (e) {}
      if (_credentials_list != null) {
        //if list is not empty
        // add it to the existing list
        _credentials_list.add(
          Credentials(
              value_name: "${Account_Name.text}",
              value_email: "${EmailAddress.text}",
              value_pass: "${Password.text}"),
        );
        // encode it
        final String encodedData = Credentials.encode(_credentials_list);
        // save it int prefrense
        await prefs.setString('passwords_list', encodedData).then((value) =>
            // Navigator.pushReplacement(
            //       context,
            //       CupertinoPageRoute(
            //         builder: (context) => HomePage(),
            //       ),
            //     )
            Navigator_Service.navigate_to_Add_Password_Home(context));
      } else {
        // if list is empty
        // Encode and store data in SharedPreferences
        final String encodedData = Credentials.encode([
          Credentials(
              value_name: "${Account_Name.text}",
              value_email: "${EmailAddress.text}",
              value_pass: "${Password.text}"),
        ]);
        //add it to the prefrense
        await prefs.setString('passwords_list', encodedData).then((value) =>
            // Navigator.pushReplacement(
            //       context,
            //       CupertinoPageRoute(
            //         builder: (context) => HomePage(),
            //       ),
            //     )
            Navigator_Service.navigate_to_Add_Password_Home(context));
      }
    }
  }

  void Update() async {
    if (Account_Name.text.isEmpty ||
        EmailAddress.text.isEmpty ||
        Password.text.isEmpty) {
      MyErrorDailog("Error", "Kindly fill all fields", context);
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _credentials_list![widget.Index] = Credentials(
          value_name: Account_Name.text,
          value_email: EmailAddress.text,
          value_pass: Password.text);
      // Encode and store data in SharedPreferences
      final String encodedData = Credentials.encode(_credentials_list!);
      //add it to the prefrense
      await prefs.setString('passwords_list', encodedData).then((value) =>
          // Navigator.pushReplacement(
          //       context,
          //       CupertinoPageRoute(
          //         builder: (context) => HomePage(),
          //       ),
          //     )
          Navigator_Service.navigate_to_Add_Password_Home(context));
    }
  }
}
