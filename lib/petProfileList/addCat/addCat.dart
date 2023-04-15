
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/petProfileList/petProfileListCubit/cubit.dart';
import 'package:meaw/petProfileList/petProfileListCubit/petComponent.dart';
import 'package:meaw/petProfileList/petProfileListCubit/states.dart';

class AddCatScreen extends StatefulWidget {
   const AddCatScreen({Key? key}) : super(key: key);

  @override
  State<AddCatScreen> createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
   var catName = TextEditingController();
   var formKey = GlobalKey<FormState>();
   

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetProfileListCubit,PetProfileListStates>(
      listener: (context,state){
        if(state is PetAddCatSuccessState)
          {
            showToast(
              message: 'Cat added',
              state: ToastStates.success
            );
            catName.clear();
            PetProfileListCubit.get(context).catYear = 0 ;
            navigateAndFinish(context, ListScreen());
          }
      },
      builder: (context,state){
        var cubit = PetProfileListCubit.get(context);
        var catImage = PetProfileListCubit.get(context).catImage;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 24.0,right: 24.0,bottom: 24.0,top: 40),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    appBaar(
                        context: context,
                        screen: ListScreen(),
                        label: 'Add Profile',
                        width: 65.0
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: catImage == null ? const NetworkImage('https://i.pinimg.com/564x/1a/df/38/1adf38fdc4ee9f2895be7f340e772767.jpg'):FileImage(catImage) as ImageProvider,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: ()async{
                                  await cubit.getCatImage();
                                },
                                  icon: const Image(
                                    image:
                                    AssetImage('assets/images/Group-4.png'),
                                    height: 15,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Cat\'s Name',
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    defaultTextFormField(
                        controller: catName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is Empty';
                          }
                          return null;
                        },
                        inputType: TextInputType.name,
                        context: context),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 3.0),
                                 child: Text('Cat\'s Age',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                              ),
                               ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text('${cubit.catYear}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child:petAge(
                            context:context,
                          ) ,
                        ),
                      ],
                    ),
                  //  const SizedBox(height: 10,),
                    divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text('Gender',
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0,),
                      child: petGender(context: context),
                    ),
                    divider(),
                    const SizedBox(height: 50,),
                    ConditionalBuilder(
                      condition: state is! PetAddCatLoadingState,
                      builder: (BuildContext context)=> defaultButton(
                        text: 'Save',
                        onPressed: (){
                          if(formKey.currentState!.validate() && catImage != null){
                            cubit.uploadCatImage(
                              catName: catName.text,
                              year: cubit.catYear.toString(),
                              gender: cubit.catGender.toString()
                            );
                          }
                          if(catImage == null) {
                            showToast(
                                message: 'Choose Cat Image First',
                                state: ToastStates.error
                            );
                          }
                        }
                      ),
                      fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(color: defaultColor,),)
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
}
