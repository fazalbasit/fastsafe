
import 'package:flutter/material.dart';

import 'Clippers.dart';

class MyCustomClipper extends StatefulWidget {
  const MyCustomClipper({Key? key}) : super(key: key);

  @override
  _MyCustomClipperState createState() => _MyCustomClipperState();
}

class _MyCustomClipperState extends State<MyCustomClipper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171D3F),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [

                  Container(
                    child: ClipPath(
                      clipper: GetStarted_PageClipper(),
                      child: Opacity(
                        opacity: .98,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                              child: Image.asset("assets/getstarted1.png")),
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
