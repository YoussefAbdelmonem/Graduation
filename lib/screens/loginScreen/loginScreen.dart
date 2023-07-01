
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/screens/forgetPass/forgetPassword.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/registerScreen/registerScreen.dart';
import 'package:meaw/style/icon_broken.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatCubit,CatStates>(
      listener: (context,state){
        if(state is CatSignInSuccessState)
        {
         // CacheHelper.saveData(key: 'userType',);
          //CacheHelper.saveData(key:'userTypee', value: value)
          CacheHelper.saveData(
              key: 'uId',
              value: state.uId
          ).then((value){
            showToast(
                message: 'Sign In Success',
                state: ToastStates.success
            );
            navigateAndFinish(context,  HomeScreen());
          }
          );
        }
        else if(state is CatSignInErrorState)
        {
          showToast(
              message: 'Sign In Error',
              state: ToastStates.error
          );
        }
        else if(state is CatLoginFaceSuccessState){
         // CacheHelper.saveData(key:'userTypee', value: value)
          CacheHelper.saveData(
              key: 'uId',
              value: state.uId
          ).then((value){
            showToast(
                message: 'Sign In Success',
                state: ToastStates.success
            );
            navigateAndFinish(context,  HomeScreen());
            });
          }
        else if(state is CatLoginGoogleSuccessState){
         // CacheHelper.saveData(key:'userTypee', value: value)
          CacheHelper.saveData(
              key: 'uId',
              value: state.uGoogleId
          ).then((value){
            showToast(
                message: 'Sign In Success',
                state: ToastStates.success
            );
            navigateAndFinish(context,  HomeScreen());
          });
        }
      },
      builder: (context,state){
        var cubit = CatCubit.get(context);
            return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset('assets/images/cat.png',),
                      Text('Welcome Back',
                        style:GoogleFonts.roboto(
                            fontSize: 28,
                            color:Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Text('Email',style:GoogleFonts.roboto(
                              fontSize: 18,
                              color:Colors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      defaultTextFormField(
                          controller: emailController,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Email is Empty!';
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                         // label: 'Email ',
                          hint: 'Enter your email',
                //           if(cubit.ischecked){
                //      initval:CacheHelper.getData(key: 'email'),
                // }
                          context: context
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('Password',style:GoogleFonts.roboto(
                              fontSize: 18,
                              color:Colors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      defaultTextFormField(
                        hint: 'Enter your password',
                          controller: passController,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Password is Empty!';
                            }
                            return null;
                          },
                        //  initval: cubit.ischecked?CacheHelper.getData(key: 'password'):'',
                          inputType: TextInputType.visiblePassword,
                          prefix: IconBroken.Lock,
                          suffix: cubit.signInPasswordIcon,
                          isPassword: cubit.signInPassword,
                          onSuffixPressed: (){
                            cubit.changeSignInVisibilityPassword();
                          },
                          context: context
                      ),

                      const SizedBox(height: 30,),
                      ConditionalBuilder(
                        condition: state is! CatSignInLoadingState,
                        builder: (BuildContext context)=>defaultButton(
                            text:'Login',
                            onPressed: ()=> handleLogin(cubit),
                        ),
                        fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(color: defaultColor,),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          defaultTextButtonBlack(
                              function: (){
                                navigateTo(context, ForgetPasswordScreen());
                              },
                              text: 'Forget Password?'
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('Don\'t have an account ? ',
                            style:GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          defaultTextButtonUnderlined(
                              function: (){navigateAndFinish(context, RegisterScreen());},
                              text: 'Regsiter'
                          ),
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
                          const SizedBox(width: 10,),
                          const Text('Or Login with',
                            style: TextStyle(
                                fontSize: 17
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                 CatCubit.get(context).signInWithGoogle();
                               //  cubit.getMyData();
                              },
                              child: Image.asset('assets/images/google.png',width: 50,)),
                          const SizedBox(width: 50,),
                          ConditionalBuilder(
                            condition: state is! CatLoginFaceLoadingState ,
                            builder: (BuildContext context)=>GestureDetector(
                                onTap: (){
                                  cubit.login();
                                  cubit.getMyData();

                                },
                                child: Image.asset('assets/images/facebook.png',width: 50,)),
                            fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(color: defaultColor,),),
                          ),
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

   void handleLogin(var cubit)async{
    print("Logging in");
   if(formKey.currentState!.validate())
   {
   if(CacheHelper.getData(key: 'email') !=null){
   cubit.userLogin(email: CacheHelper.getData(key: 'email'), password:CacheHelper.getData(key: 'password'));
   await cubit.getMyData();
   }else {
     print("entered else");
    await cubit.userLogin(email: emailController.text,
        password: passController.text);
   cubit.rememberMe(
       emailController.text, passController.text,
       cubit.ischecked1);
    uId = FirebaseAuth.instance.currentUser!.uid;
    CacheHelper.saveData(key: "uId", value: uId);
    await cubit.getMyData();
   }
   }
   }

}
