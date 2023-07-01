
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/constant/colors.dart';
import 'package:meaw/utilis/urilis.dart';
import 'package:meaw/core/widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Utils.backWidget(context),
                Spacer(),
                TextWidget(
                  title: "Notification".tr(),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),


              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                TextWidget(
                  title: "Today".tr(),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: TextWidget(
                      title: "Clear All".tr(),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: mainColor),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            buildNotificationCard(),
            SizedBox(
              height: 10.h,
            ),
            buildNotificationCard(),
            30.ph,
            Row(
              children: [
                TextWidget(
                  title: "Yesterday".tr(),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            buildNotificationCard(),
            SizedBox(
              height: 10.h,
            ),
            buildNotificationCard(),
            SizedBox(
              height: 10.h,
            ),
            buildNotificationCard(),
            SizedBox(
              height: 10.h,
            ),

          ],
        ),
      )),
    );
  }

  Widget buildNotificationCard() =>Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(
          color: mainColor,

        ),
        bottom: BorderSide(
          color: mainColor,
        ),
        left: BorderSide(
          color: mainColor,
        ),
        right: BorderSide(
          color: mainColor,
        ),
      ),




    ),
    height: 80.h,
    child: Card(
      elevation: 0.0,
      child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Image.asset("assets/images/noti.png"),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                TextWidget(
                  title: "Reminder For Today",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextWidget(
                  title: "t is a long established fact that a reader",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: greyText,
                ),

              ],
            ),
           Spacer(),
            TextWidget(
              title: "2min",
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: mainColor,
            ),
            SizedBox(
              width: 10.w,
            )
          ]),
    ),
  );
}
