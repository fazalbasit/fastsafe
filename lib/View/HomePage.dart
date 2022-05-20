import 'package:flutter/material.dart';
import 'package:untitled/utill/Clippers.dart';
import 'package:untitled/utill/Navigator_Services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        Navigator_Service.navigate_to_Subscription_Page(context);
                                      },
                                      child: Image.asset("assets/sub_button.png"))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Enjoy the incredible\nfeatures of this app.",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.055,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    )
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
                                horizontal: 55, vertical: 25),
                            child: Text(
                              "Features",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff767676)),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator_Service.navigate_to_Device_Information(
                                context);
                          },
                          child: ButtonCard(
                              "Device Information",
                              "Check the device all information and data.",
                              "device_information",
                              Color(0xffFF7E02)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator_Service.navigate_to_Send_File(context);
                          },
                          child: ButtonCard(
                              "Send File",
                              "Upload file create link and send secure.",
                              "upload_file",
                              Color(0xffEB496E)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator_Service.navigate_to_Send_Video(context);
                          },
                          child: ButtonCard(
                              "Send Video",
                              "Upload Video create link and send secure.",
                              "upload_video",
                              Color(0xff2E79F2)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator_Service.navigate_to_Send_Photo(context);
                          },
                          child: ButtonCard(
                              "Send Photo",
                              "Upload Image create link and send secure.",
                              "upload_image",
                              Color(0xff5DD300)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator_Service.navigate_to_Add_Password_Home(context);
                          },
                          child: ButtonCard(
                              "Add Password",
                              "The user add account password secure.",
                              "add_password",
                              Color(0xff7733FD)),
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }

  Widget ButtonCard(
      String Title, String Description, String Image_name, Color color) {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xffFF7E02).withOpacity(.2),
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 25.5, horizontal: 31),
      child: Row(
        children: [
          Image.asset(
            "assets/${Image_name}.png",
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${Title}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${Description}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff767676)),
                ),
                // Text("Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
