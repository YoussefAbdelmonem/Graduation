
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/style/icon_broken.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/donate/donate_screen.dart';
import 'package:meaw/yousef/screen/payment/payment_method/payment_methods_screen.dart';
import 'package:meaw/yousef/screen/shelter/filterCubit/filterCunbit.dart';
import 'package:meaw/yousef/screen/shelter/filterWidget.dart';
import 'package:meaw/yousef/screen/shelter/resultPet.dart';
import 'package:meaw/yousef/widgets/text_field.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';

import '../shelter_name/shelter_name_screen.dart';
enum ShelterData { nearbyPets, shelter, }

class ShelterScreen extends StatefulWidget {

   ShelterScreen({Key? key}) : super(key: key);

  @override
  State<ShelterScreen> createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
   List<String> petList=[];

   List<String> petListgender=[];

   List<String> petListage=[];

   List<String> petListweight=[];

   List<String> petListfinal=[];

   List<PostModel> petModelResult = [];



   List<PostModel> petModelResultfinalUnique = [];

   List<PostModel> petModelResultgender = [];

   List<PostModel> petModelResultage = [];

   List<PostModel> petModelResultweight = [];

   var controller=ScrollController();

   // var gender="";
   var searchController = TextEditingController();

   ShelterData isShelter = ShelterData.shelter;

   ShelterData isNearbyPet = ShelterData.nearbyPets;

  String shelters = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetCubit,GetStates>(
      listener: (context,state){},
      builder: (context,state){




        return Scaffold(
            body:

            // documentsIDsList.length<=0?Center(child: CircularProgressIndicator(color: Colors.blue,),):
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: documentsIDsList.map((e) {
            //     return Text(e,style: TextStyle(color: Colors.blue,fontSize: 20),);
            //   } ).toList()
            // ),



            StreamBuilder<QuerySnapshot>(
                stream:
                GetCubit.get(context).getPostsTest(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot d = snapshot.data! ;
                    List<DocumentSnapshot> usersList=[];
                    for(var i=0; i< d.docs.length;i++){
                      usersList.add( d.docs[i]);
                      print("ID: "+d.docs[i].id.toString());
                    }

                    List<Map<String,dynamic>> postsList=[];
                    List<PostModel> postModelsList=[];


                    for(var i=0; i<usersList.length;i++){
                      Future<QuerySnapshot<Map<String,dynamic>>> snapshotssssss =
                      FirebaseFirestore.instance.collection("posts").doc(usersList[i].id.toString()).collection("posts").get();
                      snapshotssssss.then((value) {
                        QuerySnapshot<Map<String,dynamic>> sss = value;
                        var postsListAsJsonDocumentSnapshot = sss.docs;
                        for(var j in postsListAsJsonDocumentSnapshot){
                          DocumentSnapshot ss = j;
                          postsList.add(ss.data() as Map<String,dynamic>);
                          postModelsList.add(PostModel.fromJson(ss.data()as Map<String,dynamic>));
                        }
                        print("PostsList: "+postModelsList[0].category.toString());
                      });
                    }




                     // print("ohhhh "+dd.id.toString());
                    // for(var doc in snapshot.data!.docs)
                    //   {
                    //     var data=doc.data()as Map<String,dynamic>;
                    //   //  print("ohhhh2"+data[0][]);
                    //   }
                    List<PostModel> posteModel = [];
                      for (var doc in snapshot.data!.docs)
                      {
                      // print(doc.data() as List<Map<String,dynamic>>);


                      //doc.data() as Map<String, dynamic>;

                      // posteModel.add(PostModel(
                      // name : data['name'],
                      // age : data['age'],
                      // gender : data['gender'],
                      // image : data['image'],
                      // category : data['category'],
                      // weight : data['weight'],
                      // price: data['price'],
                      // shelterid: data['shelterid'],
                      // health: data['health'],
                      // behavior: data['behavior'],
                      // id: data["id"].toString().trim()));
                      // petList.add(data["category"]);
                      // petListgender.add(data["gender"]);
                      // petListage.add(data["age"]);
                      // petListweight.add(data["weight"]);
                      // print('ddddddjjj'+posteModel[0].shelterid.toString());


                       }



                    // List<Widget> mWidgets = [];
                    //
                    // catModel.map((e) {
                    //   var c = petItem(e: e);
                    //   mWidgets.add(c);
                    // }).toList();
                    //
                    // mWidgets.insert(
                    //     0,
                    //     InkWell(
                    //       onTap: () {
                    //         navigateTo(context, AddCatScreen());
                    //       },
                    //       child: addItem(),
                    //     ));

                    return Padding(
                      padding:  EdgeInsets.all(8.0.w),
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
                                child:
                                defaultTextFormFieldForSearch(
                                    onSubmit: (v)
                                    {

                                    },
                                    controller: searchController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Type anything to search';
                                      }
                                      return null;
                                    },
                                    inputType: TextInputType.text,
                                    label: 'Search for pets',
                                    prefix: IconBroken.Search,
                                    context: context,
                                    suffix:InkWell(onTap: (){

                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            alignment: Alignment.topCenter,
                                            child: BuildFilter(postModelsList:postModelsList),
                                          );
                                        },
                                      );


                                      /*
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          constraints: BoxConstraints(
                                            // maxWidth: MediaQuery.of(context).size.width*0.8,
                                              maxHeight: MediaQuery.of(context).size.height*0.8
                                          ),
                                          isScrollControlled: true,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          context: context, builder: (context)=>Container(
                                          child: BuildFilter()));
                                      */

                                    },
                                        child: Image.asset("assets/images/filter.png"))
                                )
                                // TextFieldWidget(
                                //   onsubmit: (v){
                                //     List<String> result=[];
                                //     for(var i=0;i<petList.length;i++) {
                                //       if(petList[i].toLowerCase().trim().contains(v.toLowerCase())){
                                //         result.add(petList[i]);
                                //         petModelResult.add(postModel[i]);
                                //       }
                                //     };
                                //     if(result!=null&&searchController.text!=''){
                                //       // navigateTo(context, SearchScreen(articleModel: articleModelResult,));
                                //     }
                                //     print('my List'+result.first);
                                //   },
                                //   controller:searchController ,
                                //   onChanged: (val) {
                                //   },
                                //   hintText: "Search for pets",
                                //   prefixIcon: const Icon(Icons.search),
                                //   suffixIcon: Image.asset("assets/images/filter.png"),
                                //
                                //
                                // )
                                ,
                              ),
                              SizedBox(
                                height: 21.h,
                              ),
                              TextWidget(
                                title: "Nearby Pets",
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                                color: mainColor,
                              ),
                              SizedBox(
                                height: 200.h,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('shelters')
                                        .doc(isNearbyPet.name)
                                        .collection(isNearbyPet.name)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: mainColor,
                                          ),
                                        );
                                      }
                                      if (snapshot.connectionState == ConnectionState.none) {
                                        return const Center(
                                          child: Text('No Internet Concction'),
                                        );
                                      }
                                      if (snapshot.hasError) {
                                        return const Center(
                                          child: Text('Error in Data'),
                                        );
                                      }
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: Text('No Data Found'),
                                        );
                                      }
                                      if (snapshot.hasData) {
                                        return Expanded(
                                            child: GridView.builder(
                                                primary: false,
                                                padding: const EdgeInsets.all(10),
                                                itemCount: snapshot.data?.docs.length,

                                                gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 170,
                                                  childAspectRatio: 1.0,
                                                  mainAxisExtent: 170,

                                                  crossAxisSpacing: 12,

                                                ),
                                                itemBuilder: (context, index) {
                                                  final data = snapshot.data?.docs[index];
                                                  return Card(

                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Image.network(
                                                              data?['image'] ?? '',
                                                              height: 110,
                                                            ),
                                                            Positioned(
                                                                height: 25.h,
                                                                right: 0.2,
                                                                top: 2,
                                                                child: Image.asset(
                                                                  "assets/images/heart.png",
                                                                )),
                                                          ],
                                                        ),
                                                        TextWidget(
                                                          title: data?['name'] ?? '',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16.sp,
                                                        ),
                                                        SizedBox(
                                                          height: 6.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              color: mainColor,
                                                              height: 20.h,
                                                              width: 60.w,

                                                              /// the price of the product
                                                              // child: Center(
                                                              //   child: TextWidget(
                                                              //     title:
                                                              //     "${data?['price'] ?? ''} EGP",
                                                              //     color: Colors.white,
                                                              //     fontSize: 14.sp,
                                                              //   ),
                                                              // ),
                                                            ),
                                                            SizedBox(width: 24.w),
                                                            Image.asset(
                                                              "assets/images/plus.png",
                                                              height: 15,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 6.h,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }));
                                      }
                                      return const Text('NO data');
                                    }),
                              ),
                              SizedBox(
                                height: 240.h,

                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Card(
                                        child: InkWell(
                                          onTap: (){
                                            navigateTo(context,DonateScreen());
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                padding:  EdgeInsets.all(8.0.w),
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
                                                padding:  EdgeInsets.all(3.0.w),
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
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                ),

                              ),
                              SizedBox(
                                height: 21.h,
                              ),
                              TextWidget(
                                title: "Shelters",
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                                color: mainColor,
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('shelters')
                                      .doc(isShelter.name)
                                      .collection(isShelter.name)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: mainColor,
                                        ),
                                      );
                                    }
                                    if (snapshot.connectionState == ConnectionState.none) {
                                      return const Center(
                                        child: Text('No Internet Concction'),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: Text('Error in Data'),
                                      );
                                    }
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: Text('No Data Found'),
                                      );
                                    }
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: 180.h,
                                        child: ListView.builder(
                                            primary: false,
                                            padding: const EdgeInsets.all(10),
                                            itemCount: snapshot.data?.docs.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,


                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              final data = snapshot.data?.docs[index];
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Card(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Image.network(
                                                        data!['image'],
                                                        height: 110,
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.only(left: 6.w),
                                                        child: TextWidget(
                                                          title: data['name'],
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.only(left: 6.w),
                                                        child: TextWidget(
                                                          title: data['pets number'],
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 8.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      );

                                    }
                                    return const Text('NO data');
                                  })
                              ,
                              // SizedBox(
                              //     height: 215.h,
                              //     child: ListView.builder(
                              //       itemBuilder: (context, index) {
                              //         return GestureDetector(
                              //           onTap: ()
                              //           {
                              //             Utils.openScreen(context, const ShelterNameScreen());
                              //           },
                              //           child: Padding(
                              //             padding: const EdgeInsets.symmetric(horizontal: 4),
                              //             child: Card(
                              //               child: Column(
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: [
                              //                   Image.asset(
                              //                     "assets/images/shelter1.png",
                              //                     height: 110,
                              //                   ),
                              //                   Padding(
                              //                     padding:  EdgeInsets.only(left: 6.w),
                              //                     child: TextWidget(
                              //                       title: "Happy Friend",
                              //                       fontWeight: FontWeight.w400,
                              //                       fontSize: 14.sp,
                              //                     ),
                              //                   ),
                              //                   SizedBox(
                              //                     height: 6.h,
                              //                   ),
                              //                   Padding(
                              //                     padding:  EdgeInsets.only(left: 6.w),
                              //                     child: TextWidget(
                              //                       title: "150 pets",
                              //                       fontWeight: FontWeight.w400,
                              //                       fontSize: 8.sp,
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       },
                              //       itemCount: 5,
                              //
                              //       scrollDirection: Axis.horizontal,
                              //     ),
                              //
                              // ),

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
