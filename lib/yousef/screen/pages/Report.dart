import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';

import '../../utilis/urilis.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final formKey = GlobalKey<FormState>();
  String? radioValue = '';
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final numberController3 = TextEditingController();
  final emailController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,


        elevation: 0,
        title: Text(
          'Report a Pet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        // leading: Container(
        //     margin: const EdgeInsets.only(top: 7).r,
        //     child: IconButton(
        //         onPressed: () {
        //           Utils.backWidget(context);
        //         },
        //         icon: const Icon(
        //           Icons.arrow_back,
        //         ))),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10).r,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 30, left: 15).r,
                  child: const Text(
                    'What type of pet do you want to report?',
                    style: TextStyle(color: Colors.black),
                  )),
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(KColorPrimary),
                    value: 'Dog',
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value! as String?;
                      });
                    },
                  ),
                  const Text('Dog'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(KColorPrimary),
                    value: 'Cat',
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value! as String?;
                      });
                    },
                  ),
                  const Text('Cat'),
                ],
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20, left: 15).r,
                child: const Text('City'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15).r,
                  child: TextFormField(validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                    controller: textController1,
                    decoration: const InputDecoration(
                        hintText: 'Mansoura',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary))),
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 34, left: 15).r,
                child: const Text('Address Details'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15).r,
                  child: TextFormField(validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                    controller: textController2,
                    decoration: const InputDecoration(
                        hintText: '25 street ',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary))),
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 34, left: 15).r,
                child: const Text('Phone Number'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15).r,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: numberController3,
                    decoration: const InputDecoration(
                        hintText: '01025498754',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary))),
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 34, left: 15).r,
                child: const Text('Email'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 80).r,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController4,
                    decoration: const InputDecoration(
                        hintText: 'mariam @gmail.com',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColorPrimary))),
                  )),
              Container(
                margin: EdgeInsets.only(left: 30, right: 36).r,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KColorPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      submitForm();
                    }
                  },
                  child:  Text(
                    'Send',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    final formData = {
      'radioValue': radioValue,
      'city': textController1.text,
      'address': textController2.text,
      'number': int.parse(numberController3.text),
      'email': emailController4.text,
    };
    try {
      await FirebaseFirestore.instance.collection('form_data').add(formData);
      _showSuccessMessage();
      formKey.currentState!.reset();
      textController1.clear();
      textController2.clear();
      numberController3.clear();
      emailController4.clear();
      setState(() {radioValue=null;});
    } catch (e) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form submission failed')));}
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 40).r,
                  child: Image.asset('assets/images/report_img.png')),
               Text(
                'Form has been sent',
                style: TextStyle(color: Colors.black, fontSize: 24.sp),
              ),
               Text(
                'successfully',
                style: TextStyle(color: KColorPrimary, fontSize: 24.sp),
              )
            ],
          ),
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
