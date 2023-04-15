


import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/screens/onBoarding/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  late Widget home;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  Widget nextScreen()
  {
    if (onBoarding != null) {
      if (uId != null) {
        home =   HomeScreen();
      } else {
        home = LoginScreen();
      }
    } else {
      home = const OnBoardingScreen();
    }
    return home;
  }
  @override
  void initState() {
    super.initState();
    Timer(

        const Duration(seconds:2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => nextScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
              SizedBox(
                width:150,
                height: 100,
                child:Pulse(child:Image.asset('assets/images/Group 195 (3).png',
                  fit: BoxFit.cover, )


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
