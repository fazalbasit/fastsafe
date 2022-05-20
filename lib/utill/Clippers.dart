import 'package:flutter/material.dart';

class GetStarted_PageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-size.width/size.width*.025);
    print("Size ${size.width*.0035}");

    var firstControlPoint = Offset(4, size.height / 1.38);
    var firstEndPoint = Offset(size.width / 2.0, size.height / (1.33));
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (4), size.height - 140);
    var secondEndPoint = Offset(size.width, size.height / 1.7);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class MainPages_Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-size.width/70);
    // first curve
    path.quadraticBezierTo(4, size.height / 1.40,
        size.width / 1.8, size.height / 1.3);
    // second curve
    path.quadraticBezierTo(size.width, size.height - 65,
        size .width, size.height / 1.8);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}