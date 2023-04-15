
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/payment/payment_method/payment_methods_screen.dart';

import '../../utilis/urilis.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
            SizedBox(
              height: 64.h,
            ),
            Row(
              children: [
                Utils.backWidget(context),
                const Spacer(),
                TextWidget(
                  title: "Donate",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            TextWidget(
              title: "Payment successful",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: mainColor,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextWidget(
              title: "Thank you for help our pets",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 12.h,
            ),
            Image.asset("assets/images/donate.png"),
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              title: "Pay For What ?",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: mainColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            CheckboxListTile(
              value: true,
              onChanged: (val) {},
              title: TextWidget(
                title: "who need for treatment",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
              activeColor: mainColor,
            ),
            CheckboxListTile(
              value: false,
              onChanged: (val) {},
              title: TextWidget(
                title: "Animal needs: food, hygiene ",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
              activeColor: mainColor,
            ),
            CheckboxListTile(
              value: false,
              onChanged: (val) {},
              title: TextWidget(
                title: "for shelters builds needs",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
              activeColor: mainColor,
            ),
        ButtonWidget(
            title: "Apply",
            radius: 1,
            width: 46.w,
            onTap: ()
            {
              Utils.openScreen(context,PaymentMethodsScreen()
              );

            },

        ),
      ],
    ),
          ),
        ));
  }
}
