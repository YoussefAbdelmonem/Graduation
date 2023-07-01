import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/screen/pages/orderdone.dart';
class OrderSummarySeller extends StatelessWidget {
  OrderSummarySeller({
    required this.name,
    required this.phone,
    required this.address,
    required this.price
  }) : super();
  String? name;
  String? address;
  String? phone;
  String? price;
  double? priceCompute(){
    double total=0.0;
    total=(double.tryParse(price!)!+50);
    return total;
  }
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Order Summary',
              style: TextStyle(color: Colors.black, fontSize: 26.sp),
            ),
            centerTitle: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white),
          ),
          body: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 20).r,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order Id: ',
                          style: TextStyle(fontSize: 20.sp, color: KColorPrimary),
                        ),
                        Text(
                          '152432859510',
                          style: TextStyle(fontSize: 20.sp, color: Colors.black),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Color(0xffddc1b6)),
                          borderRadius: BorderRadius.circular(4).w),
                      margin: const EdgeInsets.only(top: 20).r,
                      padding: const EdgeInsets.only(left: 12, top: 22, bottom: 20,right: 12).r,
                      //color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Sub Total',
                                style: TextStyle(color: KColorPrimary),
                              ),
                              Expanded(child: Container()),
                              Text('${price} EGP')
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Shipping',
                                style: TextStyle(color: KColorPrimary),
                              ),
                              Expanded(child: Container()),

                              const Text('50 EGP')
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(color: KColorPrimary),
                              ),
                              Expanded(child: Container()),
                              Text('${priceCompute()} EGP')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Info',
                          style: TextStyle(color: KColorPrimary, fontSize: 22.sp),
                          textAlign: TextAlign.start,
                        )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Color(0xffddc1b6)),
                          borderRadius: BorderRadius.circular(4).w),
                      margin: const EdgeInsets.only(top: 10, bottom: 20).r,
                      padding: const EdgeInsets.only(left: 12, top: 18, bottom: 20,right: 12).r,
                      //color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Row(
                            children:  [
                              Text(
                                name!,
                                style: TextStyle(color: Color(0xff525252)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children: [
                              const Text(
                                'password',
                                style: TextStyle(color: Color(0xff525252)),
                              ),
                              SizedBox(
                                width: 220.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children:  [
                              Text(
                                address!,
                                style: TextStyle(color: Color(0xff525252)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              '${phone}',
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Delivery method',
                          style: TextStyle(color: KColorPrimary, fontSize: 22.sp),
                          textAlign: TextAlign.start,
                        )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: const Color(0xffddc1b6)),
                          borderRadius: BorderRadius.circular(4).w),
                      margin: const EdgeInsets.only(top: 10, bottom: 20).r,
                      padding: const EdgeInsets.only(
                          left: 12, top: 18, bottom: 20, right: 90).r,
                      //color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Cash',
                                style: TextStyle(color: Color(0xff525252)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const Text(
                            'The order will arrive on Saturday at 10 am. You can follow the order from the page Order Tracking',
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: KColorPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 15)),
                            onPressed: () async{
                              navigateTo(context, Order_Done());
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(fontSize: 20.sp),
                            ))),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              )),
        );

  }
}