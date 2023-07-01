import 'package:flutter/cupertino.dart';

import 'constants.dart';

class ChatBuble extends StatelessWidget {
  double top;
  // double left;
  final String text;
  double width;

  ChatBuble({
    Key? key,
    required this.text,
    this.top = 20,
    // this.left=10,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
          color:KColorPrimary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4))),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
      margin: EdgeInsets.only(top: top),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xffFFFFFF)),
      ),
    );
  }
}