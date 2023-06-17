import 'package:flutter/material.dart';
import 'package:meaw/models/message_model.dart';

import '../yousef/screen/pages/services/constants.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  const ChatBubble(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,
      child: Container(
        //alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 18,right: 18,top: 13,bottom:13),
        margin: const EdgeInsets.all(15),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4)),

          color: KColorPrimary,
        ),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  final Message message;
  const ChatBubbleForFriend(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerRight,
      child: Container(
        //alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 18,right: 18,top: 13,bottom: 13),
        margin: const EdgeInsets.all(15),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4),
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4)),
          color: Color(0xffD9D9D9),
        ),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}