
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/screen/shelter_pets/shelter_pets_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../../widgets/button_widget.dart';
import '../donate/donate_screen.dart';

class ShelterNameScreen extends StatelessWidget {
  const ShelterNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             height: 46.h,
           ),
           Row(
             children: [
               Utils.backWidget(context),
               const Spacer(),
               TextWidget(title: "Happy Friend Shelter",fontSize: 24.sp,fontWeight: FontWeight.w500,),
               const Spacer(),

             ],
           ),
           SizedBox(
             height: 24.h,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset("assets/images/happy_friend.png"),

             ],
           ),
           SizedBox(
             height: 24.h,
           ),
           /// details of the Shelter
           Row(
             children: [
               Image.asset("assets/images/clock.png"),
               SizedBox(width: 8.w,),
               TextWidget(title: "Open from 8pm till 8am",fontSize: 14.sp,fontWeight: FontWeight.w400),

             ],
           ),
           SizedBox(
             height: 8.h,
           ),
           Row(
             children: [
               Image.asset("assets/images/calender.png"),
               SizedBox(width: 8.w,),
               TextWidget(title: "Monday-Sunday",fontSize: 14.sp,fontWeight: FontWeight.w400),

             ],
           ),
           SizedBox(
             height: 8.h,
           ),
           Row(
             children: [
               Image.asset("assets/images/location.png"),
               SizedBox(width: 8.w,),
               TextWidget(title: " El-Mashaya, Mansoura , Egypt",fontSize: 14.sp,fontWeight: FontWeight.w400),

             ],
           ),
           SizedBox(
             height: 8.h,
           ),
           Row(
             children: [
               Image.asset("assets/images/phone.png"),
               SizedBox(width: 8.w,),
               TextWidget(title: "+01275024454",fontSize: 14.sp,fontWeight: FontWeight.w400),

             ],
           ),
           SizedBox(
             height: 8.h,
           ),
           Row(
             children: [
               Image.asset("assets/images/email.png"),
               SizedBox(width: 8.w,),
               TextWidget(title: "happyfriendshelter@gmail.com",fontSize: 14.sp,fontWeight: FontWeight.w400),

             ],
           ),
           SizedBox(
             height: 24.h,
           ),
           Image.asset("assets/images/map.png"),
           SizedBox(
             height: 24.h,
           ),
           ButtonWidget(
             title: "Adopt",
             radius: 1,
             width: 46.w,
             onTap: ()
             {
               Utils.openScreen(context, const ShelterPetsScreen());
             },

           ),
           SizedBox(
             height: 8.h,
           ),
           ButtonWidget(
             title: "Donate",
             radius: 1,
             width: 46.w,
             onTap: ()
             {
               Utils.openScreen(context, const DonateScreen());


             },

           ),


         ],
        ),
      ),
    )

    );
  }
}
