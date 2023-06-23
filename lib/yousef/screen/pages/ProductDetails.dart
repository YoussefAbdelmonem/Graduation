import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/data/models/product_model.dart';
import 'package:meaw/yousef/screen/pages/MyCart.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';
import 'package:meaw/yousef/utilis/urilis.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({
    Key? key,
    required this.price,
    required this.name,
    required this.image,
    required this.details,
  }) : super(key: key);

  String name, image, price,details;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int nselected_index = 2;
  int quantity = 1;
  double? rate = 5.0;
  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Utils.backWidget(context),
        title: Text(
          widget.name ?? "",
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
            Container(
              margin: const EdgeInsets.only(left: 27, right: 27, top: 28).r,
              child: Column(
                children: [
                  Image.network(widget.image ?? ""),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.name ?? "",
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Text('${widget.price}EGP' ?? "",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: KColorPrimary)),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    widget.details ?? "",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 31).r,
                        child: Text(
                          'Quantity',
                          style:
                              TextStyle(fontSize: 18.sp, color: KColorPrimary),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15).r,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity -= 1;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.minimize,
                            color: KColorPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text('$quantity'),
                      SizedBox(
                        width: 15.h,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.add,
                          color: KColorPrimary,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            quantity += 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 58, top: 10).r,
                        child: Text(
                          'Color',
                          style:
                              TextStyle(fontSize: 18.sp, color: KColorPrimary),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10).r,
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset("assets/images/color_1.png")),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10).r,
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset("assets/images/color_2.png")),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10).r,
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset("assets/images/color_3.png")),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  )
                ],
              ),
            ),
            const SizedBox(
                width: double.infinity,
                child: Divider(
                  height: 35,
                  thickness: 1,
                  color: Color(0xffDEDEDE),
                )),
            Container(
              margin: const EdgeInsets.only(left: 27, right: 27).r,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Rating and reviews',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Text(
                        '$rate',
                        style: TextStyle(fontSize: 24.sp, color: KColorPrimary),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12).r,
                        child: Text(
                          '12 views',
                          style: TextStyle(
                              color: Color(0xff646362), fontSize: 17.sp),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(top: 10).r,
                        child: RatingBar.builder(
                          itemSize: 25,
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffFF8827),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rate = rating;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3).w,
                              border:
                                  Border.all(width: 1.5, color: KColorPrimary)),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: KColorPrimary,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: KColorPrimary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 80)),
                          onPressed: () {
                            Utils.openScreen(context, MyCart(
                              price: widget.price,
                            ));
                          },
                          child: Text(
                            'Buy Now',
                            style: TextStyle(fontSize: 15.sp),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
