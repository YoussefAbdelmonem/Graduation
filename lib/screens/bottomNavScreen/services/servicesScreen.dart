
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/model.dart';
import 'package:meaw/screens/bottomNavScreen/services/SearchScreen.dart';
import 'package:meaw/screens/servicesScreens/careScreen/careScreen.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/diseaseScreen.dart';
import 'package:meaw/screens/servicesScreens/hospitalsScreen/hospitalScreen.dart';
import 'package:meaw/screens/servicesScreens/scanScreen/scanScreen.dart';
import 'package:meaw/style/icon_broken.dart';
import 'package:meaw/yousef/data/maps/repo/maps_repo.dart';
import 'package:meaw/yousef/data/maps/web_services/maps_web_servies.dart';
import 'package:meaw/yousef/screen/map/map_screen/cubit/map_cubit.dart';
import 'package:meaw/yousef/screen/map/map_screen/map_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';

class ServicesScreen extends StatefulWidget {
   ServicesScreen() : super();

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
   var searchController = TextEditingController();

   var formKey = GlobalKey<FormState>();

   Color defaultButtonColor = const Color(0xfff4e7bd);

   Color secondaryButtonColor = const Color(0xffe48c64);

   bool button1 = true;

   bool button2 = false;

   bool button3 = false;

   bool button4 = false;
   List<String>bodyList = [];

   List<ArticleModel> articleModel = [];
   List<ArticleModel> articleModelResult = [];

   UserModelDymmy? userModel;
   @override
  void initState() {
    // TODO: implement initState
     articleModelResult.clear();
     print("hhjkkk${CatCubit.get(context).userData!.userType}");
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.all(16.0.w),
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream:
              ArticleCubit.get(context).getArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  for (var doc in snapshot.data!.docs) {
                    var data =
                    doc.data() as Map<String, dynamic>;
                    articleModel.add(ArticleModel(
                        title: data['title'],
                        body: data['body'],
                        likes: data['likes'],
                        views: data['views'],
                        id: data["id"].toString().trim(),
                      type: data['type']
                    ));
                    // bodySet.add(data['body']
                    // );
                    // bodySet!.forEach((element1) {
                    //   bodyList.add(element1);
                    // });
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


                  return Container();


                } else {
                  return Container();
                }
              }),
//t3deeeel
           //if(CatCubit.get(context).userData!.userType==3)

          /////////////////////////////////////////////////

          Form(
            key: formKey,
            child: Column(
              children: [
                defaultTextFormFieldForSearch(
                  onSubmit: (v){
                    List<String> result=[];
                   for(var i=0;i<bodyList.length;i++) {
                     if(bodyList[i].toLowerCase().trim().contains(v.toLowerCase())){
                       // resultSet.add(bodyList[i]);
                       sArticleModelResults.add(articleModel[i]);
                     }
                     print("result set${sArticleModelResults.length}");
                     // print("articleModelResultSet${articleModelResultSet.length}");
                   };
                    // articleModelResultSet!.forEach((element1) {
                    //   articleModelResult.add(element1);
                    // });
                    // articleModelResult.addAll(articleModelResultSet);
                    print("your result real${articleModelResult.length}");
                   if(result!=null&&searchController.text!=''){
                   navigateTo(context, SearchScreen(articleModel: sArticleModelResults.toList(),));
                   }
                   // print('my List'+result.first);
                  },
                  controller: searchController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Type anything to search';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  label: 'Search for services',
                  prefix: IconBroken.Search,
                  context: context
                ),
              ],
            ),
          ),

          ///////////////////////////////////////////////////////

           //if(CatCubit.get(context).userData!.userType==3)
          const SizedBox(height: 10,),
           //if(CatCubit.get(context).userData!.userType==3)
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text('Services',
                        style: TextStyle(
                          fontSize: 30,
                          color: defaultColor,
                          fontFamily: 'Jannah'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              button1 = true;
                              button2 = false;
                              button3 = false;
                              button4 = false;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight*0.13,
                                decoration: BoxDecoration(
                                  color: button1? secondaryButtonColor:defaultButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/diseses.png',color: button1? defaultButtonColor:secondaryButtonColor,),
                              ),
                              const SizedBox(height: 8,),
                               Text('Diseases',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Jannah',
                                  color: button1? defaultColor:Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              button1 = false;
                              button2 = true;
                              button3 = false;
                              button4 = false;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight*0.13,
                                decoration: BoxDecoration(
                                  color: button2? defaultColor:defaultButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/chat/care.png'),
                              ),
                              const SizedBox(height: 8,),
                               Text('Care',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'Jannah',
                                  color: button2? defaultColor:Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              button1 = false;
                              button2 = false;
                              button3 = true;
                              button4 = false;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight*0.13,
                                decoration: BoxDecoration(
                                  color: button3? secondaryButtonColor:defaultButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/scan.png'),
                              ),
                               SizedBox(height: 8.h,),
                               Text('Scan',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'Jannah',
                                  color: button3? secondaryButtonColor:Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Utils.openScreen(context, BlocProvider(
                                create: (BuildContext context)=>MapsCubit(MapsRepository(PlacesWebservices())),
                                child: const MapScreen()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight*0.13,
                                decoration: BoxDecoration(
                                  color: button4? secondaryButtonColor:defaultButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/map.png'),
                              ),
                              const SizedBox(height: 8,),
                               Text(
                                 'Hospitals',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'Jannah',
                                  color: button4 ? secondaryButtonColor:Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  if(button1)
                    const DiseaseScreen(),
                  if(button2)
                    const CareScreen(),
                  if(button3)
                    const ScanScreen(),
                  if(button4)
                    const HospitalsScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
