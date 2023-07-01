import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/getPosts/getPosts.dart';
import 'package:meaw/petProfileList/petProfileListCubit/petComponent.dart';
class EditPost extends StatefulWidget {
  EditPost({required this.model}) : super();
  PostModel? model;
  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  var postImage;
  var formKey = GlobalKey<FormState>();
  var postName = TextEditingController();
  var postWeight = TextEditingController();
  var postCategory = TextEditingController();
  var postPrice = TextEditingController();
  var postGender = TextEditingController();
  var postAge = TextEditingController();
  var postHealth = TextEditingController();
  var postBehavior = TextEditingController();
  @override
  Widget build(BuildContext context) {
    postName.text=widget.model!.name!;
    postWeight.text=widget.model!.weight!;
    postCategory.text=widget.model!.category!;
    postPrice.text=widget.model!.price!;
    postBehavior.text=widget.model!.behavior!;
    postHealth.text=widget.model!.health!;
    postAge.text=widget.model!.age!;
    postGender.text=widget.model!.gender!;
    return BlocConsumer<GetCubit, GetStates>(
      listener: (context, state) {
        // if (state is CatUpdateSuccessState) {
        //   showToast(message: 'Cat updated', state: ToastStates.success);
        //   navigateAndFinish(context, ListScreen());
        // }
      },
      builder: (context, state) {
        var cubit = GetCubit.get(context);
        //catImage = CatCubit.get(context).catImage;
        postImage = widget.model!.image;
        var PostImage = cubit.postImage;
        //print('age is' + catYear.toString());
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 24.0, top: 40),
            child:
            ConditionalBuilder(
              condition: widget.model != null,
              builder: (BuildContext context) => Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      appBaar(
                          context: context,
                          screen: GetPosts(),
                          label: 'Edit Post',
                          width: 70.0),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: PostImage == null
                                ? NetworkImage('${postImage}')
                                : FileImage(PostImage) as ImageProvider,
                            // FileImage(catImage) as ImageProvider,
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
                                    onPressed: () {
                                      cubit.getPostImage();
                                    },
                                    icon: const Image(
                                      image:
                                      AssetImage('assets/images/Group-4.png'),
                                      height: 15,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (PostImage != null)
                        const SizedBox(
                          height: 20,
                        ),
                      if (PostImage != null)
                        ConditionalBuilder(
                          condition: state is! UpdateImageLoadingState,
                          builder: (BuildContext context) => defaultButton(
                            text: 'Update profile Image',
                            onPressed: () async {
                              await GetCubit.get(context).uploadPostImage(
                                 name: postName.text,
                                weight: postWeight.text,
                                category:postCategory.text ,
                                gender:postGender.text ,
                                age: postAge.text,
                                price:postPrice.text ,

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
                        height: 40,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Name',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Name is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Age',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postAge,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Age is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Price',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postPrice,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Price is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Category',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postCategory,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Category is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Behaviour',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postBehavior,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Behaviour is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Gender',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postGender,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Gender is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Weight',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postWeight,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Weight is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Pet Health',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      defaultTextFormField(
                          controller: postHealth,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pet Health is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.name,
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      //divider(),
                      const SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                        condition: state is! UpdateImageLoadingState,
                        builder: (BuildContext context) => defaultButton(
                            text: 'Save',
                            onPressed: () async {
                              await cubit.updatePost(
                              price: postPrice.text,
                                name: postName.text,
                                age: postAge.text,
                                gender: postGender.text,
                                category:postCategory.text,
                                weight: postWeight.text,
                                health: postHealth.text,
                                behavior: postBehavior.text,
                              );
                            }),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                 ,
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
            )

            ,
          ),
        );
      },
    );
  }
}
