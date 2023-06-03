// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:meaw/components/colors.dart';
// import 'package:meaw/components/components.dart';
// import 'package:meaw/getPosts/getCubit/getCubit.dart';
// import 'package:meaw/getPosts/getCubit/getStates.dart';
// import 'package:meaw/getPosts/getCubit/model.dart';
// import 'package:meaw/getPosts/getPosts.dart';
// import 'package:meaw/style/icon_broken.dart';
// class UpdatePost extends StatefulWidget {
//   UpdatePost({required this.name,required this.gender,required this.price,required this.weight ,required this.category,required this.age,required this.image,required this.id,required this.model}) : super();
// String? name;
// PostModel? model;
// String? gender;
// String? category;
// String? weight;
// String? price;
// String? age;
//   String? id;
//   String? image;
//   @override
//   State<UpdatePost> createState() => _UpdatePostState();
// }
//
// class _UpdatePostState extends State<UpdatePost> {
//   var nameController = TextEditingController();
//
//   var genderController = TextEditingController();
//
//   var categoryController = TextEditingController();
//
//   var priceController = TextEditingController();
//   var weightController = TextEditingController();
//   var ageController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
// @override
//   // void initState() {
//   //   // TODO: implement initState
//   // GetCubit.get(context).getMyData("X4kTXDpLdmd8Q4kwA4bg");
//   //   super.initState();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GetCubit, GetStates>(
//       listener: (context, state) {
//         if (state is GetSuccessState) {
//           showToast(message: 'Post Updated', state: ToastStates.success);
//         }
//       },
//       builder: (context, state) {
//         // if(GetCubit.get(context).postData == null)
//         // {
//         //   GetCubit.get(context).getMyData("X4kTXDpLdmd8Q4kwA4bg");
//         // }
//         var cubit = GetCubit.get(context);
//         var postImage = GetCubit.get(context).postImage;
//        var postModel=cubit.postData;
//         postModel==null?print("Null User data"):print("UserData: "+postModel.toMap().toString());
//
//         nameController.text = name;
//         // genderController.text = widget.gender!;
//         // categoryController.text = widget.category!;
//         // priceController.text = widget.price!;
//         // weightController.text = widget.weight!;
//         // ageController.text = widget.age!;
//         // var valueGender=userData.gender;
//         return Scaffold(
//           // appBar: AppBar(
//           //   centerTitle: true,
//           //   title: const Text('Update Profile',
//           //     style: TextStyle(
//           //       fontSize: 22,
//           //       color: Colors.black,
//           //       fontFamily: 'Jannah',
//           //     ),
//           //   ),
//           //   backgroundColor: Colors.white,
//           //   leading: IconButton(
//           //     onPressed: (){Navigator.pop(context);},
//           //     icon: const Icon(IconBroken.Arrow___Left_2,color: defaultColor,),
//           //   ),
//           // ),
//           body:
//           Form(
//             key: formKey,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             navigateTo(context, GetPosts());
//                           },
//                           child: Image(
//                               image: AssetImage('assets/images/arrowleft.png')),
//                         ),
//                         SizedBox(
//                           width: 80,
//                         ),
//                         Text(
//                           'My Post',
//                           style: GoogleFonts.roboto(
//                               fontSize: 26,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 60,
//                           backgroundImage: postImage == null
//                               ? NetworkImage('${widget.image}')
//                               : FileImage(postImage) as ImageProvider,
//                         ),
//                         Positioned(
//                             bottom: 0,
//                             left: MediaQuery.of(context).size.width * 0.24,
//                             child: CircleAvatar(
//                               radius: 19,
//                               backgroundColor: Colors.white,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 22,
//                                 child: IconButton(
//                                   onPressed: () {
//                                     cubit.getPostImage();
//                                   },
//                                   icon: Image(
//                                     image: AssetImage('assets/images/Group-4.png'),
//                                     height: 15,
//                                   ),
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                     if (postImage != null)
//                       const SizedBox(
//                         height: 20,
//                       ),
//                     if (postImage != null)
//                       ConditionalBuilder(
//                         condition: state is! UpdateImageLoadingState,
//                         builder: (BuildContext context) => defaultButton(
//                           text: 'Update post Image',
//                           onPressed: () {
//                             GetCubit.get(context).uploadPostImage(
//                                 name: nameController.text,
//                                 age: ageController.text,
//                                 price: priceController.text,
//                                 gender:genderController.text,
//                                 category: categoryController.text,
//                                 weight: weightController.text
//                             );
//                           },
//                         ),
//                         fallback: (BuildContext context) => const Center(
//                           child: CircularProgressIndicator(
//                             color: defaultColor,
//                           ),
//                         ),
//                       ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: [
//                         Text('Name',
//                             style: GoogleFonts.roboto(
//                                 fontSize: 18,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400)),
//                       ],
//                     ),
//                     TextFormField(
//                       controller: nameController,
//
//                     ),
//                     // defaultTextFormField(
//                     //     controller: nameController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Name is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.name,
//                     //     context: context),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     // Row(
//                     //   children: [
//                     //     Text('Price',
//                     //         style: GoogleFonts.roboto(
//                     //             fontSize: 18,
//                     //             color: Colors.black,
//                     //             fontWeight: FontWeight.w400)),
//                     //   ],
//                     // ),
//                     // defaultTextFormField(
//                     //     controller: priceController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Price is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.number,
//                     //     prefix: IconBroken.Call,
//                     //     context: context),
//                     // const SizedBox(
//                     //   height: 18,
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     Text('Age',
//                     //         style: GoogleFonts.roboto(
//                     //             fontSize: 18,
//                     //             color: Colors.black,
//                     //             fontWeight: FontWeight.w400)),
//                     //   ],
//                     // ),
//                     // defaultTextFormField(
//                     //     controller: ageController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Age is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.number,
//                     //     prefix: IconBroken.Call,
//                     //     context: context),
//                     // const SizedBox(
//                     //   height: 18,
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     Text('Weight',
//                     //         style: GoogleFonts.roboto(
//                     //             fontSize: 18,
//                     //             color: Colors.black,
//                     //             fontWeight: FontWeight.w400)),
//                     //   ],
//                     // ),
//                     // defaultTextFormField(
//                     //     controller: weightController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Weight is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.number,
//                     //     prefix: IconBroken.Call,
//                     //     context: context),
//                     // const SizedBox(
//                     //   height: 18,
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     Text('Category',
//                     //         style: GoogleFonts.roboto(
//                     //             fontSize: 18,
//                     //             color: Colors.black,
//                     //             fontWeight: FontWeight.w400)),
//                     //   ],
//                     // ),
//                     // defaultTextFormField(
//                     //     controller: categoryController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Category is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.number,
//                     //     prefix: IconBroken.Call,
//                     //     context: context),
//                     // const SizedBox(
//                     //   height: 18,
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     Text('Gender',
//                     //         style: GoogleFonts.roboto(
//                     //             fontSize: 18,
//                     //             color: Colors.black,
//                     //             fontWeight: FontWeight.w400)),
//                     //   ],
//                     // ),
//                     // defaultTextFormField(
//                     //     controller: genderController,
//                     //     validator: (value) {
//                     //       if (value!.isEmpty) {
//                     //         return 'Gender is Empty';
//                     //       }
//                     //       return null;
//                     //     },
//                     //     inputType: TextInputType.number,
//                     //     prefix: IconBroken.Call,
//                     //     context: context),
//                     // const SizedBox(
//                     //   height: 15,
//                     // ),
//                     ConditionalBuilder(
//                       condition: state is! PostUpdateLoadingState,
//                       builder: (BuildContext context) => defaultButton(
//                           text: 'Update', onPressed: () => cubit.updatePost(
//                         name: nameController.text,
//                         age: ageController.text,
//                         price:priceController.text,
//                         gender:genderController.text,
//                         weight:weightController.text,
//                         category:categoryController.text,
//                         idpost:widget.id.toString(),
//                       )),
//                       fallback: (BuildContext context) => const Center(
//                         child: CircularProgressIndicator(
//                           color: defaultColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         );
//       },
//     );
//
//   }
//
//   void handleUpdate(var cubit,String? idPost ) {
//     cubit.updatePost(
//         name: nameController.text,
//         age: ageController.text,
//         price:priceController.text,
//         gender:genderController.text,
//       widget:weightController.text,
//       category:categoryController,
//       idPost:idPost,
//     );
//   }
// }
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
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
                      // appBaar(
                      //     context: context,
                      //     screen: ListScreen(),
                      //     label: 'Edit Profile',
                      //     width: 65.0),
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
