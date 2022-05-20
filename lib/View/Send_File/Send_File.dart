import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Controllers/Sharing_file_Provider.dart';
import '../../utill/Clippers.dart';
import '../HomePage.dart';

class Send_File extends StatefulWidget {
  const Send_File({Key? key}) : super(key: key);

  @override
  _Send_FileState createState() => _Send_FileState();
}

class _Send_FileState extends State<Send_File> {
  TextEditingController Password = TextEditingController();

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
                          EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/21, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xffEB496E).withOpacity(0.3),
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
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/upload_file.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Send File",
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
                    child: context.watch<Sharing_File_Provider>().progress?Center(child: CupertinoActivityIndicator(),):ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 54),
                            width: 250,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black26,width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: new TextField(
                              controller: Password,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xff20A99A))),
                                hintText: 'Password',
                                labelText: 'Password',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 54,vertical: 25),
                          child: file!=null?Column(
                            children: [
                              Icon(Icons.insert_drive_file_rounded, size: 150,),
                              Text("${file?.name}")
                            ],
                          ):DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            dashPattern: [8, 4],
                            color: Color(0xff767676),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 60),
                                      color: Color(0xffE4E4E4),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top:40.0),
                                            child: Image.asset("assets/upload.png")
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Upload file",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xffADADAD)),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(
                                                    "click the icon  and upload the file",style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400,color: Color(0xffADADAD)),),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              getFile();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff767676),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Text("Upload",style: TextStyle(color: Colors.white,fontSize: 8),)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Provider.of<Sharing_File_Provider>(context, listen: false).send_data(filese, "upload_file", Password.text);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                                decoration: BoxDecoration(
                                  color: Color(0xffEB496E),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Center(child: Text("Send",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16,color: Colors.white),)),),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
  PlatformFile? file;
  File? filese;
  XFile? image;

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
       filese = File(result.files.first.path??"");
print(filese);
      file = result.files.first;

       setState(() {

       });

      print(file?.name);
      print(file?.bytes);
      print(file?.size);
      print(file?.extension);
      print(file?.path);
    } else {
      // User canceled the picker
    }
  }
}
