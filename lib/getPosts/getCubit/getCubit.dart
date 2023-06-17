import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/models/userModel.dart';

class GetCubit extends Cubit<GetStates>
{
  GetCubit(): super(GetInitialState());
  static GetCubit get(context) => BlocProvider.of(context);
  // Future<void> getPostData(String ID)async{
  //   await FirebaseFirestore.instance.collection("posts").doc(ID).collection("posts").doc().get().then((value){
  //    PostModel postModel = PostModel.fromJson(value.data()!);
  //    postModel!.experiments!.forEach((element) {
  //      if (element.category == "physics") {
  //        physicsList.add(element);
  //      }
  //    });
  //     print('iddd'+postModel!.id.toString());
  //     emit(PostGetSuccessState());
  //   });
  // }
  // Future<void> getDataaaaa()async {
  //   QuerySnapshot<
  //       Map<String, dynamic>> yasmeenSnapshots = await FirebaseFirestore
  //       .instance.collection('posts')
  //       .doc(uId).collection('posts').get();
  //   List<QueryDocumentSnapshot<
  //       Map<String, dynamic>>> snapshots = yasmeenSnapshots.docs;
  //   for (var i in snapshots) {
  //     list.add(i.data() as Map<String, dynamic>);
  //     //( i.data() as Map<String,dynamic>)
  //   }
  // }

  File? postImage;
  var picker = ImagePicker();

  Future<void> getPostImage ()async
  {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage !=null)
    {
      postImage = File(pickedImage.path);
      print('Path: '+postImage.toString());
      emit(PickPostImageSuccessState());
    }
    else
    {
      emit(PickPostImageErrorState());
    }
  }
  Future<void> uploadPostImage({
    required String name,
    required String price,
    required String age,
    required String gender,
    required String category,
    required String weight,
    String? behavior,
    String? health,
  })
  async{
    emit(UpdateImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        updatePost(
            name: name,
            price: price,
            age: age,
            gender:gender,
            category: category,
            weight:weight,
            behavior: behavior,
            health: health,
            image: value
        );
      })
          .catchError((error){
        emit(UploadPostImageErrorState());
      });
    })
        .catchError((error){
      emit(UploadPostImageErrorState());
    });
  }
  Future<void> updatePost({
    required String name,
    required String price,
    String? age,
    String? gender,
    String? category,
    String? weight,
    String? image,
    String? behavior,
    String? health,
  })
  async{
    emit(UpdateImageLoadingState());
    getMyData(postData!.id.toString());
    PostModel model = PostModel(
        name: name,
        price: price,
        category: category,
        image: image ?? postData!.image,
        gender:gender,
        weight: weight,
        age: age,
        behavior:behavior ,
        health: health,
        shelterid: postData!.shelterid,
        id: postData!.id
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(uId)
        .collection('posts')
        .doc(postData!.id)
        .update(model.toMap())
        .then((value) {
      getMyData(postData!.id.toString());
    }).catchError((error) {
      emit(PostUpdateErrorState());
    });
  }
  PostModel? postData;
  Future<void>getMyData(String postid)async{
    await FirebaseFirestore.instance.collection("posts").doc(uId??CacheHelper.getData(key: 'uId')).collection("posts").doc("${postid.toString()}").get().then((value){
      postData = PostModel.fromJson(value.data()!);
      print('donnneee'+postData!.id.toString());
      emit(PostGetDataSuccessState());
    });
  }
  Stream<QuerySnapshot> getPosts () {return FirebaseFirestore.instance.collection('posts').doc(uId).collection('posts').snapshots();}
  Stream<QuerySnapshot> getPostsTest()
  {
    return FirebaseFirestore.instance.collection('posts').snapshots();

  }



  Future<List<String>> getIDs()async{
    List<String> test=[];
    QuerySnapshot snapshots = await FirebaseFirestore.instance.collection('posts').get();
    for(var i in snapshots.docs){
      test.add(i.id.toString());
    }
    return test;
  }
// List<UserModel> users=[];
// Future<List<UserModel>> getUsersIDs()async{
//   List<String> test=[];
//
//   QuerySnapshot snapshots = await FirebaseFirestore.instance.collection('users').get();
//   for(var i in snapshots.docs){
//     test.add(i.id.toString());
//     print('youidddd${test[0]}');
//    // UserModel? MODEL=
//     await getMyUserData(i.id);
//     print('dddddd${userDataaa!.name}');
//     //print('rrrrr${MODEL!.name}');
//     if(userDataaa!.userType==1){
//      users.add(userDataaa!);
//     print('dddddd${userDataaa!.name}');}
//   }
//   print('dddddd${users.length}');
//   return users;
// }
// UserModel? userDataaa;
// Future<UserModel?> getMyUserData(String idd)async{
//
//   await FirebaseFirestore.instance.collection("users").doc(idd).get().then((value){
//     userDataaa = UserModel.fromJson(value.data()!);
//     print('your jjj${userDataaa!.userType}');
//     //emit(DataGetUserSuccessState());
//     return userDataaa;
//   });
// }
}