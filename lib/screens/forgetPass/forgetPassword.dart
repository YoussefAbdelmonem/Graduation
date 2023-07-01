
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/style/icon_broken.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);

   var emailController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatCubit,CatStates>(
      listener: (context,state){
        if(state is CatForgetPasswordSuccessState)
          {
            showToast(
              message: 'Link Sent',
              state: ToastStates.success
            );
            navigateAndFinish(context, LoginScreen());
          }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Forget Password',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: 'Jannah',
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: const Icon(IconBroken.Arrow___Left_2,color: defaultColor,),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      label: 'Email Address',
                      prefix: IconBroken.Message,
                      context: context
                  ),
                  const SizedBox(height: 20,),
                  ConditionalBuilder(
                    condition: state is! CatForgetPasswordLoadingState,
                    builder: (BuildContext context)=>defaultButton(
                      text: 'Send Link',
                      onPressed: (){
                        CatCubit.get(context).forgetPassword(email: emailController.text);
                      }
                    ),
                    fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(color: defaultColor,),),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
