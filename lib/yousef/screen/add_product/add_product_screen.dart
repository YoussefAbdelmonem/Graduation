import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meaw/model.dart';
import 'package:meaw/models/userModel.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/data/models/add_shelter.dart';
import 'package:meaw/yousef/utilis/validations.dart';
import 'package:meaw/yousef/widgets/text_form_field.dart';

import '../../data/models/add_product.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/snak.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController(),
      price = TextEditingController(),
  ///////
      age = TextEditingController(),
      gender = TextEditingController(),
      health = TextEditingController(),
      weight = TextEditingController(),
      phone = TextEditingController();
  String? image;
  File? pickedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.photo),
        onPressed: () async {
          final ImagePicker _picker =
          ImagePicker(); // اوبجكت من كلاس اسمه imagepicker
          final XFile? image = await _picker.pickImage(
              source: ImageSource.gallery);
          pickedImage = File(image!.path);

          print(pickedImage);
        },
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                  child: Column(
                    children: [
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'اسم المنتج',
                        keyboardType: TextInputType.name,
                        validate: Validation().defaultValidation,
                        controller: name,
                      ),
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'السعر',
                        keyboardType: TextInputType.number,
                        validate: Validation().defaultValidation,
                        controller: price,
                      ),
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'العمر',
                        keyboardType: TextInputType.number,
                        validate: Validation().defaultValidation,
                        controller: age,
                      ),
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'النوع',
                        keyboardType: TextInputType.number,
                        validate: Validation().defaultValidation,
                        controller: gender,
                      ),
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'الصحه',
                        keyboardType: TextInputType.number,
                        validate: Validation().defaultValidation,
                        controller: health,
                      ),
                      AddProductTextField(
                        textDirection: TextDirection.rtl,
                        label: 'الوزن',
                        keyboardType: TextInputType.number,
                        validate: Validation().defaultValidation,
                        controller: weight,
                      ),


                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        onTap: () async {
                          if (_formKey.currentState!.validate() ||
                              pickedImage != null) {
                            if (pickedImage == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snac('يرجي اختيار صوره'));
                            } else {
                              // user = sharedPref.getToken();
                              String imageName = DateTime.now().toString();

                              try {
                                await FirebaseStorage.instance
                                    .ref(imageName)
                                    .putFile(pickedImage!);
                                image = await FirebaseStorage.instance
                                    .ref(imageName)
                                    .getDownloadURL();
                                print(image);
                              } on FirebaseException catch (e) {
                                //
                                // e.g, e.code == 'canceled'
                              }

                              // AddProductModel productModel =
                              // AddProductModel(
                              //   name: name.text,
                              //   price: price.text,
                              //   cart: false,
                              //   favorite: false,
                              //   image: image,
                              // );
                          AddPet addPet =    AddPet(
                                name: name.text,
                                price: price.text,
                                age: age.text,
                                gender: gender.text,
                                health: health.text,
                                weight: weight.text,
                                image: image,

                              );
                              UserModel user ;
                              ///
                              await firestoreInstance
                                  .collection("category")
                              .doc("accessories")
                              .collection("accessories")

                              ///TODO .id and then pass the user id to  add product
                                  .add(addPet.toMap());


                              name.clear();
                              price.clear();
                              phone.clear();
                              weight.clear();

                              image = null;
                              pickedImage = pickedImage;
                            }
                          }
                        },
                        title: "ADD PRODUCT",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
