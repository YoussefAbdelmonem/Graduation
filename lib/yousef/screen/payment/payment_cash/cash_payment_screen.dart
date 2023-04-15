
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_field.dart';

class CashPaymentScreen extends StatelessWidget {
   CashPaymentScreen({Key? key}) : super(key: key);
   TextEditingController name =  TextEditingController();
   TextEditingController phone =  TextEditingController();
   TextEditingController addressDetails =  TextEditingController();
   TextEditingController address =  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body:Padding(
            padding: const EdgeInsets.all(8.0),
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
                      title: "Cash Payment",
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),

                  ]),
                  SizedBox(
                    height: 67.h,
                  ),
                  defaultTextFormField(
                    controller: name,
                    validator: (value){},
                    inputType: TextInputType.text,
                    label: "Name",

                    context: context,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  defaultTextFormField(
                    controller: phone,
                    validator: (value){},
                    inputType: TextInputType.text,
                    label: "Phone",

                    context: context,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  defaultTextFormField(
                    controller: addressDetails,
                    validator: (value){},
                    inputType: TextInputType.text,
                    label: "Address Details",

                    context: context,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  defaultTextFormField(
                    controller: address,
                    validator: (value){},
                    inputType: TextInputType.text,
                    label: "Address",

                    context: context,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 84.h,
                  ),
                  ButtonWidget(
                    title: "Submit",
                    radius: 1,
                    width: 46.w,

                  ),

                ],
              ),
            ),
          )

      ),
    );
  }
}
