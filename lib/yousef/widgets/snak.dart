import 'package:flutter/material.dart';

import '../constant/colors.dart';

class Snak extends StatelessWidget {
  Snak(this.mssg);
  String mssg;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Color(0xFF757575),
      elevation: 2.0,
      content: Text(
        mssg,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

SnackBar snac(String mssg) {
  final snackBar = SnackBar(
    backgroundColor: Color(0xFF757575),
    elevation: 2.0,
    duration: Duration(seconds: 2),
    content: Text(
      mssg,
      style: TextStyle(color: Colors.white),
    ),
  );
  return snackBar;
}

showSnack(context, txt) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      backgroundColor: mainColor,
      content: Text(txt,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18))));
}
