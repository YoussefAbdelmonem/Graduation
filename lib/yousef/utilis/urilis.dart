import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils
{
  static void openScreen(BuildContext context, Widget screen,
      {bool replacment = false}) {
    if (replacment) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static Widget backWidget(BuildContext context,
      {VoidCallback? onBack, bool arabicLang = true}) {
    return GestureDetector(
      onTap: () {
        // if (onBack != null) {
        //   onBack.call();
        // }
        Navigator.pop(context);
      },
      child:
      Image.asset(
        "assets/images/arrowleft.png",
        width: 30.w,
        height: 30.w,
      ),
    );
  }




}

extension ResponsiveExtension on num {
  SizedBox get ph => SizedBox(
    height: toDouble().h,
  );
  SizedBox get pw => SizedBox(
    width: toDouble().w,
  );
}