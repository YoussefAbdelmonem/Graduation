
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/screen/pages/OrderSummary.dart';
import 'package:meaw/screen/pages/orderdone.dart';
import 'package:meaw/screen/payment/payment_cash/addressModel.dart';
import 'package:meaw/utilis/urilis.dart';
import 'package:meaw/core/widgets/text_widget.dart';

import '../../../core/widgets/button_widget.dart';
import '../../../core/widgets/text_form_field.dart';

class CashPaymentScreen extends StatelessWidget {
   CashPaymentScreen({this.shelterid,this.postid,this.price,this.petname,this.petimage,this.petgender,this.petcategory,this.petage,this.petweight}) : super();
   String? shelterid;
   String? postid;
   String? price;
   String? petcategory;
   String? petgender;
   String? petage;
   String? petweight;
   String? petimage;
   String? petname;
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
                      fontSize: 24.sp,
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
                    radius: 6,
                    // fontSize: 24.sp,
                    width: 46.w,
                    onTap: () async {
                      FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
                      AddressModel adressModel =
                      AddressModel(
                        name: name.text,
                        phone:phone.text ,
                        addressDetails: addressDetails.text,
                        address: address.text,
                        id: postid
                      );
                      // UserModel user ;
                      ///
                      // المفروض اليوزر id بتاع اليوزر العادي مش شلتر ومش سيلر عدليها بعدين
                      await firestoreInstance
                          .collection("paymentD")
                          .doc(uId)
                          .collection("paymentD")

                      ///TODO .id and then pass the user id to  add product
                          .add(adressModel.toMap());
                      Utils.openScreen(context, OrderSummary(shelterid: shelterid,
                        postid: postid,price: price,name: name.text,
                        address: address.text,phone: phone.text,addressDetails: addressDetails.text,petweight:petweight ,
                        petage:petage ,petcategory:petcategory ,petgender:petgender ,petimage:petimage ,petname:petname ,
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
