
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../../constant/colors.dart';
import '../../widgets/text_field.dart';

class ShelterPetsScreen extends StatelessWidget {
  const ShelterPetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
           height: 64.h,
         ),
         Row(

           children: [
             Utils.backWidget(context),
             const Spacer(),
             TextWidget(title: "Happy Friend Shelter",fontSize: 24.sp,),
             const Spacer(),

           ],
         ),
         SizedBox(
           height: 12.h,
         ),
         TextWidget(title: "Find a New Friend",fontSize: 12.sp,fontWeight:FontWeight.w600 ,),
         SizedBox(
           height: 12.h,
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFieldWidget(
             onChanged: (val) {},
             hintText: "Search for pets",
             prefixIcon: const Icon(Icons.search),
             suffixIcon: Image.asset("assets/images/filter.png"),


           ),
         ),
         SizedBox(
           height: 12.h,
         ),
         SizedBox(
           height: 240.h,

           child: ListView.builder(
             itemBuilder: (context, index) {
               return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 4.w),
                 child: Card(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Stack(
                         children: [
                           Image.asset(
                             "assets/images/lola.png",
                             height: 110,
                             width: 160,
                             fit: BoxFit.cover,
                           ),
                           Positioned(
                               right: 8,
                               top: 2,
                               child: Image.asset(
                                 "assets/images/heart.png",
                               )),
                         ],
                       ),
                       SizedBox(
                         height: 10.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(8.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "Lola",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                             ),
                             SizedBox(
                               width: 100.w,
                             ),
                             TextWidget(
                               title: "Girl",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                               color: Colors.pink,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 2.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(3.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "30km away",
                               color: Colors.grey,
                               fontSize: 14.sp,
                             ),
                             SizedBox(width: 45.w),
                             TextWidget(
                               title: "1Year",
                               color: blackColor,
                               fontSize: 14.sp,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 6.h,
                       ),
                     ],
                   ),
                 ),
               );
             },
             itemCount: 2,
             scrollDirection: Axis.horizontal,
           ),

         ),
         SizedBox(
           height: 240.h,

           child: ListView.builder(
             itemBuilder: (context, index) {
               return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 4.w),
                 child: Card(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Stack(
                         children: [
                           Image.asset(
                             "assets/images/lola.png",
                             height: 110,
                             width: 160,
                             fit: BoxFit.cover,
                           ),
                           Positioned(
                               right: 8,
                               top: 2,
                               child: Image.asset(
                                 "assets/images/heart.png",
                               )),
                         ],
                       ),
                       SizedBox(
                         height: 10.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(8.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "Lola",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                             ),
                             SizedBox(
                               width: 100.w,
                             ),
                             TextWidget(
                               title: "Girl",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                               color: Colors.pink,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 2.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(3.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "30km away",
                               color: Colors.grey,
                               fontSize: 14.sp,
                             ),
                             SizedBox(width: 45.w),
                             TextWidget(
                               title: "1Year",
                               color: blackColor,
                               fontSize: 14.sp,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 6.h,
                       ),
                     ],
                   ),
                 ),
               );
             },
             itemCount: 2,
             scrollDirection: Axis.horizontal,
           ),

         ),
         SizedBox(
           height: 240.h,

           child: ListView.builder(
             itemBuilder: (context, index) {
               return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 4.w),
                 child: Card(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Stack(
                         children: [
                           Image.asset(
                             "assets/images/lola.png",
                             height: 110,
                             width: 160,
                             fit: BoxFit.cover,
                           ),
                           Positioned(
                               right: 8,
                               top: 2,
                               child: Image.asset(
                                 "assets/images/heart.png",
                               )),
                         ],
                       ),
                       SizedBox(
                         height: 10.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(8.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "Lola",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                             ),
                             SizedBox(
                               width: 100.w,
                             ),
                             TextWidget(
                               title: "Girl",
                               fontWeight: FontWeight.w400,
                               fontSize: 14.sp,
                               color: Colors.pink,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 2.h,
                       ),
                       Padding(
                         padding:  EdgeInsets.all(3.0.w),
                         child: Row(
                           children: [
                             TextWidget(
                               title: "30km away",
                               color: Colors.grey,
                               fontSize: 14.sp,
                             ),
                             SizedBox(width: 45.w),
                             TextWidget(
                               title: "1Year",
                               color: blackColor,
                               fontSize: 14.sp,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 6.h,
                       ),
                     ],
                   ),
                 ),
               );
             },
             itemCount: 2,
             scrollDirection: Axis.horizontal,
           ),

         ),



       ],
      ),
    )

    );
  }
  // Widget buildMyCoursesCard(context)=> GestureDetector(
  //   onTap: (){
  //   },
  //   child: SizedBox(
  //     width: .46.sw,
  //
  //
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //
  //         Stack(
  //           children: [
  //             Image.asset(
  //               "assets/images/lola.png",
  //               height: 110,
  //             ),
  //             Positioned(
  //                 right: 8,
  //                 top: 2,
  //                 child: Image.asset(
  //                   "assets/images/heart.png",
  //                 )),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 12.h,
  //         ),
  //         Padding(
  //           padding:  EdgeInsets.only(right: 10.w),
  //           child: Row(
  //             children: [
  //               /// Name of the category
  //
  //               TextWidget(
  //                 title: "التسويق العقاري",
  //                 fontSize: 8.sp,
  //                 color: mainColor,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //               SizedBox(
  //                 width: 73.w,
  //               ),
  //               SizedBox(
  //                 width: 2.w,
  //               ),
  //
  //               /// rating
  //               TextWidget(
  //                 title: "4.6",
  //                 fontSize: 8.sp,
  //                 color: blackColor,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //
  //
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: 8.h,
  //         ),
  //         /// description of the course
  //         Padding(
  //           padding:  EdgeInsets.only(right: 12.w),
  //           child: Text(
  //
  //             "دورة التسويق العقاري معتمد\n بشهادة",
  //             overflow: TextOverflow.ellipsis,
  //             maxLines: 2,
  //
  //             style: TextStyle(
  //               fontSize: 10.sp,
  //               fontWeight: FontWeight.w500,
  //
  //             ),
  //
  //
  //
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10.h,
  //         ),
  //
  //         SizedBox(
  //           height: 2.h,
  //         ),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //
  //
  //
  //             TextWidget(
  //               title: "50%",
  //               color: mainColor,
  //               fontSize: 6.sp,
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 14.h,
  //         ),
  //         /// price of the course
  //         Padding(
  //           padding:  EdgeInsets.only(right: 12.w),
  //           child: Row(
  //             children: [
  //               TextWidget(
  //                 title: "السعر:",
  //                 fontSize: 8.sp,
  //                 color: greyText,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //               SizedBox(
  //                 width: 5.w,
  //               ),
  //               TextWidget(
  //                 title: "100 رس",
  //                 fontSize: 8.sp,
  //                 color: blackColor,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //               SizedBox(
  //                 width: 5.w,
  //               ),
  //
  //               /// offer
  //               TextWidget(
  //                 title: "120 رس",
  //                 fontSize: 8.sp,
  //                 color: greyText,
  //                 fontWeight: FontWeight.w600,
  //                 isOffer: true,
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: 15.h,
  //         ),
  //
  //         /// instructor of the course
  //         Padding(
  //           padding:  EdgeInsets.only(right: 12.w),
  //           child: Row(
  //             children: [
  //               SizedBox(
  //                 width: 5.w,
  //               ),
  //               TextWidget(
  //                 title: "أ/ احمد محمد",
  //                 fontSize: 8.sp,
  //                 color: mainColor,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   ),
  // );

}
