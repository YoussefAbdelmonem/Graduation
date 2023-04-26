import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';
import 'package:meaw/yousef/screen/payment/payment_method/payment_methods_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';

import '../../constant/colors.dart';
import '../../widgets/text_widget.dart';
import 'Chat.dart';
import 'Products.dart';
import 'Services.dart';
import 'Translate.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int selected_index = 2;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Utils.backWidget(context),
        title: Text(
          'My cart',
          style: TextStyle(color: Colors.black, fontSize: 26.sp),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('carts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Lottie.network(
                        "https://assets6.lottiefiles.com/packages/lf20_c5vj9laj.json",
                        height: 120.h,
                        width: 120.w,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Lottie.asset("assets/lottie/error.json");
                    }
                    if (snapshot.hasError) {
                      return Lottie.asset("assets/lottie/error.json");
                    }
                    if (!snapshot.hasData) {
                      return Lottie.asset("assets/lottie/error_cat.json");
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: snapshot.data?.docs.length ?? 0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = snapshot.data?.docs[index];
                            return Card(
                              borderOnForeground: true,
                              shadowColor: mainColor,
                              shape: Border.all(color: mainColor, width: 0.1),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 150.h,
                                            width: 150.w,
                                            child: Image(
                                              image: NetworkImage(
                                                  data?['image'] ?? ''),
                                            ),
                                          ),
                                          15.pw,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                                width: 140.w,
                                                child: Text(
                                                  data?['details'] ?? '',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textBaseline: TextBaseline
                                                          .alphabetic),
                                                  maxLines: 3,
                                                ),
                                              ),
                                              10.ph,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                    title: data?['price'] ?? '',
                                                    color: mainColor,
                                                  ),
                                                  20.pw,
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.minimize,
                                                      color: mainColor,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Text('1'),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  GestureDetector(
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: mainColor,
                                                      size: 20,
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.fromLTRB(280.w, 0, 50.w, 0),
                                        child: IconButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('carts')
                                                  .doc(data?.id)
                                                  .delete();
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: mainColor,
                                              size: 20.h,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                    return const Text('NO data');
                  }),
              SizedBox(
                height: 40.h,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20).r,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: KColorPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed: () {
                        Utils.openScreen(context, PaymentMethodsScreen());
                      },
                      child: Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 20.sp),
                      ))),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
