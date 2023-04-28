import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meaw/main.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/pages/ProductDetails.dart';
import 'package:meaw/yousef/screen/products/cubit/products_cubit.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_field.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

enum kindData {
  food,
  accessories,
}

class ProductsAccessoriesScreen extends StatefulWidget {
  ProductsAccessoriesScreen({Key? key, required this.isFood}) : super(key: key);
  kindData isFood = kindData.food;

  @override
  State<ProductsAccessoriesScreen> createState() =>
      _ProductsAccessoriesScreenState();
}

class _ProductsAccessoriesScreenState extends State<ProductsAccessoriesScreen> {
  String collection = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                body: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Utils.backWidget(context),
                      Spacer(),
                      TextWidget(
                        title: "Products".tr(),
                        fontWeight: FontWeight.w400,
                        fontSize: 26.sp,
                      ),
                      Spacer(),
                    ],
                  ),
                  24.ph,
                  SizedBox(
                    height: 53.h,
                    width: double.infinity,
                    child: TextFieldWidget(
                      onChanged: (value) {},
                      type: TextInputType.text,
                      suffixIcon: Image.asset("assets/images/filter_p.png"),
                      label: "Search for Products",
                      prefixIcon: const Icon(Icons.search),
                      labelColor: greyText,
                      borderColor: greyText,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextWidget(
                    title: "Make your pet awesome".tr(),
                    fontWeight: FontWeight.w400,
                    fontSize: 26.sp,
                    color: mainColor,
                  ),
                  16.ph,
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 16.w,
                      // ),
                      Image.asset("assets/images/brownCat.png"),
                      Spacer(),
                      // SizedBox(
                      //   width: 16.w,
                      // ),
                      Image.asset("assets/images/dog.png"),
                      Spacer(),
                      // SizedBox(
                      //   width: 16.w,
                      // ),
                      Image.asset("assets/images/bird.png"),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('category')
                          .doc(widget.isFood.name)
                          .collection(widget.isFood.name)
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
                          return Expanded(
                            child: GridView.builder(
                                primary: false,
                                padding: EdgeInsets.all(10.w),
                                itemCount: snapshot.data?.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 170,
                                  childAspectRatio: 1.0,
                                  mainAxisExtent: 200,
                                  crossAxisSpacing: 12,
                                ),
                                itemBuilder: (context, index) {
                                  final data = snapshot.data?.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Utils.openScreen(
                                          context,
                                          ProductDetails(
                                            details: data?["details"] ?? "",
                                            image: data?['image'] ?? "",
                                            name: data?['name'] ?? "",
                                            price: data?['price'] ?? "",
                                          ));
                                    },
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Image.network(
                                                data?['image'],
                                                height: 110,
                                                width: double.infinity,
                                              ),
                                              Positioned(
                                                right: 0.2,
                                                top: 2,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'category')
                                                          .doc(widget
                                                              .isFood.name)
                                                          .collection(widget
                                                              .isFood.name)
                                                          .doc(data?.id)
                                                          .update({
                                                        "favorite":
                                                            !data?['favorite']
                                                      });

                                                      !data?['favorite']
                                                          ? FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'favorites')
                                                              .doc(data?.id)
                                                              .set(data?.data()
                                                                  as Map<String,
                                                                      dynamic>)
                                                          : FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'favorites')
                                                              .doc(data?.id)
                                                              .delete();
                                                    },
                                                    icon: !data?['favorite']
                                                        ? Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: mainColor,
                                                          )
                                                        : Icon(
                                                            Icons.favorite,
                                                            color: mainColor,
                                                          )),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
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
                                            padding:
                                                EdgeInsets.only(left: 10.w),
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
                                                          "${data?['price'] ?? ''} EGP",
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 24.w),
                                                IconButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          'category')
                                                          .doc(widget
                                                          .isFood.name)
                                                          .collection(widget
                                                          .isFood.name)
                                                          .doc(data?.id)
                                                          .update({
                                                        "cart":
                                                        !data?['cart']
                                                      });

                                                      !data?['cart']
                                                          ? FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          'carts')
                                                          .doc(data?.id)
                                                          .set(data?.data()
                                                      as Map<String,
                                                          dynamic>)
                                                          : FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          'carts')
                                                          .doc(data?.id)
                                                          .delete();
                                                    },
                                                    icon: !data?['cart']
                                                        ? Container(
                                                      color: mainColor,
                                                          child: const Icon(
                                                      Icons
                                                            .add,
                                                      color: Colors.white,
                                                    ),
                                                        )
                                                        : Container(
                                                      color: buttonColor,
                                                      child: const Icon(
                                                        Icons
                                                            .add,
                                                        color: Colors.white,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                        ],
                                      ),
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
        },
      ),
    );
  }
}
