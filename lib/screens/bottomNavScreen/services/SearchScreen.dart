import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/screens/bottomNavScreen/services/servicesScreen.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/article.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
class SearchScreen extends StatefulWidget {
   SearchScreen({required this .articleModel}) : super();
List articleModel;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          articleAppBaar(context: context, label: 'Articles', width:  100.h

          ),
          SizedBox(
            height: 30.h,
          ),
          ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=>  buildContainer(
            title:'${widget.articleModel[index].title}',
            onPressed:(){
              ArticleCubit.get(context).updateArticle(
                  id:widget.articleModel[index].id! ,
                  title:widget.articleModel[index].title!,
                  body: widget.articleModel[index].body!,
                  likes:widget. articleModel[index].likes!,
                  views: widget.articleModel[index].views!,
                type: widget.articleModel[index].type!,
              );
              navigateTo(context, Article(
                body: widget.articleModel[index].body!,
                title:widget.articleModel[index].title! ,
                likes: widget.articleModel[index].likes!,
                views: widget.articleModel[index].views!,
                id:widget.articleModel[index].id! ,
              ));
            },
            image: 'assets/images/catDiseas.png',
          ),
          separatorBuilder: (context,index)=>const SizedBox(
            height: 15,
          ),
          itemCount: sArticleModelResults.length
      )
        ],
      ),
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
