
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(16.0.w),
            child: Column(
        children: [
            16.ph,
            Row(
              children: [
                Utils.backWidget(context),
                Spacer(),
                TextWidget(
                  title: "FAVORITES ",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                ),
                Spacer(),

              ],
            ),
            24.ph,
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('favorites')

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
                                      Positioned(
                                        left: 90,
                                        top: 2,
                                        child:  IconButton(onPressed: ()
                                        async {
                                          await  FirebaseFirestore.instance.collection('category')
                                              .doc('accessories')
                                              .collection('accessories')
                                              .doc(data?.id)
                                              .update({"favorite":data?['favorite']});

                                          data?['favorite'] ?FirebaseFirestore.instance.collection('favorites')
                                              .doc(data?.id)
                                              .set(data?.data() as Map<String , dynamic>):FirebaseFirestore.instance.collection('favorites')
                                              .doc(data?.id)
                                              .delete();
                                        }
                                          , icon:data?['favorite']? Icon(Icons.favorite,color: mainColor,):Icon(Icons.favorite,color: mainColor,),

                                        ),

                                      ),
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
                                    height: 6.h,
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return const Text('NO data');
                }),
        ],
      ),
          )),
    );
  }
}
