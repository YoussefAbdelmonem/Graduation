import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';
import 'package:meaw/yousef/screen/payment/payment_method/payment_methods_screen.dart';

class PetDetails extends StatelessWidget {
  PetDetails({required this.petModel}) : super();
PostModel petModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pet Details',
          style: TextStyle(color: Colors.black, fontSize: 26.sp),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 27),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, right: 29),
              child: Image.network('${petModel!.image}'),
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Text(
                  '${petModel!.name}',
                  style: TextStyle(fontSize: 24.sp, color: KColorPrimary),
                ),
                SizedBox(
                  width: 215.w,
                ),
                Text(
                  '${petModel!.gender}',
                  style: TextStyle(fontSize: 19.sp, color: Color(0xffEA7B9C)),
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                // GestureDetector(
                //   child: const Image(
                //     image: AssetImage('assets/images/location.png'),
                //   ),
                // ),
                Text(
                  ' ${petModel!.price }\$',
                  style: TextStyle(fontSize: 16.sp),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 40, top: 19),
                child: Row(
                  children: [
                    Container(width: 125.w,
                      padding:
                          EdgeInsets.symmetric( vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEBDAAF)),
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xffEBDAAF)),
                      child: Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            ' ${petModel!.age}',style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(width: 125.w,
                      padding: const EdgeInsets.symmetric(
                           vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffC0CDAC)),
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xffC0CDAC)),
                      child: Column(
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                           Text('${petModel!.weight}',style: TextStyle(fontSize: 14.sp),)
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  'Health',
                  style: TextStyle(color: KColorPrimary, fontSize: 19.sp),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  ' ${petModel!.health} ',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.justify,
                )),
            SizedBox(
              height: 9.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  'Pet behaviour',
                  style: TextStyle(color: KColorPrimary, fontSize: 19.sp),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  ' ${petModel!.behavior}',
                  style: TextStyle(fontSize: 16.sp),

                )),

            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 25, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KColorPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    onPressed: () {
                      navigateTo(context, PaymentMethodsScreen(shelterid: petModel!.shelterid,postid:petModel!.id ,price:petModel!.price
                        ,petname: petModel.name,petimage: petModel.image,petgender: petModel.gender,petcategory: petModel.category,petage: petModel.age,
                        petweight: petModel.weight,
                      ));
                    },
                    child: Text(
                      'Adoption',
                      style: TextStyle(fontSize: 20.sp),
                    ))),
            SizedBox(
              height: 20.h,
            )
          ],
        )),
      ),
    );
  }
}
