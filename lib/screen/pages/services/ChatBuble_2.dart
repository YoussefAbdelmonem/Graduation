
import 'package:flutter/material.dart';

class ChatBuble_2 extends StatelessWidget {
  final String text;
  final double top;
  final double vertical;
  double width;
  double right;
  ChatBuble_2(
      {Key? key,
        required this.text,
        required this.top,
        required this.vertical,
        this.width = 200,
        this.right = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4))),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: vertical),
      margin: EdgeInsets.only(top: top, right: right),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}