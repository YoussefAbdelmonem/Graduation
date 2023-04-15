import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/states.dart';
class ArticleCubit extends Cubit<ArticleStates>
{
  ArticleCubit(): super(ArticleInitialState());
  static ArticleCubit get(context) => BlocProvider.of(context);

  ArticleModel? articleData;
  Future<void> getArticleData(String UID)async{
    await FirebaseFirestore.instance.collection("articles").doc(UID.toString()).get().then((value){
      articleData = ArticleModel.fromJson(value.data()!);
      print('iddd'+articleData!.id.toString());
      emit(ArticleGetSuccessState());
    });
  }
  Stream<QuerySnapshot> getArticles () {return FirebaseFirestore.instance.collection('articles').snapshots();}
bool liked=false;
  changelikes(){
     liked!=liked;
    emit(ChangeArticleLikesSuccessState());
  }

  // numLikes(int view){
  //   view+=1;
  //   emit(ChangeArticleViewsSuccessState());
  // }

  Future<void> updateArticle({
    required String id,
    required int likes,
    required int views,
    required String body,
    required String title
  })async
  {
    print('MyID: '+id.toString());
     // getArticleData(id);
    emit(UpdateArticleLoadingState());
    // changelikes(articleData!.likes!);
    // changeviews(articleData!.views!);
    ArticleModel model = ArticleModel(
      likes:likes ,
            views:views+1 ,
            id: id,
          body:body,
          title:title
    );
    FirebaseFirestore.instance
        .collection('articles')
        .doc(id)
        .set(model.toMap(),
          SetOptions(merge: true)
    )
        .then((value) {
      print("CurID: "+id.toString());
      // getArticleData(id);
      print("Curviews: "+articleData!.views!.toString());
       emit(UpdateArticleSuccessState());
    }).catchError((error) {
      emit(UpdateArticleErrorState());
    });
  }

  // void updateLikesViews(
  // )
  // {
  //   emit(UpdateArticleLoadingState());
  //   ArticleModel model = ArticleModel(
  //       likes: changelikes(articleData!.likes!),
  //       views: changeviews(articleData!.views!),
  //       id: articleData!.id,
  //     body: articleData!.body,
  //     title: articleData!.title
  //
  //   );
  //   FirebaseFirestore.instance
  //       .collection('articles')
  //       .doc(articleData!.id)
  //       .update(model.toMap())
  //       .then((value) {
  //     getArticleData(articleData!.id);
  //   }).catchError((error) {
  //     emit(UpdateArticleErrorState());
  //   });
  // }
}