import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/screens/onBoarding/onBoarding.dart';
import 'package:meaw/screens/splashScreen/splashScreen.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {



  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen())));
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
                child: Image.asset('assets/images/Group 195 (2).png',
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
