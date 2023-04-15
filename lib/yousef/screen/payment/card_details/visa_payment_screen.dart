
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/button_widget.dart';
import 'package:meaw/yousef/widgets/text_form_field.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

class VisaPaymentScreen extends StatelessWidget {
   VisaPaymentScreen({Key? key}) : super(key: key);

  TextEditingController cardName =  TextEditingController();
  TextEditingController cardNumber =  TextEditingController();
  TextEditingController cardValidThru =  TextEditingController();
  TextEditingController cardCvv =  TextEditingController();
@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:  EdgeInsets.all(8.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(children: [
                /// Back widgets

                Utils.backWidget(context),
                const Spacer(),
                TextWidget(
                  title: "Card Details",
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
              ]),
              SizedBox(
                height: 24.h,
              ),
              Center(child: Image.asset("assets/images/payment_methods.png")),
              SizedBox(
                height: 45.h,
              ),
              defaultTextFormField(
                controller: cardName,
                validator: (value){},
                inputType: TextInputType.text,
                label: "Name of the card",
                context: context,
              ),
              SizedBox(
                height: 26.h,
              ),
              defaultTextFormField(
                controller: cardNumber,
                validator: (value){},
                inputType: TextInputType.number,
                label: "Card Number",
                context: context,
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(

                children: [
                  Expanded(child: defaultTextFormField(
                    controller: cardValidThru,
                    validator: (value){},
                    inputType: TextInputType.number,
                    label: "Valid Thru",
                    context: context,
                  ), ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(child: defaultTextFormField(
                    controller: cardCvv,
                    validator: (value){},
                    inputType: TextInputType.number,
                    label: "CVV",
                    context: context,
                  ), ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              ButtonWidget(
                title: "Submit",
                radius: 1,
                width: 46.w,

              ),
            ],
          ),
        ),
      )),
    );
  }
}
