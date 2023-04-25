
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('carts')

                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Lottie.network(
                        "https://assets6.lottiefiles.com/packages/lf20_c5vj9laj.json",
                        height: 120.h,
                        width: 120.w,
                      );
                    }
                    if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Lottie.asset("assets/lottie/error.json");
                    }
                    if (snapshot.hasError) {
                      return Lottie.asset("assets/lottie/error.json");
                    }
                    if (!snapshot.hasData) {
                      return Lottie.asset("assets/lottie/error_cat.json");
                    }
                    if (snapshot.hasData) {
                      return Expanded(
                        child: GridView.builder(
                            primary: false,
                            padding: const EdgeInsets.all(10),
                            itemCount: snapshot.data?.docs.length??0,

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
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Stack(
                                      children: [

                                        Image.network(
                                          data?['image'],
                                          height: 110,
                                          width: double.infinity,
                                        ),
                                        // Positioned(
                                        //   left: 90,
                                        //   top: 2,
                                        //   child:  IconButton(
                                        //     onPressed: ()
                                        //   async {
                                        //     await  FirebaseFirestore.instance.collection('category')
                                        //         .doc('accessories')
                                        //         .collection('accessories')
                                        //         .doc(data?.id)
                                        //         .update({"cart":data?['cart']});
                                        //
                                        //     data?['cart'] ?FirebaseFirestore.instance.collection('cart')
                                        //         .doc(data?.id)
                                        //         .set(data?.data() as Map<String , dynamic>):FirebaseFirestore.instance.collection('cart')
                                        //         .doc(data?.id)
                                        //         .delete();
                                        //   }
                                        //     , icon:data?['favorite']? Icon(Icons.favorite,color: mainColor,):Icon(Icons.favorite,color: mainColor,),
                                        //
                                        //   ),
                                        //
                                        // ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: 10.w,

                                      ),
                                      child: TextWidget(
                                        title: data?['name'] ?? '',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: 10.w,

                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            color: mainColor,
                                            height: 20.h,
                                            width: 60.w,

                                            /// the price of the product
                                            child: Center(
                                              child: TextWidget(
                                                title:
                                                "${data?['price'] ??
                                                    ''} EGP",
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 24.w),


                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                    return const Text('NO data');
                  }),
            ),

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
                    onPressed: () {},
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
    );
  }
}
