import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/petProfileList/petProfileListCubit/states.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../data/models/catModel.dart';
class PetProfileListCubit extends Cubit<PetProfileListStates>
{
  PetProfileListCubit(): super(PetInitialProfileListState());
  static PetProfileListCubit get(context) => BlocProvider.of(context);

  Stream<QuerySnapshot> getCats () {return FirebaseFirestore.instance.collection('users').doc(uId).collection('cats').snapshots();}

  File? catImage;
  var picker = ImagePicker();
  Future<void> getCatImage ()async
  {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);


    if(pickedImage != null){
      print("PickedPath: "+pickedImage.path.toString());
      catImage = File(pickedImage.path.toString());
      emit(PetPickCatImageSuccessState());
    }else{
      print('Null Photo');
      emit(PetPickProfileImageErrorState());
    }
  }
  CatModel? catModel ;
  Future<void> getCatData(String catUID)async{
    await FirebaseFirestore.instance.collection("users").doc(uId??CacheHelper.getData(key: 'uId')).collection("cats").doc(catUID).get().then((value){
      catModel = CatModel.fromJson(value.data()!);
      print('iddd'+catModel!.id.toString());
      emit(PetGetSuccessState());
    });
  }

  void addCat({
    required String catName,
    required String gender,
    required String year,
    required String catImage,
    String? id,
  }) {

    print('AddFCat: '+uId!);

    emit(PetAddCatLoadingState());
    CatModel model = CatModel(
        name: catName,
        year: year,
        gender: gender,
        catImage: catImage,
        id: id
    );
    FirebaseFirestore.instance
        .collection('users').doc(uId).collection('cats').doc(id).set(model.toMap())
        .then((value) async{
      await getCatData(id.toString());
      emit(PetAddCatSuccessState());
    })
        .catchError((error) {
      emit(PetAddCatErrorState(error.toString()));
    });
  }

  var uuid = Uuid();
  Future<void> uploadCatImage({
    required String catName,
    required String year,
    required String gender,
  })async
  {
    print('Dataa ${catName},${year},${gender},${catImage}');
    emit(PetUploadCatImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Cats/${Uri.file(catImage!.path).pathSegments.last}')
        .putFile(catImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        addCat(
            catName: catName,
            year: year,
            catImage: value,
            gender: gender,
            id:uuid.v1().toString()
        );
      })
          .catchError((error){
        emit(PetUploadCatImageErrorState());
      });
    })
        .catchError((error){
      emit(PetUploadCatImageErrorState());
    });
  }
  int catYear=0;
  void addAge(){
    catYear += 1;
    emit(PetaddAgeSuccessState());
  }
  void minusAge(){
    catYear -= 1;
    emit(PetminusAgeSuccessState());
  }
  String? catGender;
  List<String> list = <String>['Male', 'Female', ];
  void gender(var value){
    catGender = value as String?;
    emit(PetGenderAgeSuccessState());
  }
}