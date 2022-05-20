import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Controllers/Sharing_file_Provider.dart';
import 'package:video_player/video_player.dart';

import '../../utill/Clippers.dart';
import '../../utill/show_video.dart';

class Send_Video extends StatefulWidget {
  const Send_Video({Key? key}) : super(key: key);

  @override
  _Send_VideoState createState() => _Send_VideoState();
}

class _Send_VideoState extends State<Send_Video> {
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
                          EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff2E79F2).withOpacity(0.3),
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
                                        Navigator.pop(context);
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
                                    Image.asset("assets/upload_video.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Send Video",
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
                    child: Provider.of<Sharing_File_Provider>(context).progress
                        ? Center(
                            child: CupertinoActivityIndicator(),
                          )
                        : ListView(
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
                                    obscureText: true,
                                    controller: Password,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Color(0xff20A99A))),
                                      hintText: 'Password',
                                      labelText: 'Password',
                                    ),
                                  )),
                              image == null
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 54, vertical: 25),
                                      child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(12),
                                        dashPattern: [8, 4],
                                        color: Color(0xff767676),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 60),
                                                  color: Color(0xffE4E4E4),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.75,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.21,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 40.0),
                                                          child: Image.asset(
                                                              "assets/upload.png")),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "Upload Video",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xffADADAD)),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "click the icon  and upload the Video",
                                                              style: TextStyle(
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xffADADAD)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          getImage();
                                                        },
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        12),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff767676),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                            child: Text(
                                                              "Upload",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              getImage();
                                            },
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    200,
                                                child: _previewVideo())),
                                      ],
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<Sharing_File_Provider>(
                                              context,
                                              listen: false)
                                          .send_data(file, "upload_video",
                                              Password.text);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 60),
                                      decoration: BoxDecoration(
                                          color: Color(0xffEB496E),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                          child: Text(
                                        "Send",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                    ),
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

  File? file;
  XFile? image;

  getImage() async {
    final ImagePicker _picker = ImagePicker();

    image = await _picker.pickVideo(source: ImageSource.gallery);
    _playVideo(image);
    setState(() {
      file = File(image!.path);
    });
  }

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;

      controller = VideoPlayerController.file(File(file.path));

      _controller = controller;

      final double volume = 0.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    // final Text? retrieveError = _getRetrieveErrorWidget();
    // if (retrieveError != null) {
    //   return retrieveError;
    // }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }
}
