import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';


class Order_Done extends StatelessWidget {
   Order_Done({this.shelterid,this.postid,this.price,this.address,this.phone,this.name}) : super();
   String? shelterid;
   String? price;
   String? postid;
   String? name;
   String? address;
   String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //       statusBarIconBrightness: Brightness.dark,
      //       statusBarColor: Colors.white),
      // ),
      body: Container(
          margin: const EdgeInsets.only(left: 35, right: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Done.png'),
              Container(margin: const EdgeInsets.only(top: 30,),
                  child: Text(
                    'Your order has successfully\n placed.',
                    style: TextStyle(fontSize: 19.sp),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(  top: 80),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: KColorPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed: () {
                        navigateTo(context,HomeScreen());
                      },
                      child: Text(
                        'Back To Home',
                        style: TextStyle(fontSize: 20.sp),
                      ))),
            ],
          )),
    );
  }
}
