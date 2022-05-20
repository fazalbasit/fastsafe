import 'package:flutter/material.dart';
import 'package:untitled/utill/Navigator_Services.dart';

import '../utill/Clippers.dart';
import '../utill/Globals.dart';


class Getstarted extends StatefulWidget {
  const Getstarted({Key? key}) : super(key: key);

  @override
  _GetstartedState createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171D3F),
      body: SafeArea(
        child: Container(
            height: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: Globals.GetStarted_Title.length,
              itemBuilder: (context, position) {
                return Stack(
                  children: [
                    Container(
                      child: ClipPath(
                        clipper: GetStarted_PageClipper(),
                        child: Opacity(
                          opacity: .98,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.6,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    Row(children: [
                                      position>0?IconButton(onPressed: (){
                                        controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);

                                      }, icon: Icon(Icons.navigate_before,size: MediaQuery.of(context).size.width/10,color: Color(0xffEB496E),)):Container()
                                    ],),
                                    Image.asset(
                                        "assets/${Globals.GetStarted_Image[position]}"),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    "${Globals.GetStarted_Title[position]}",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width/14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                              Text("${Globals.GetStarted_descripion1[position]}",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width/25,
                                    color: Color(0xffADADAD),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Globals.GetStarted_descripion2[position]}",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width/25,
                                    color: Color(0xffADADAD),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width/20,

                              ),
                              Image.asset(
                                  "assets/${Globals.GetStarted_Indicators[position]}"),
                              position == 2
                                  ? NextButton("Get Start", position)
                                  : NextButton("Next", position)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
  Widget NextButton(String title, int position) {
    return GestureDetector(
      onTap: () {
        if (position == 2) {
          Navigator_Service.navigate_to_Hompage(context);
        } else {
          controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/10,
      ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
        decoration: BoxDecoration(
            color: Color(0xffEB496E), borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}


