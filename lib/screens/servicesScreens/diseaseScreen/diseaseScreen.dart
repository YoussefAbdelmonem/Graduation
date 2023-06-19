import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/article.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/states.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  // List<String> bodyList=[];
  // List<ArticleModel>diseaseList=[];
  // Set<String> bodySet={};
  // Set<ArticleModel> careSet={};
  // Set<ArticleModel>diseaseSet={};

  List<ArticleModel> sCareList=[];
  List<ArticleModel>sDiseaseList=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit,ArticleStates>(
      listener: (context,state){},
      builder: (context,state)=>Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:
                  ArticleCubit.get(context).getArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ArticleModel> articleModel = [];


                      for (var doc in snapshot.data!.docs) {
                        var data =
                        doc.data() as Map<String, dynamic>;

                        sDiseaseList.clear();
                        sCareList.clear();


                        // articleModel.clear();

                        articleModel.add(ArticleModel(
                            title: data['title'],
                            body: data['body'],
                            likes: data['likes'],
                            views: data['views'],
                            id: data["id"].toString().trim(),
                            type: data["type"]
                        ));

                        print("MLength: "+articleModel.length.toString());



                        // articleModel.forEach((element1) {
                        //   bodySet.add(element1.body.toString());
                        //   if (element1.type =='disease' ) {
                        //     diseaseSet.add(element1);
                        //     print("disase set${diseaseSet.length.toString()}");
                        //   }else{
                        //     careSet.add(element1);
                        //   }
                        // });

                        // bodySet.forEach((element1) {
                        //   bodyList.add(element1);
                        // });
                        // diseaseSet.forEach((element1) {
                        //   diseaseList.add(element1);
                        //   print("disase List${diseaseList.length.toString()}");
                        // });
                        // careSet.forEach((element1) {
                        //   careList.add(element1);
                        // });
                      }

                      // articleModel.forEach((element) {
                      //
                      // });



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

                      articleModel.forEach((element) {
                        if(element.type == "disease"){
                          sDiseaseList.add(element);
                        }else{
                          sCareList.add(element);
                        }
                      });



                      print("Artcile0: "+articleModel[0].type.toString());
                      print("Artcile1: "+articleModel[1].type.toString());

                      print("DiseaseList: "+sDiseaseList.length.toString());
                      print("CareList: "+sCareList.length.toString());

                      careList = sCareList;
                      diseaseList = sDiseaseList;

                      return ListView.separated(
                        shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index)=>  buildContainer(
                            title:'${sDiseaseList[index].title}',
                            onPressed:(){
                             ArticleCubit.get(context).updateArticle(
                               id:sDiseaseList[index].id! ,
                               title:sDiseaseList[index].title!,
                               body: sDiseaseList[index].body!,
                               likes: sDiseaseList[index].likes!,
                                 views: sDiseaseList[index].views!,
                               type: sDiseaseList[index].type!
                             );

                              navigateTo(context, Article(
                                body: sDiseaseList[index].body!,
                                title:sDiseaseList[index].title! ,
                                likes: sDiseaseList[index].likes!,
                                views: sDiseaseList[index].views!,
                                id:sDiseaseList[index].id! ,
                              ));
                            },
                            image: 'assets/images/catDiseas.png',
                          ),
                          separatorBuilder: (context,index)=>SizedBox(
                            height: 15,
                          ),
                          itemCount: sDiseaseList.length
                      ) ;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: defaultColor,
                        ),
                      );
                    }
                  }),
            ],
          )
          //kkkkkkkkkk
          // buildContainer(
          //   title: 'Upper \nRespiratory\nInfection',
          //   onPressed: (){
          //     ArticleCubit.get(context).getArticleData();
          //   },
          //   image: 'assets/images/catDiseas.png',
          // ),
          // const SizedBox(height: 15,),
          // buildContainer(
          //   title: 'Feline \nImmunodeficiency\nVirus (FIV)',
          //   onPressed: (){
          //     ArticleCubit.get(context).getArticleData();
          //   },
          //   image: 'assets/images/catCare.png',
          // ),
        ],
      )
    );
  }

  Widget buildContainer({
  required String title,
  required Function onPressed,
  required String image,
})=>Container(
    width: double.infinity,
    height: 250,
    decoration: BoxDecoration(
      gradient:
      LinearGradient(begin: FractionalOffset.bottomLeft, end: FractionalOffset.topRight, colors: [
        Color.fromRGBO(157,171,134,1),
        Color.fromRGBO(157,171,134,1),
        Color.fromRGBO(169,184,146,1),
        Color.fromRGBO(169,184,146,1),
      ], stops: [
        0.0,
        0.58,
        0.58,
        0.1,

      ]),
      // const LinearGradient(
      //   transform:GradientRotation(45) ,
      //   begin: Alignment.topLeft,
      //   // end: Alignment.centerRight,
      //   colors: [
      //     Color.fromRGBO(157,171,134,1),
      //     Color.fromRGBO(169,184,146,1),
      //   ],
      // ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(title,
                  maxLines: 4,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 27,
                      fontFamily: 'Jannah',
                      height: 1.3
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  color: const Color(0xfff5e5bc),
                  child: MaterialButton(
                    onPressed: (){onPressed();},
                    child: const Text('Read More...',
                      style: TextStyle(
                          fontSize: 17
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.asset(image),),
      ],
    ),
  );
}
// Column(
// children: [
// const SizedBox(
// height: 10,
// ),
// StreamBuilder<QuerySnapshot>(
// stream:
// ArticleCubit.get(context).getArticles(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// List<ArticleModel> articleModel = [];
// for (var doc in snapshot.data!.docs) {
// var data =
// doc.data() as Map<String, dynamic>;
// articleModel.add(ArticleModel(
// title: data['title'],
// body: data['body'],
// likes: data['likes'],
// views: data['views'],
// id: data["id"].toString().trim()));
// bodyList.add(data['body']);
// }
// // List<Widget> mWidgets = [];
// //
// // catModel.map((e) {
// //   var c = petItem(e: e);
// //   mWidgets.add(c);
// // }).toList();
// //
// // mWidgets.insert(
// //     0,
// //     InkWell(
// //       onTap: () {
// //         navigateTo(context, AddCatScreen());
// //       },
// //       child: addItem(),
// //     ));
//
// return ListView.separated(
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// itemBuilder: (context,index)=>  buildContainer(
// title:'${articleModel[index].title}',
// onPressed:(){
// ArticleCubit.get(context).updateArticle(
// id:articleModel[index].id! ,
// title:articleModel[index].title!,
// body: articleModel[index].body!,
// likes: articleModel[index].likes!,
// views: articleModel[index].views!
// );
// print('yuuii'+articleModel[index].id!);
// print('yuuii'+articleModel[index].views!.toString());
// navigateTo(context, Article(
// body: articleModel[index].body!,
// title:articleModel[index].title! ,
// likes: articleModel[index].likes!,
// views: articleModel[index].views!,
// id:articleModel[index].id! ,
// ));
// },
// image: 'assets/images/catDiseas.png',
// ),
// separatorBuilder: (context,index)=>SizedBox(
// height: 15,
// ),
// itemCount: articleModel.length
// ) ;
// } else {
// return const Center(
// child: CircularProgressIndicator(
// color: defaultColor,
// ),
// );
// }
// }),
// ],
// )