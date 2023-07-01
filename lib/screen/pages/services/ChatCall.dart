import 'package:flutter/material.dart';

class ChatBodyDoctor extends StatelessWidget {
  final String img;
  final String text;
  final Widget icon;
  final String subtext;
  const ChatBodyDoctor(
      {super.key,
        required this.img,
        required this.icon,
        required this.subtext,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(img),
        title: Text(text),
        subtitle: Row(
          children: [
            icon,
            Text(
              subtext,
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
            )
          ],
        ),
        trailing: Image.asset('assets/images/icon_1.png'));
  }
}