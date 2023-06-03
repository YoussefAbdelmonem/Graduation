import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/article.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/states.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({Key? key}) : super(key: key);

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {

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

                        ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context,index)=>  buildContainer(
                              title:'${careList[index].title}',
                              onPressed:(){
                                ArticleCubit.get(context).updateArticle(
                                    id:careList[index].id! ,
                                    title:careList[index].title!,
                                    body: careList[index].body!,
                                    likes: careList[index].likes!,
                                    views: careList[index].views!,
                                  type: careList[index].type!
                                );
                                print('yuuii'+careList[index].id!);
                                print('yuuii'+careList[index].views!.toString());
                                navigateTo(context, Article(
                                  body: careList[index].body!,
                                  title:careList[index].title! ,
                                  likes: careList[index].likes!,
                                  views: careList[index].views!,
                                  id:careList[index].id! ,
                                ));
                              },
                              image: 'assets/images/G-removebg-preview 1 (1).png',
                            ),
                            separatorBuilder: (context,index)=>SizedBox(
                              height: 15,
                            ),
                            itemCount: careList.length
                        )

              ],
            )
            //ككككككككك
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
          flex: 2,
          child: Image.asset(image),),
      ],
    ),
  );
}
