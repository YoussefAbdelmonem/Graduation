import 'package:flutter/material.dart';
import 'package:meaw/screens/bottomNavScreen/chat/chat_screen.dart';


class ChatDoctors extends StatelessWidget {
  final String img;
  final String text;
  final String subtext;
  final String trailing;
  const ChatDoctors(
      {super.key,
      required this.img,
      required this.trailing,
      required this.subtext,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        text == 'Dr. Mohammed'
            ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  ChatPage();
              }))
            : null;
      },
      child: ListTile(
          leading: Image.asset(img),
          title: Text(text),
          subtitle: Text(
            subtext,
            style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
          ),
          trailing: Text(trailing)),
    );
  }
}
