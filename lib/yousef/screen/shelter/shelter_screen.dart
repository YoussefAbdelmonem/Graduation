import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/style/icon_broken.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/donate/donate_screen.dart';
import 'package:meaw/yousef/screen/shelter/filterWidget.dart';
import 'package:meaw/yousef/screen/shelter_details/shelter_details_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../../../components/constants.dart';

enum ShelterData {
  nearbyPets,
  shelter,
}

class ShelterScreen extends StatefulWidget {
  ShelterScreen({Key? key}) : super(key: key);

  @override
  State<ShelterScreen> createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  List<String> petList = [];

  List<String> petListgender = [];

  List<String> petListage = [];

  List<String> petListweight = [];

  List<String> petListfinal = [];

  List<PostModel> petModelResult = [];

  List<PostModel> petModelResultfinalUnique = [];

  List<PostModel> petModelResultgender = [];

  List<PostModel> petModelResultage = [];

  List<PostModel> petModelResultweight = [];

  var controller = ScrollController();

  // var gender="";
  var searchController = TextEditingController();

  ShelterData isShelter = ShelterData.shelter;

  ShelterData isNearbyPet = ShelterData.nearbyPets;

  String shelters = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // GetCubit.get(context).getUsersIDs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCubit, GetStates>(
      listener: (context, state) {},
      builder: (context, state) {
        GetCubit cubit= BlocProvider.of(context);
        return Scaffold(
          body: StreamBuilder<QuerySnapshot>(
              stream: GetCubit.get(context).getPostsTest(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot d = snapshot.data!;
                  List<DocumentSnapshot> usersList = [];
                  for (var i = 0; i < d.docs.length; i++) {
                    usersList.add(d.docs[i]);
                    print("ID: " + d.docs[i].id.toString());
                  }

                  List<Map<String, dynamic>> postsList = [];
                  for (var i = 0; i < usersList.length; i++) {
                    Future<QuerySnapshot<Map<String, dynamic>>> snapshotssssss =
                        FirebaseFirestore.instance
                            .collection("posts")
                            .doc(usersList[i].id.toString())
                            .collection("posts")
                            .get();
                    snapshotssssss.then((value) {
                      QuerySnapshot<Map<String, dynamic>> sss = value;
                      var postsListAsJsonDocumentSnapshot = sss.docs;
                      print("PostsSnapshot: "+postsListAsJsonDocumentSnapshot.length.toString());
                      postsList.clear();
                      postModelsList.clear();
                      for (var j in postsListAsJsonDocumentSnapshot) {
                        DocumentSnapshot ss = j;

                        postsList.add(ss.data() as Map<String, dynamic>);

                        postModelsList.add(PostModel.fromJson(
                            ss.data() as Map<String, dynamic>));
                      }
                      print("PostsListLength: "+postsList.length.toString());
                      print("PostModelsListLength: "+postModelsList.length.toString());
                      print("PostsList: " +
                          postModelsList[0].category.toString());
                    });
                  }

                  List<PostModel> posteModel = [];
                  for (var doc in snapshot.data!.docs) {}

                  return Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 64.h,
                            ),
                            Row(
                              children: [
                                /// back Widget
                                GestureDetector(
                                  onTap: () {
                                    // if (onBack != null) {
                                    //   onBack.call();
                                    // }
                                    navigateTo(context, ProfileScreen());
                                  },
                                  child:
                                  Image.asset(
                                    "assets/images/arrowleft.png",
                                    width: 30.w,
                                    height: 30.w,
                                  ),
                                ),

                                const Spacer(),
                                TextWidget(
                                  title: "Shelter",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26.sp,
                                ),
                                const Spacer()
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: defaultTextFormFieldForSearch(
                                  onSubmit: (v) {},
                                  controller: searchController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Type anything to search';
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.text,
                                  label: 'Search for pets',
                                  prefix: IconBroken.Search,
                                  context: context,
                                  suffix: InkWell(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              elevation: 0,
                                              backgroundColor: Colors.white,
                                              alignment: Alignment.topCenter,
                                              child: BuildFilter(
                                                  postModelsList:
                                                      postModelsList),
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset(
                                          "assets/images/filter.png"))),
                            ),
                            SizedBox(
                              height: 21.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.all(8.0.w),
                              child: TextWidget(
                                title: "Nearby Pets",
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                                color: mainColor,
                              ),
                            ),
                            // SizedBox(
                            //   height: 200.h,
                            //   child: StreamBuilder<QuerySnapshot>(
                            //       stream: FirebaseFirestore.instance
                            //           .collection('shelters')
                            //           .doc(isNearbyPet.name)
                            //           .collection(isNearbyPet.name)
                            //           .snapshots(),
                            //       builder: (context, snapshot) {
                            //         if (snapshot.connectionState ==
                            //             ConnectionState.waiting) {
                            //           return const Center(
                            //             child: CircularProgressIndicator(
                            //               color: mainColor,
                            //             ),
                            //           );
                            //         }
                            //         if (snapshot.connectionState ==
                            //             ConnectionState.none) {
                            //           return const Center(
                            //             child: Text('No Internet Concction'),
                            //           );
                            //         }
                            //         if (snapshot.hasError) {
                            //           return const Center(
                            //             child: Text('Error in Data'),
                            //           );
                            //         }
                            //         if (!snapshot.hasData) {
                            //           return const Center(
                            //             child: Text('No Data Found'),
                            //           );
                            //         }
                            //         if (snapshot.hasData) {
                            //           return Expanded(
                            //               child: GridView.builder(
                            //                   primary: false,
                            //                   padding: const EdgeInsets.all(10),
                            //                   itemCount:
                            //                       snapshot.data?.docs.length,
                            //                   gridDelegate:
                            //                       const SliverGridDelegateWithMaxCrossAxisExtent(
                            //                     maxCrossAxisExtent: 170,
                            //                     childAspectRatio: 1.0,
                            //                     mainAxisExtent: 170,
                            //                     crossAxisSpacing: 12,
                            //                   ),
                            //                   itemBuilder: (context, index) {
                            //                     final data =
                            //                         snapshot.data?.docs[index];
                            //                     return Card(
                            //                       child: Column(
                            //                         crossAxisAlignment:
                            //                             CrossAxisAlignment
                            //                                 .start,
                            //                         children: [
                            //                           Stack(
                            //                             children: [
                            //                               Image.network(
                            //                                 data?['image'] ??
                            //                                     '',
                            //                                 height: 110,
                            //                               ),
                            //                               Positioned(
                            //                                   height: 25.h,
                            //                                   right: 0.2,
                            //                                   top: 2,
                            //                                   child:
                            //                                       Image.asset(
                            //                                     "assets/images/heart.png",
                            //                                   )),
                            //                             ],
                            //                           ),
                            //                           TextWidget(
                            //                             title:
                            //                                 data?['name'] ?? '',
                            //                             fontWeight:
                            //                                 FontWeight.w500,
                            //                             fontSize: 16.sp,
                            //                           ),
                            //                           SizedBox(
                            //                             height: 6.h,
                            //                           ),
                            //                           Row(
                            //                             children: [
                            //                               Container(
                            //                                 color: mainColor,
                            //                                 height: 20.h,
                            //                                 width: 60.w,
                            //                               ),
                            //                               SizedBox(width: 24.w),
                            //                               Image.asset(
                            //                                 "assets/images/plus.png",
                            //                                 height: 15,
                            //                               )
                            //                             ],
                            //                           ),
                            //                           SizedBox(
                            //                             height: 6.h,
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     );
                            //                   }));
                            //         }
                            //         return const Text('NO data');
                            //       }),
                            // ),
                            SizedBox(
                              height: 240.h,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Card(
                                      child: InkWell(
                                        onTap: () {
                                          navigateTo(context, DonateScreen());
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Image.asset(
                                                  "assets/images/lola.png",
                                                  height: 110,
                                                  width: 160,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                    right: 8,
                                                    top: 2,
                                                    child: Image.asset(
                                                      "assets/images/heart.png",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0.w),
                                              child: Row(
                                                children: [
                                                  TextWidget(
                                                    title: "Lola",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 100.w,
                                                  ),
                                                  TextWidget(
                                                    title: "Girl",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                    color: Colors.pink,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(3.0.w),
                                              child: Row(
                                                children: [
                                                  TextWidget(
                                                    title: "30km away",
                                                    color: Colors.grey,
                                                    fontSize: 14.sp,
                                                  ),
                                                  SizedBox(width: 45.w),
                                                  TextWidget(
                                                    title: "1Year",
                                                    color: blackColor,
                                                    fontSize: 14.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 1,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.all(12.0.w),
                              child: GestureDetector(
                                onTap: (){
                                  print(cubit.users.length);
                                },
                                child: TextWidget(
                                  title: "Shelters",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26.sp,
                                  color: mainColor,
                                ),
                              ),
                            ),
                            // StreamBuilder<QuerySnapshot>(
                            //     stream: FirebaseFirestore.instance
                            //         .collection('shelters')
                            //         .doc(isShelter.name)
                            //         .collection(isShelter.name)
                            //         .snapshots(),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.connectionState ==
                            //           ConnectionState.waiting) {
                            //         return const Center(
                            //           child: CircularProgressIndicator(
                            //             color: mainColor,
                            //           ),
                            //         );
                            //       }
                            //       if (snapshot.connectionState ==
                            //           ConnectionState.none) {
                            //         return const Center(
                            //           child: Text('No Internet Concction'),
                            //         );
                            //       }
                            //       if (snapshot.hasError) {
                            //         return const Center(
                            //           child: Text('Error in Data'),
                            //         );
                            //       }
                            //       if (!snapshot.hasData) {
                            //         return const Center(
                            //           child: Text('No Data Found'),
                            //         );
                            //       }
                            //       if (snapshot.hasData) {
                            //         return SizedBox(
                            //           height: 180.h,
                            //           child: ListView.builder(
                            //               primary: false,
                            //               padding: const EdgeInsets.all(10),
                            //               itemCount: snapshot.data?.docs.length,
                            //               shrinkWrap: true,
                            //               scrollDirection: Axis.horizontal,
                            //               physics: BouncingScrollPhysics(),
                            //               itemBuilder: (context, index) {
                            //                 final data =
                            //                     snapshot.data?.docs[index];
                            //                 return GestureDetector(
                            //                   onTap: () {
                            //                     Utils.openScreen(
                            //                         context,
                            //                         ShelterDetailsScreen(
                            //                             name: data?['name']??"",
                            //                             email: data?['email']??"",
                            //                             phone: data?['phone']??"",
                            //                             address: data?['address']??"",
                            //                             petsNumber: data?['pets number']??"",
                            //                             open: data?['open']??"",
                            //                             days: data?['days']??"",
                            //                             image: data?['image']??""));
                            //                   },
                            //                   child: Padding(
                            //                     padding:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 4),
                            //                     child: Card(
                            //                       child: Column(
                            //                         crossAxisAlignment:
                            //                             CrossAxisAlignment
                            //                                 .start,
                            //                         children: [
                            //                           Image.network(
                            //                             data!['image'],
                            //                             height: 90.h,
                            //                             width: 0.33.sw,
                            //                           ),
                            //                           Padding(
                            //                             padding:
                            //                                 EdgeInsets.only(
                            //                                     left: 6.w),
                            //                             child: TextWidget(
                            //                               title: data['name'],
                            //                               fontWeight:
                            //                                   FontWeight.w400,
                            //                               fontSize: 20.sp,
                            //                             ),
                            //                           ),
                            //                           SizedBox(
                            //                             height: 6.h,
                            //                           ),
                            //                           Padding(
                            //                             padding:
                            //                                 EdgeInsets.only(
                            //                                     left: 6.w),
                            //                             child: Row(
                            //                               children: [
                            //                                 TextWidget(
                            //                                   title: data[
                            //                                       'pets number'],
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .w400,
                            //                                   fontSize: 12.sp,
                            //                                 ),
                            //                                 6.pw,
                            //                                 TextWidget(
                            //                                   title: "Pets",
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .w400,
                            //                                   fontSize: 12.sp,
                            //                                 ),
                            //                               ],
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 );
                            //               }),
                            //         );
                            //       }
                            //       return const Text('NO data');
                            //     }),

                            ConditionalBuilder(
                                condition: cubit.users.isNotEmpty,
                                builder: (BuildContext context){
                              return  SizedBox(
                                height: 180.h,
                                child: ListView.builder(
                                    primary: false,
                                    padding: const EdgeInsets.all(10),
                                    itemCount: cubit.users.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final data = GetCubit.get(context).users[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Utils.openScreen(
                                              context,
                                              ShelterDetailsScreen(
                                                  name: data.name??"",
                                                  email: data.email??"",
                                                  phone: data.phone??"",
                                                  address: "Sherbin mansoura",
                                                  petsNumber: data.petsNumber??"",
                                                  open: "8:00 AM - 8:00 PM",
                                                  days: "Saturday- Sunday",
                                                  image: data.profileImage??""));
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Image.network(
                                                  data.profileImage??"",
                                                  height: 90.h,
                                                  width: 0.33.sw,
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      left: 6.w),
                                                  child: TextWidget(
                                                    title: data.name??"",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      left: 6.w),
                                                  child: Row(
                                                    children: [
                                                      TextWidget(
                                                        title: data.petsNumber??"",
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 12.sp,
                                                      ),
                                                      6.pw,
                                                      TextWidget(
                                                        title: "Pets",
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              );

                                },
                                fallback:(BuildContext context){
                                  return Center( child: CircularProgressIndicator(
                                    color: defaultColor,

                                  ));
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: defaultColor,
                    ),
                  );
                }
              }),
        );
      },
    );
  }
}
