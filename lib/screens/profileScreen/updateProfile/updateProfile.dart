import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/style/icon_broken.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var GenderController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String selectedGender="Female";
  List<String> gendersList=["Female","Male"];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatCubit, CatStates>(
      listener: (context, state) {
        if (state is CatGetUserSuccessState) {
          showToast(message: 'User Updated', state: ToastStates.success);
        }
      },
      builder: (context, state) {
        var userData = CatCubit.get(context).userData;
        var cubit = CatCubit.get(context);
        var profileImage = CatCubit.get(context).profileImage;

        userData==null?print("Null User data"):print("UserData: "+userData.toMap().toString());

        nameController.text = userData!.name!;
        phoneController.text = userData.phone!;
        emailController.text = userData.email!;
        // var valueGender=userData.gender;
        final items = ['Male', 'Female'];
        return Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: const Text('Update Profile',
          //     style: TextStyle(
          //       fontSize: 22,
          //       color: Colors.black,
          //       fontFamily: 'Jannah',
          //     ),
          //   ),
          //   backgroundColor: Colors.white,
          //   leading: IconButton(
          //     onPressed: (){Navigator.pop(context);},
          //     icon: const Icon(IconBroken.Arrow___Left_2,color: defaultColor,),
          //   ),
          // ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(context, const ProfileScreen());
                          },
                          child: const Image(
                              image: AssetImage('assets/images/arrowleft.png')),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          'My Profile',
                          style: GoogleFonts.roboto(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: profileImage == null
                              ? NetworkImage('${userData.profileImage}')
                              : FileImage(profileImage) as ImageProvider,
                        ),
                        Positioned(
                            bottom: 0,
                            left: MediaQuery.of(context).size.width * 0.20,
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 22,
                                child: IconButton(
                                  onPressed: () {
                                    cubit.getProfileImage();
                                  },
                                  icon: const Image(
                                    image: AssetImage('assets/images/Group-4.png'),
                                    height: 15,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    if (profileImage != null)
                      const SizedBox(
                        height: 20,
                      ),
                    if (profileImage != null)
                      ConditionalBuilder(
                        condition: state is! CatUpdateImagesLoadingState,
                        builder: (BuildContext context) => defaultButton(
                          text: 'Update profile Image',
                          onPressed: () {
                            CatCubit.get(context).uploadProfileImage(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              gender:cubit.userData!.gender.toString()==null?'Male': cubit.userData!.gender.toString()
                            );
                          },
                        ),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Your information',
                          style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('Username',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    defaultTextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is Empty';
                          }
                          return null;
                        },
                        inputType: TextInputType.name,
                        context: context),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text('Phone',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    defaultTextFormField(
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone Number is Empty';
                          }
                          return null;
                        },
                        inputType: TextInputType.phone,
                        prefix: IconBroken.Call,
                        context: context),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text('Email',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    defaultTextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is Empty';
                          }
                          return null;
                        },
                        inputType: TextInputType.emailAddress,
                        prefix: IconBroken.Call,
                        context: context),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text('Gender',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    // TextFormField(
                    //
                    //   controller: GenderController,
                    //   keyboardType: TextInputType.text,
                    //   onTap: (){},
                    //   //onFieldSubmitted:(){},
                    //   style: Theme.of(context).textTheme.bodyText1,
                    //   decoration: InputDecoration(
                    //     helperStyle:  GoogleFonts.roboto(
                    //         fontSize: 12,
                    //         color:Color.fromRGBO(231, 229, 229, 1),
                    //         fontWeight: FontWeight.w400
                    //     ),
                    //     //suffixIcon: IconButton(icon: Icon(suffix), onPressed: onSuffixPressed,color: Color.fromRGBO(231, 229, 229, 1),),
                    //     // border: OutlineInputBorder(
                    //     //   borderRadius: BorderRadius.circular(10),
                    //     //   borderSide: const BorderSide(color: defaultColor),
                    //     // ),
                    //     border: UnderlineInputBorder(
                    //       borderSide: const BorderSide(color: defaultColor,width: 2,),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: const BorderSide(color: defaultColor,width: 3),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: const BorderSide(color: defaultColor),
                    //     ),
                    //   ),
                    //   autofocus: true,
                    //   enabled: true,
                    //   validator:(value){
                    //     if(value!.isEmpty)
                    //     {
                    //       return 'Email is Empty';
                    //     }
                    //     return null;
                    //   },
                    // ),

                    //  defaultTextFormField(
                    //      controller: phoneController,
                    //      validator: (value){
                    //        if(value!.isEmpty)
                    //        {
                    //          return 'Phone Number is Empty';
                    //        }
                    //        return null;
                    //      },
                    //      inputType: TextInputType.phone,
                    //      prefix: IconBroken.Call,
                    //      context: context
                    // ),

                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: DropdownButton<String>(
                        focusColor: Colors.transparent,
                          isExpanded: true,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                               color: Colors.grey,
                               backgroundColor: Colors.transparent,
                               //Color.fromRGBO(222, 220, 220, 1),
                              fontWeight: FontWeight.w400),
                          value:selectedGender,
                          items: [

                            DropdownMenuItem(child: Text(gendersList[0],),value:"Female"),
                            DropdownMenuItem(child: Text(gendersList[1]),value:"Male")

                          ],
                          onChanged: (value) {
                           setState(() {

                             selectedGender=value.toString();

                             print("Selected Gender: "+selectedGender);

                           });
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: state is! CatUpdateUserLoadingState,
                      builder: (BuildContext context) => defaultButton(
                          text: 'Update', onPressed: () => handleUpdate(cubit,cubit.userData!.gender)),
                      fallback: (BuildContext context) => const Center(
                        child: CircularProgressIndicator(
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
  void handleUpdate(var cubit,var gender) {
    cubit.updateUser(
      name: nameController.text,
      phone: phoneController.text,
      email:emailController.text,
      gender:selectedGender
    );
  }
}
