
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/donate/donate_screen.dart';
import 'package:meaw/yousef/screen/payment/payment_method/payment_methods_screen.dart';
import 'package:meaw/yousef/widgets/text_field.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../shelter_name/shelter_name_screen.dart';
enum ShelterData { nearbyPets, shelter, }

class ShelterScreen extends StatelessWidget {
   ShelterScreen({Key? key}) : super(key: key);
   ShelterData isShelter = ShelterData.shelter;
   ShelterData isNearbyPet = ShelterData.nearbyPets;
  String shelters = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(8.0.w),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              SizedBox(
                height: 64.h,
              ),
              Row(
                children: [
                  /// back Widget
                  const Spacer(),
                  TextWidget(
                    title: "Shelter",
                    fontWeight: FontWeight.w500,
                    fontSize: 26.sp,
                  ),
                  const Spacer()
                ],
              ),
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
                height: 21.h,
              ),
              TextWidget(
                title: "Nearby Pets",
                fontWeight: FontWeight.w500,
                fontSize: 26.sp,
                color: mainColor,
              ),
        SizedBox(
          height: 200.h,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('shelters')
                  .doc(isNearbyPet.name)
                  .collection(isNearbyPet.name)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text('No Internet Concction'),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error in Data'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
                if (snapshot.hasData) {
                  return Expanded(
                      child: GridView.builder(
                          primary: false,
                          padding: const EdgeInsets.all(10),
                          itemCount: snapshot.data?.docs.length,

                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 170,
                            childAspectRatio: 1.0,
                            mainAxisExtent: 170,

                            crossAxisSpacing: 12,

                          ),
                          itemBuilder: (context, index) {
                            final data = snapshot.data?.docs[index];
                            return Card(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        data?['image'] ?? '',
                                        height: 110,
                                      ),
                                      Positioned(
                                        height: 25.h,
                                          right: 0.2,
                                          top: 2,
                                          child: Image.asset(
                                            "assets/images/heart.png",
                                          )),
                                    ],
                                  ),
                                  TextWidget(
                                    title: data?['name'] ?? '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        color: mainColor,
                                        height: 20.h,
                                        width: 60.w,

                                        /// the price of the product
                                        // child: Center(
                                        //   child: TextWidget(
                                        //     title:
                                        //     "${data?['price'] ?? ''} EGP",
                                        //     color: Colors.white,
                                        //     fontSize: 14.sp,
                                        //   ),
                                        // ),
                                      ),
                                      SizedBox(width: 24.w),
                                      Image.asset(
                                        "assets/images/plus.png",
                                        height: 15,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                ],
                              ),
                            );
                          }));
                }
                return const Text('NO data');
              }),
        ),
              SizedBox(
                height: 240.h,

                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        child: InkWell(
                          onTap: (){
                            navigateTo(context,DonateScreen());
                          },
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
                      ),
                    );
                  },
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                ),

              ),
               SizedBox(
              height: 21.h,
        ),
               TextWidget(
              title: "Shelters",
              fontWeight: FontWeight.w500,
              fontSize: 26.sp,
              color: mainColor,
        ),
        StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('shelters')
                  .doc(isShelter.name)
                  .collection(isShelter.name)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text('No Internet Concction'),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error in Data'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 180.h,
                    child: ListView.builder(
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data?.docs.length,
                          shrinkWrap: true,
                        scrollDirection: Axis.horizontal,


                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = snapshot.data?.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data!['image'],
                                    height: 110,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 6.w),
                                    child: TextWidget(
                                      title: data['name'],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 6.w),
                                    child: TextWidget(
                                      title: data['pets number'],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );

                }
                return const Text('NO data');
              })
,
        // SizedBox(
        //     height: 215.h,
        //     child: ListView.builder(
        //       itemBuilder: (context, index) {
        //         return GestureDetector(
        //           onTap: ()
        //           {
        //             Utils.openScreen(context, const ShelterNameScreen());
        //           },
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 4),
        //             child: Card(
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Image.asset(
        //                     "assets/images/shelter1.png",
        //                     height: 110,
        //                   ),
        //                   Padding(
        //                     padding:  EdgeInsets.only(left: 6.w),
        //                     child: TextWidget(
        //                       title: "Happy Friend",
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 14.sp,
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 6.h,
        //                   ),
        //                   Padding(
        //                     padding:  EdgeInsets.only(left: 6.w),
        //                     child: TextWidget(
        //                       title: "150 pets",
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 8.sp,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //       itemCount: 5,
        //
        //       scrollDirection: Axis.horizontal,
        //     ),
        //
        // ),

      ],
    ),
            ),
          ),
        ));
  }
}
