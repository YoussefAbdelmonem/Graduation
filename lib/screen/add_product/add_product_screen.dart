import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/widgets/button_widget.dart';
import 'package:meaw/core/widgets/snak.dart';
import 'package:meaw/core/widgets/text_form_field.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/data/models/userModel.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/core/constant/colors.dart';
import 'package:meaw/data/models/add_shelter.dart';
import 'package:meaw/utilis/urilis.dart';
import 'package:meaw/utilis/validations.dart';

import '../../../screens/homeScreen/HomeScreen.dart';
import '../../data/models/add_product.dart';


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
      phone = TextEditingController(),
      behaviour = TextEditingController(),
      category = TextEditingController();
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
      appBar:  AppBar(
        leading: InkWell(
            onTap: (){
              if (reverse==true) {
                navigateTo(context, (HomeScreen()));
              }
              audio=0;
              reverse=false;
            },
            child:reverse==true?
            Icon(Icons.arrow_back,size: 30,color: defaultColor,)
                :Icon(Icons.arrow_back,size: 26,color: Colors.transparent,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
            child: GestureDetector(
              onTap: ()async{
                await CatCubit().getDataaaaa();
                navigateTo(context, const ProfileScreen());

                //navigateTo(context, const ProfileScreen());
              },
              child:Container(
                height: 80,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:CatCubit.get(context).userData==null?NetworkImage('https://i.pinimg.com/564x/a1/d8/62/a1d862711ba51f2a19c6c0c4a891eb42.jpg'): NetworkImage('${CatCubit.get(context).userData?.profileImage}')
                    )
                ),
                // child:CatCubit.get(context).userData==null?
                // CircleAvatar(backgroundImage:AssetImage('assets/images/profile.jpg',),
                //   radius: 50,
                // ):
                // CircleAvatar(
                //     radius: 50,
                //     backgroundImage:NetworkImage( '${CatCubit.get(context).userData?.profileImage}')),
              ),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundImage: NetworkImage('${CatCubit.get(context).userData?.profileImage}'),
              // ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                navigateTo(context, ProfileScreen());
                              },
                              child: const Image(
                                  image: AssetImage('assets/images/arrowleft.png')),
                            ),
                          ],
                        ),
                        16.ph,
                        AddProductTextField(
                          label: 'Pet Name',
                          keyboardType: TextInputType.name,
                          validate: Validation().defaultValidation,
                          controller: name,
                        ),
                        AddProductTextField(
                          label: 'Price',
                          keyboardType: TextInputType.number,
                          validate: Validation().defaultValidation,
                          controller: price,
                        ),
                        AddProductTextField(
                          label: 'Age',

                          keyboardType: TextInputType.number,
                          validate: Validation().defaultValidation,
                          controller: age,
                        ),
                        AddProductTextField(
                          label: 'Gender',
                          keyboardType: TextInputType.name,
                          validate: Validation().defaultValidation,
                          controller: gender,
                        ),
                        AddProductTextField(
                          label: 'Health',
                          //هو الصحه هيدخل اي ؟
                          keyboardType: TextInputType.text,
                          validate: Validation().defaultValidation,
                          controller: health,
                        ),
                        AddProductTextField(
                          // textDirection: TextDirection.rtl,
                          label: 'Weight',
                          keyboardType: TextInputType.text,
                          validate: Validation().defaultValidation,
                          controller: weight,
                        ),
                        AddProductTextField(
                          // textDirection: TextDirection.rtl,
                          label: 'Category',
                          keyboardType: TextInputType.text,
                          validate: Validation().defaultValidation,
                          controller: category,
                        ),
                        AddProductTextField(
                          // textDirection: TextDirection.rtl,
                          label: 'Behaviour',
                          keyboardType: TextInputType.text,
                          validate: Validation().defaultValidation,
                          controller: behaviour,
                        ),

                        //// اللي بعدة
                        // مهي موجودة
                        /// مهي موجودة في الل label
                        ///

                        const SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          onTap: () async {
                            if (_formKey.currentState!.validate() ||
                                pickedImage != null) {
                              if (pickedImage == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snac(' Please Choose an image'));
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

                            
                            AddPet addPet =    AddPet(
                                  name: name.text,
                                  price: price.text,
                                  age: age.text,
                                  gender: gender.text,
                                  health: health.text,
                                  weight: weight.text,
                                  image: image,
                              behavior:behaviour.text ,
                              shelterid: uId,
                              category: category.text
                                );
                                UserModel user ;
                                ///
                                await firestoreInstance
                                    .collection("posts")
                                .doc(uId)
                                .collection("posts")

                                ///TODO .id and then pass the user id to  add product
                                    .add(addPet.toMap()).then((value) {
                                      Overlay.of(context)?.widget.clipBehavior.name;
                                      Utils.openScreen(context, HomeScreen());
                                      // ScaffoldMessenger.of(context).widget.child.
                                });
                                name.clear();
                                price.clear();
                                phone.clear();
                                weight.clear();
                                behaviour.clear();
                                age.clear();
                                health.clear();
                                gender.clear();
                                category.clear();

                                /// كدا تمام

                                image = null;
                                pickedImage = pickedImage;
                              }
                            }
                          },
                          title: "ADD PET",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
