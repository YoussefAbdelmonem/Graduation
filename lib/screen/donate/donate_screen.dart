import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/constant/colors.dart';
import 'package:meaw/core/widgets/button_widget.dart';
import 'package:meaw/core/widgets/text_widget.dart';
import 'package:meaw/screen/payment/payment_method/payment_methods_screen.dart';

import '../../utilis/urilis.dart';
// import '../../widgets/button_widget.dart';
// import '../../widgets/text_widget.dart';

class DonateScreen extends StatefulWidget {
  DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

bool isChecked = false;
bool isChecked1 = false;
bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
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
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
                title: TextWidget(
                  title: "who need for treatment",
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                activeColor: mainColor,
              ),
              CheckboxListTile(
                value: isChecked1,
                onChanged: (val) {
                  setState(() {
                    isChecked1 = val!;
                  });
                },
                title: TextWidget(
                  title: "Animal needs: food, hygiene ",
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                activeColor: mainColor,
              ),
              CheckboxListTile(
                value: isChecked2,
                onChanged: (val) {
                  setState(() {
                    isChecked2 = val!;
                  });
                },
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
                onTap: () {
                  if(isChecked || isChecked1 || isChecked2 ==true)
                  {
                    Utils.openScreen(context, PaymentMethodsScreen());
                  }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: TextWidget(
                            title: "Please select any one",
                            color: Colors.white,
                          ),
                        )
                      );
                    }

                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
