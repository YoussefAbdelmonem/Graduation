import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({Key? key}) : super(key: key);

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
              margin: EdgeInsets.only(top: 25, right: 29),
              child: Image.asset('assets/images/pet_detail.png'),
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Text(
                  'Lola',
                  style: TextStyle(fontSize: 24.sp, color: KColorPrimary),
                ),
                SizedBox(
                  width: 215.w,
                ),
                Text(
                  'Girl',
                  style: TextStyle(fontSize: 19.sp, color: Color(0xffEA7B9C)),
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                GestureDetector(
                  child: const Image(
                    image: AssetImage('assets/images/location.png'),
                  ),
                ),
                Text(
                  ' Mansoura(30km away)',
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
                            ' 1 Year 2 Months',style: TextStyle(fontSize: 14.sp),
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
                           Text(' 4 Kg 5Gram',style: TextStyle(fontSize: 14.sp),)
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
                  ' Doesn\'t have any diseases and \n efects vaccainated ',
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
                  ' So lovely baby , love hugs , playfull one.',
                  style: TextStyle(fontSize: 16.sp),

                )),

            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 25, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KColorPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    onPressed: () {},
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
