import 'package:flutter/material.dart';

class Gesture extends StatelessWidget {
  final  String? button;
  VoidCallback? onTap;
  Gesture({super.key, required this.button,this.onTap}) ;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(left: 5, right: 5),
        width: double.infinity,
        child:  Text(
          button!,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff676d79)),
        ),
      ),
    );
  }
}