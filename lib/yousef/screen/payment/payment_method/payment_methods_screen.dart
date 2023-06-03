

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/payment/card_details/visa_payment_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/button_widget.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../payment_cash/cash_payment_screen.dart';

enum PaymentType {
  cashPayment,
  visaPayment,
  paypalPayment,
}

class PaymentMethodsScreen extends StatefulWidget {
  PaymentMethodsScreen({ this.shelterid,this.postid,this.price,this.petweight,this.petage,this.petcategory,this.petgender,this.petimage,this.petname}) : super();
String? shelterid;
  String? postid;
  String? price;
  String? petcategory;
  String? petgender;
  String? petage;
  String? petweight;
  String? petimage;
  String? petname;
  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  PaymentType? paymentType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(0.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
              height: 30.h,
            ),
            Row(children: [

              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: Utils.backWidget(context),
              ),


              const Spacer(),
              TextWidget(
                title: "Payment Methods",
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
              height: 18.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: TextWidget(
                title: "Choose a payment\n Option",
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            RadioListTile<PaymentType>(
              value: PaymentType.visaPayment,
              groupValue: paymentType,
               title: Card(
                 child: Container(
                   decoration: BoxDecoration(

                       borderRadius: BorderRadius.circular(1),
                   ),
                   height: 60.h,
                   child: Row(
                    children: [
                      Image.asset("assets/images/visa.png",
                        width: 36.w,),
                      SizedBox(
                        width: 12.w,
                      ),

                      TextWidget(title: "Credid/Debit card",fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ]
                   ),
                 ),
               ),
              activeColor: mainColor,
              onChanged: (value) {
                setState(() {
                  paymentType = value;
                });
              },
            ),
            RadioListTile<PaymentType>(
              value: PaymentType.paypalPayment,
              groupValue: paymentType,
              title: Card(


                child: Container(
                  decoration: BoxDecoration(


                    borderRadius: BorderRadius.circular(1),




                  ),
                  height: 60.h,
                  child: Row(
                      children: [
                        Image.asset("assets/images/paypal.png",
                          width: 36.w,),
                        SizedBox(
                          width: 12.w,
                        ),

                        TextWidget(title: "Paypal",fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ]
                  ),
                ),
              ),
              activeColor: mainColor,
              onChanged: (value) {
                setState(() {
                  paymentType = value;
                });
              },
            ),
            RadioListTile<PaymentType>(
              value: PaymentType.cashPayment,
              groupValue: paymentType,
              title: Card(
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(1),
                  ),
                  height: 60.h,
                  child: Row(
                      children: [
                        Image.asset("assets/images/cash.png",
                          width: 36.w,),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextWidget(title: "Payment is cash",fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ]
                  ),
                ),
              ),
              activeColor: mainColor,
              onChanged: (value) {
                setState(() {
                  paymentType = value;
                });
              },
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonWidget(
                title: "Continue",
                onTap: () {

                  if(paymentType == PaymentType.cashPayment) {
                    Utils.openScreen(context,  CashPaymentScreen(
                      shelterid: widget.shelterid,postid:widget.postid,price: widget.price,petweight: widget.petweight,
                    petname:widget.petname,petage: widget.petage,petcategory: widget.petcategory,petgender: widget.petgender,
                      petimage: widget.petimage,
                    ));
                  } else if(paymentType == PaymentType.visaPayment) {
                    Utils.openScreen(context,  VisaPaymentScreen());
                  } else if(paymentType == PaymentType.paypalPayment) {
                    Utils.openScreen(context,  VisaPaymentScreen());

                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                      content: Text("Please select a payment method"),
                          backgroundColor: Colors.red,

                    ));
                  }

                },
                radius: 1,
              ),
            ),
        ],
      ),
          )),
    );
  }
}
