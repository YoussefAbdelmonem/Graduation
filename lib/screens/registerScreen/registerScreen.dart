import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/style/icon_broken.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var phoneController = TextEditingController();

  var confirmPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var selectedUserType = 3;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatCubit, CatStates>(
      listener: (context, state) {
        if (state is CatCreateUserSuccessState) {
          showToast(
              message: 'Info Enrolled Success', state: ToastStates.success);
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, state) {
        var cubit = CatCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create New \n Account ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Jannah', fontSize: 25, height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                          controller: userController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User is Empty!';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          label: 'User Name',
                          prefix: IconBroken.User,
                          context: context),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is Empty!';
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: IconBroken.Message,
                          context: context),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone is Empty!';
                            }
                            return null;
                          },
                          inputType: TextInputType.phone,
                          label: 'Phone Number',
                          prefix: IconBroken.Call,
                          context: context),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                          controller: passController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Empty!';
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: IconBroken.Lock,
                          suffix: cubit.signUpPasswordIcon,
                          isPassword: cubit.signUpPassword,
                          onSuffixPressed: () {
                            cubit.changeSignUpVisibilityPassword();
                          },
                          context: context),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                          controller: confirmPassController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Empty!';
                            } else if (value != passController.text) {
                              return 'Password don\'t match';
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword,
                          label: 'Confirm Password',
                          prefix: IconBroken.Lock,
                          suffix: cubit.signUpPasswordIcon,
                          isPassword: cubit.signUpPassword,
                          onSuffixPressed: () {
                            cubit.changeSignUpVisibilityPassword();
                          },
                          context: context),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "What Type Of A User R U ?",
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: selectedUserType,
                                onChanged: (val) {
                                  setState(() {
                                    selectedUserType = val as int;
                                  });
                                },
                              ),
                              const Text(
                                'Shelter',
                              ),
                            ],
                          ),
                          Row(
                            children: [],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: selectedUserType,
                                onChanged: (val) {
                                  print("Value: " + val.toString());
                                  setState(() {
                                    selectedUserType = val as int;
                                  });
                                },
                              ),
                              Text(
                                'Normal User',
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ConditionalBuilder(
                        condition: state is! CatSignUpLoadingState,
                        builder: (BuildContext context) => defaultButton(
                            text: 'Register',
                            onPressed: () => handleRegister(cubit)),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account ? ',
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Jannah'),
                          ),
                          defaultTextButton(
                              function: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              text: 'Login'),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              color: defaultColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Or Login with',
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/google.png',
                                width: 50,
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 50,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> handleRegister(CatCubit cubit) async {
    print("UserType: " + selectedUserType.toString());

    if (formKey.currentState!.validate()) {
      cubit.userSignUp(
          name: userController.text,
          email: emailController.text,
          password: passController.text,
          phone: '+2${phoneController.text}',
          gender: cubit.userData == null ? 'Male' : cubit.userData!.gender,
          userType: selectedUserType);
    }
  }
}
