import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/screen/products_accessories/products_accessories_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/colors.dart';
import '../../widgets/text_widget.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final controller = PageController(
    initialPage: 1,
  );
  List<String> images =[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8ko2NIzTRS38SLLoAD2KC-7bF_RCtVDvSVg&usqp=CAU",
    "https://th.bing.com/th/id/OIP.v9mjLB1Ir0rt5jkhaKPR_QHaHa?w=218&h=218&c=7&r=0&o=5&pid=1.7",
    "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1655739318-BreakawayLeatherCatCollar-EmeraldGreen-Supakit-AdultSize.png",
  ];
  List<String> names =[
    "Cat Tie",
    "dry food",
    "collar",
  ];
  List<String> prices =[
    "52",
    "87",
    "100",
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 110.w,
                  ),
                  TextWidget(
                    title: "Products".tr(),
                    fontWeight: FontWeight.w400,
                    fontSize: 26.sp,
                  ),
                  Spacer(),
                  Image.asset("assets/images/search.png")
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 200.h,
                child: PageView(
                  controller: controller,
                  children: [
                    Image.asset("assets/images/pageview.png"),
                    Image.asset("assets/images/pageview.png"),
                    Image.asset("assets/images/pageview.png"),
                    Image.asset("assets/images/pageview.png"),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130.w,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 4.0,
                        radius: 4.0,
                        dotWidth: 12.0,
                        dotHeight: 8.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: greyDot,
                        activeDotColor: greyDotFill),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              TextWidget(
                title: "Category",
                color: mainColor,
                fontWeight: FontWeight.w400,
                fontSize: 26.sp,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Utils.openScreen(context,
                          ProductsAccessoriesScreen(isFood: kindData.food));
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/images/food.png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextWidget(
                          title: "Food",
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Utils.openScreen(
                          context,
                          ProductsAccessoriesScreen(
                              isFood: kindData.accessories));
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/images/accessories.png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextWidget(
                          title: "Accessories",
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              TextWidget(
                title: "Recommended for you",
                color: mainColor,
                fontWeight: FontWeight.w400,
                fontSize: 26.sp,
              ),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                height: 215.h,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                "${images[index]}",
                                height: 110,
                              ),
                              Positioned(
                                  right: 0.w,
                                  left: 75.w,
                                  top: 1.h,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.favorite_border,color: mainColor,),
                                  )),
                            ],
                          ),
                          8.ph,
                          Padding(
                            padding:  EdgeInsets.only(left: 10.w),
                            child: TextWidget(
                              title: "${names[index]}",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          16.ph,
                          Padding(
                            padding:  EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Container(
                                  color: mainColor,
                                  height: 20.h,
                                  width: 60.w,

                                  /// the price of the product
                                  child: Center(
                                    child: TextWidget(
                                      title: "${prices[index]} EGP",
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24.w),
                                Image.asset(
                                  "assets/images/plus.png",
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                ),

              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCardItem({
    required String image,
    required String name,
    required String price,
  }) =>
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  image,
                  height: 110,
                ),
                Positioned(
                    right: 0.w,
                    left: 75.w,
                    top: 1.h,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: mainColor,
                      ),
                    )),
              ],
            ),
            8.ph,
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: TextWidget(
                title: name,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            16.ph,
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                children: [
                  Container(
                    color: mainColor,
                    height: 20.h,
                    width: 60.w,

                    /// the price of the product
                    child: Center(
                      child: TextWidget(
                        title: price,
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Image.asset(
                    "assets/images/plus.png",
                    height: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
          ],
        ),
      );
}
