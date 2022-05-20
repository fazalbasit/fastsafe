import 'package:flutter/material.dart';

import '../utill/Clippers.dart';

class Subscription_Page extends StatefulWidget {
  const Subscription_Page({Key? key}) : super(key: key);

  @override
  _Subscription_PageState createState() => _Subscription_PageState();
}

class _Subscription_PageState extends State<Subscription_Page> {
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
                        color: Color(0xff171D3F),
                      ),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_before,
                                        size: 52,
                                        color: Color(0xffEB496E),
                                      )),
                                  Text(
                                    "Subscription",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  Container()
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Efficient charge consumption organized\nsecure data storagespam subscribtion\ncontral mediafiles cleaned up",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffADADAD)),
                                      textAlign: TextAlign.center,
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
                          margin: EdgeInsets.symmetric(horizontal: 53),
                          padding: EdgeInsets.symmetric(vertical: 44),
                          decoration: BoxDecoration(
                              color: Color(0xff7733FD).withOpacity(.3),
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            children: [
                              Text(
                                "Standard",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff7733FD)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Get the party started",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E3E3F)),
                                ),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "1 Week",
                                  style: TextStyle(
                                      fontSize: 39,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff171D3F)),
                                ),
                              ),
                              Text(
                                "0.99\$",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff767676)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 42.0),
                                child: Text(
                                  "Start with a 3-day trails",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E3E3F)),
                                ),
                              ),
                              Subscribe_Button(),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 100),
                            child: Column(
                              children: [
                                Text(
                                  "Your subscription will renew automatically at the end of the trail period",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffADADAD)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Privacy Policy",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffADADAD)),
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Restore purchases",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffADADAD)),
                                          )),
                                      Text(
                                        "Terms of Use",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffADADAD)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  Widget Subscribe_Button() {
    return Container(
      margin: EdgeInsets.only(top: 22),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xffEB496E), borderRadius: BorderRadius.circular(12)),
      child: Text(
        "Subscription",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
