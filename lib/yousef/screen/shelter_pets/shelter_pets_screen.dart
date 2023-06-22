import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/userReport/cubit/reportStates.dart';
import 'package:meaw/yousef/screen/shelter/filterWidget.dart';
import 'package:meaw/yousef/screen/shelter_details/shelter-pet_details.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../../../components/constants.dart';
import '../../../userReport/cubit/reportCubit.dart';

import '../../constant/colors.dart';
import '../../widgets/text_field.dart';

class ShelterPetsScreen extends StatelessWidget {
  const ShelterPetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
              GestureDetector(
                child: TextWidget(
                  title: "Happy Friend Shelter",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextWidget(
              title: "Find a New Friend",
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
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
              suffixIcon: GestureDetector(
                  onTap: () {
                    // Utils.openScreen(context, BuildFilter(postModelsList: postModelsList));
                  },
                  child: Image.asset("assets/images/filter.png")),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 260.h,
            child: ListView.builder(
                primary: false,
                padding: const EdgeInsets.all(10),
                itemCount: postModelsList.toSet().length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = postModelsList[index];

                  return GestureDetector(
                    onTap: () {
                      Utils.openScreen(
                          context,
                          ShelterPetDetails(
                            name: data.name??"",
                            image: data.image??"",
                            gender: data.gender??"",
                            price: data.price??"",
                            age: data.age??"",
                            weight: data.weight??"",
                            health: data.health??"",
                            behavior: data.behavior??"",
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  data.image ?? "",
                                  height: 110,
                                  width: 180,
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
                              padding: EdgeInsets.all(8.0.w),
                              child: Row(
                                children: [
                                  TextWidget(
                                    title: data.name,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                  ),
                                  TextWidget(
                                    title: data.gender,
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
                              padding: EdgeInsets.all(8.0.w),
                              child: Row(
                                children: [
                                  TextWidget(
                                    title: "30km away",
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(width: 80.w),
                                  TextWidget(
                                    title: "${data.age}${" months"}",
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
                }),
          )
        ],
      ),
    ));
  }


}
