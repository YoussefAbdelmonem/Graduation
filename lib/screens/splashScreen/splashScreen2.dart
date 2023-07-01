import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/screens/onBoarding/onBoarding.dart';
import 'package:meaw/screens/splashScreen/splashScreen3.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen3())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width:150,
                height: 100,
                child: Image.asset('assets/images/Group 195 (3).png',
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
