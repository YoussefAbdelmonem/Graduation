import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/constants.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Save data to Firebase
      try {
        await Firebase.initializeApp();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection('myCollection').add({
          'field1': _textFieldController1.text,
          'field2': _textFieldController2.text,
          'field3': _textFieldController3.text,
        });
        // Display success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Form submitted successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }

      catch (e) {
        // Display error message if saving to Firebase fails
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to submit the form.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Help',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Form(key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/onBoard1.png'),
                Text_Field(controller: _textFieldController1,validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                  hint: 'User name',
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text_Field(hint: 'Email',controller:_textFieldController2,type: TextInputType.emailAddress,validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },),
                SizedBox(
                  height: 10.h,
                ),
                Text_Field(validator:(value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comment';
                  }
                  return null;
                } ,hint: 'Comment',controller: _textFieldController3,),
                SizedBox(
                  height: 80.h,
                ),
                Container(width: 350.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KColorPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    onPressed:_submitForm,
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
                SizedBox(height:20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

class Text_Field extends StatelessWidget {
  TextInputType type;
 final String hint;
  String? Function(String?)? validator;
 final TextEditingController controller;
  Text_Field({required this.hint, required this.controller,this.type=TextInputType.text,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,keyboardType: type,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: KColorPrimary)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: KColorPrimary)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: KColorPrimary))),
      validator: validator
    );

  }

}
