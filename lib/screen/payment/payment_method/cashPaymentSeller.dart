import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/screen/payment/payment_method/orderSummarySeller.dart';
import 'package:meaw/utilis/urilis.dart';
import 'package:meaw/core/widgets/button_widget.dart';
import 'package:meaw/core/widgets/text_form_field.dart';
import 'package:meaw/core/widgets/text_widget.dart';
class CashPaymentSellerScreen extends StatelessWidget {
  CashPaymentSellerScreen({required this.price}) : super();
String? price;
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
                    onTap: () async {

                       Utils.openScreen(context, OrderSummarySeller(
                         address:address.text,
                         phone:phone.text,
                         name:name.text,
                         price: price,
                       ));
                    },

                  ),

                ],
              ),
            ),
          )

      ),
    );
  }
}