import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/screens/bottomNavScreen/services/servicesScreen.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/states.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/diseaseScreen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
class Article extends StatefulWidget {
  Article({required this.views,required this.body,required this.title,required this.likes,required this.id}) : super();
String body;
String title;
int? likes;
int? views;
String? id;
  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  ArticleModel? articleModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit,ArticleStates>(
      listener: (context,state){},
      builder: (context,state){
    return StreamBuilder<QuerySnapshot>(
        stream:
        ArticleCubit.get(context).getArticles(),
        builder: (context, snapshot) {
          print('articlrrrr');
          if (snapshot.hasData) {

            for (var doc in snapshot.data!.docs) {
              var data =
              doc.data() as Map<String, dynamic>;
              if (doc.id==widget.id){
              articleModel=ArticleModel(
                  title: data['title'],
                  body: data['body'],
                  likes: data['likes'],
                  views: data['views'],
                  id: widget.id.toString().trim());}
              // bodyList.add(data['body']);
            }
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: SingleChildScrollView(child: Column(
                    children: [
                      SizedBox(
                        height: 220,
                      ),
                      Text('${widget.body}'),
                    ],
                  )),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 19),
                    height:220 ,
                    width: 390,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey,offset:Offset(.5, 0),blurRadius: .2 ),
                        ],
                        color: Colors.white
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      articleAppBaar(
                          context: context,
                         // screen: ServicesScreen(),
                          label:'Article' ,
                          width: 100.h
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 216,
                            child: Text(
                              '${widget.title}',
                              style: GoogleFonts.roboto(
                                  fontSize: 26,
                                  color:defaultColor,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Row(
                        children: [
                          ImageIcon(AssetImage('assets/images/sss/Linear/eye.png')),
                          SizedBox(
                            width: 7.w
                            ,
                          ),
                          Text('${articleModel!.views!} Views',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color:Colors.grey,
                                fontWeight: FontWeight.w400
                            ),
                          ),Spacer(),
                          IconButton(
                            onPressed: (){
                              // ArticleCubit.get(context).changelikes();
                              setState(() {
                                ArticleCubit.get(context).liked=!ArticleCubit.get(context).liked;
                              });
                              if(ArticleCubit.get(context).liked==true){
                              ArticleCubit.get(context).updateArticle(
                                  id:widget.id! ,
                                  title:widget.title!,
                                  body: widget.body!,
                                  likes: articleModel!.likes!+1,
                                  views: articleModel!.views!,
                                type: articleModel!.type!
                              );}else{
                                ArticleCubit.get(context).updateArticle(
                                    id:widget.id! ,
                                    title:widget.title!,
                                    body: widget.body!,
                                    likes: articleModel!.likes!-1,
                                    views: articleModel!.views!,
                                  type: articleModel!.type!
                                );
                              }
                            },
                            icon:Icon(ArticleCubit.get(context).liked==false?Icons.favorite_border_outlined:Icons.favorite,
                            color:ArticleCubit.get(context).liked==false?Colors.red:Colors.red ,
                            ) ),
                          Text(
                            '${articleModel!.likes!}',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color:Colors.grey,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Spacer(),
                          Image(image:AssetImage('assets/images/Iconsax/Linear/save2.png')),
                          SizedBox(
                            width: 7.w
                            ,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Text('Bookmark now',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color:Colors.grey,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],),
                  ),
                ),
              ],
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
    });
      },
    );
  }
}
