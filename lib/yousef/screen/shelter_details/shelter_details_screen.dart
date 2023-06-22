import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/donate/donate_screen.dart';
import 'package:meaw/yousef/screen/shelter_pets/shelter_pets_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/button_widget.dart';

import '../../widgets/text_widget.dart';

class ShelterDetailsScreen extends StatefulWidget {
   ShelterDetailsScreen({Key? key,
   required this.name,
   required this.email,
   required this.phone,
   required this.address,
   required this.petsNumber,
   required this.open,
   required this.days,
   required this.image,

   }) : super(key: key);
   String name,email,phone,address,petsNumber,open,days,image ;

  @override
  State<ShelterDetailsScreen> createState() => _ShelterDetailsScreenState();
}

class _ShelterDetailsScreenState extends State<ShelterDetailsScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng center = const LatLng(31.1773198, 31.4860486);

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  Set<Marker> marker = {
    Marker(
      markerId: const MarkerId('1'),
      position: LatLng(31.1773198, 31.4860486),
    )
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 46.h,
              ),
              Row(
                children: [
                  Utils.backWidget(context),
                  const Spacer(),
                  TextWidget(
                    title: widget.name,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextWidget(
                    title: widget.petsNumber,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: mainColor,
                  ),
                  TextWidget(
                    title: " pets",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: mainColor,

                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset("assets/images/happy_friend.png"),
                  Image.network(widget.image,fit: BoxFit.cover,height: 200.h,width: 200.w,),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),

              /// details of the Shelter
              Row(
                children: [
                  Image.asset("assets/images/clock.png",height: 30.h,width: 30.w,),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextWidget(
                      title: widget.open,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset("assets/images/calender.png",height: 30.h,width: 30.w,),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextWidget(
                      title: widget.days,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset("assets/images/place.png",height: 30.h,width: 30.w,),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextWidget(
                      title: widget.address,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset("assets/images/tele.png",height: 30.h,width: 30.w,),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextWidget(
                      title: widget.phone,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset("assets/images/email.png",height: 30.h,width: 30.w,),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextWidget(
                      title: widget.email,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child:  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(31.1773198, 31.4860486), zoom: 10.0),
                    markers: marker,


                  )),
              SizedBox(
                height: 24.h,
              ),
              ButtonWidget(
                title: "Adopt",
                radius: 6,
                width: 46.w,
                onTap: () {
                  Utils.openScreen(context, const ShelterPetsScreen());
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              ButtonWidget(
                title: "Donate",
                radius: 6,
                width: 46.w,
                onTap: () {
                  Utils.openScreen(context, DonateScreen());
                },
              ),
              8.ph
            ],
          ),
        ),
      )),
    );
  }
}
