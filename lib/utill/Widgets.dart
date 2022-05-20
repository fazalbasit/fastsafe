import 'package:flutter/material.dart';

void MyErrorDailog(
    @required String title, @required String message,var context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("$title"),
          content: Text("$message"),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      child: DailogButton("Okay"))
                ],
              ),
            ),
          ],
        );
      });
}
Widget DailogButton( String text){
  return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54
      ),
      child: Text(text,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white
      ),));
}
