import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meaw/class.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/models/catModel.dart';
import 'package:meaw/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class CatCubit extends Cubit<CatStates>
{
  CatCubit(): super(CatInitialState());
  static CatCubit get(context) => BlocProvider.of(context);

  //============================================ show password in sign up page =============================================
  bool signUpPassword= true;
  IconData signUpPasswordIcon = Icons.remove_red_eye_outlined;
  changeSignUpVisibilityPassword(){
    signUpPassword = !signUpPassword;
    signUpPasswordIcon = signUpPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(CatSignUpChangeVisibilityPasswordState());
  }

  bool ischecked1=false;
  void checkChange(){
    ischecked1=!ischecked1;
    emit(CatLoginCheck1ChangedState());
  }
  bool ischecked2=false;
  void checkChange2(){
    ischecked2=!ischecked2;
    emit(CatLoginCheck2ChangedState());
  }
  bool ischecked3=false;
  void checkChange3(){
    ischecked3=!ischecked3;
    emit(CatLoginCheck3ChangedState());
  }
  //============================================ show password in sign in page =============================================
  bool signInPassword= true;
  IconData signInPasswordIcon = Icons.remove_red_eye_outlined;
  changeSignInVisibilityPassword(){
    signInPassword = !signInPassword;
    signInPasswordIcon = signInPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(CatSignInChangeVisibilityPasswordState());
  }

  //============================================ Sign Up =============================================
  Future<void> userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String? gender,
    required int userType
  }) async{
    emit(CatSignUpLoadingState());
   await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
        gender: gender,
        userType:userType
      );
    }).catchError((error) {
      emit(CatSignUpErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required int userType,
    String? image,
    String? gender
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,

      uId: uId,
      profileImage:image?? 'https://i.pinimg.com/564x/a1/d8/62/a1d862711ba51f2a19c6c0c4a891eb42.jpg',
      gender:gender,
      userType: userType

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CatCreateUserSuccessState(uId));
    })
        .catchError((error) {
      emit(CatCreateUserErrorState(error.toString()));
    });
  }

  IconData signUpSuffixIcon = Icons.visibility_outlined;
  bool signUpIsPassword = true;

  void signUpChangePasswordVisibility() {
    signUpIsPassword = !signUpIsPassword;
    signUpSuffixIcon =
    signUpIsPassword ? Icons.visibility_outlined : Icons
        .visibility_off_outlined;
    emit(CatSignUpChangeVisibilityPasswordState());
  }



  Future< void> userLogin({
    required String email,
    required String password,
    context
  }) async{
    emit(CatSignInLoadingState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      emit(CatSignInSuccessState(value.user!.uid,));
    }
    ).catchError((error) {
      emit(CatSignInErrorState(error.toString()));
    });
  }

  UserModel? userData;
  Future<void> getMyData()async{
    await FirebaseFirestore.instance.collection("users").doc(CacheHelper.getData(key: 'uId')==null ||CacheHelper.getData(key: 'uId')==""?uId:CacheHelper.getData(key: 'uId')
    ).get().then((value){
      userData = UserModel.fromJson(value.data()!);
      CacheHelper.saveData(key: 'userType', value: userData!.userType);
      userType=CacheHelper.getData(key: 'userType');
      print('your cash${userType}');
      emit(CatGetUserSuccessState());
    });
  }

  Future<void> getCatData(String catUID)async{
    await FirebaseFirestore.instance.collection("users").doc(uId??CacheHelper.getData(key: 'uId')).collection("cats").doc(catUID).get().then((value){
      catModel = CatModel.fromJson(value.data()!);
      print('iddd'+catModel!.id.toString());
      emit(CatGetSuccessState());
    });
  }


  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage ()async
  {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage !=null)
    {
      profileImage = File(pickedImage.path);
      print('Path: '+profileImage.toString());
      emit(CatPickProfileImageSuccessState());
    }
    else
    {
      emit(CatPickProfileImageErrorState());
    }
  }

  File? catImageEdit;
  var catEditPicker = ImagePicker();

  Future<void> getCatEditImage ()async
  {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage !=null)
    {
      profileImage = File(pickedImage.path);
      print('Path: '+profileImage.toString());
      emit(CatPickedCatImageEditSuccessState());
    }
    else
    {
      emit(CatPickedCatImageEditErrorState());
    }
  }

   //   upload profile image

  void uploadProfileImage({
    required String name,
    required String phone,
     required String email,
    required String gender,
  })
  {
    emit(CatUpdateImagesLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        updateUser(
          name: name,
          phone: phone,
          profile: value,
          gender:gender,
          email: email
        );
      })
          .catchError((error){
        emit(CatUploadProfileImageErrorState());
      });
    })
        .catchError((error){
      emit(CatUploadProfileImageErrorState());
    });
  }



  //update user date
  void updateUser({
    required String name,
    required String phone,
    String? profile,
    String? email,
    String? gender,
  })
  {
    emit(CatUpdateUserLoadingState());
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      profileImage: profile ?? userData!.profileImage,
      uId: userData!.uId,
      gender:gender,
      userType: ischecked1?1:ischecked2?2:3
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userData!.uId)
        .update(model.toMap())
        .then((value) {
      getMyData();
    }).catchError((error) {
      emit(CatUpdateUserErrorState());
    });
  }
CatModel? catModel ;
  Future<void> updateCat({
    required String name,
    String? profile,
    String? year,
    String? gender,
    String? id
  })async
  {
    print('MyID: '+id.toString());

    await getCatData(id.toString());
    emit(CatUpdateLoadingState());
    CatModel model = CatModel(
      name: name,
      gender: gender,
      //userId:catModel!.userId,
      catImage: profile ??catModel!.catImage,
      year:year,
      id:id
    );
     FirebaseFirestore.instance
        .collection('users')
        .doc(userData!.uId)
    .collection('cats')
    .doc(id)
         .set(model.toMap(),SetOptions(merge: true))
        .then((value)async {
          print("CurID: "+id.toString());
     await getCatData(id.toString());
     emit(CatUpdateSuccessState());
    }).catchError((error) {
      emit(CatUpdateErrorState());
    });
  }
  Future<void> uploadCatEditImage({
    required String catName,
    required String year,
    required String gender,
  })async
  {
    emit(CatUploadCatImageEditLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Cats/${Uri.file(catImage!.path).pathSegments.last}')
        .putFile(catImage!)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        updateCat(
            name: catName,
            year: year,
            profile: value,
            gender: gender
        );
      })
          .catchError((error){
        emit(CatUploadCatImageEditErrorState());
      });
    })
        .catchError((error){
      emit(CatUploadCatImageEditErrorState());
    });
  }

  void signOut() {

    FirebaseAuth.instance.signOut().then((value) {
      emit(CatSignOutSuccessfully());
    }
    ).catchError((error){

      emit(CatSignOutError(error.toString()));
    });
  }

  void forgetPassword(
    {required String email}
      ){
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(CatForgetPasswordSuccessState());
    }).catchError((error){
      emit(CatForgetPasswordErrorState());
    });
  }



  File? catImage;
  Future<void> getCatImage ()async
  {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);


    if(pickedImage != null){
      print("PickedPath: "+pickedImage.path.toString());
         catImage = File(pickedImage.path.toString());
         emit(CatPickCatImageSuccessState());
    }else{
      print('Null Photo');
      emit(CatPickProfileImageErrorState());
    }
    //
    // if(pickedImage !=null)
    // {
    //   catImage = File(pickedImage.path.toString());
    //   emit(CatPickCatImageSuccessState());
    // }
    // else
    // {
    //   emit(CatPickProfileImageErrorState());
    // }
  }

  // void addCat({
  //   required String catName,
  //   required String gender,
  //   required String year,
  //   required String catImage,
  //   String? id,
  // }) {
  //
  //   print('AddFCat: '+uId!);
  //
  //   emit(CatAddCatLoadingState());
  //   CatModel model = CatModel(
  //     name: catName,
  //     year: year,
  //     gender: gender,
  //     catImage: catImage,
  //     id: id
  //   );
  //   FirebaseFirestore.instance
  //       .collection('users').doc(uId).collection('cats').doc(id).set(model.toMap())
  //       .then((value) async{
  //         await getCatData(id.toString());
  //     emit(CatAddCatSuccessState());
  //   })
  //       .catchError((error) {
  //     emit(CatAddCatErrorState(error.toString()));
  //   });
  // }
  // var uuid = Uuid();
  // Future<void> uploadCatImage({
  //   required String catName,
  //   required String year,
  //   required String gender,
  // })async
  // {
  //   print('Dataa ${catName},${year},${gender},${catImage}');
  //   emit(CatUploadCatImageLoadingState());
  //   await firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('Cats/${Uri.file(catImage!.path).pathSegments.last}')
  //       .putFile(catImage!)
  //       .then((value) {
  //     value.ref.getDownloadURL()
  //         .then((value) {
  //       addCat(
  //         catName: catName,
  //         year: year,
  //         catImage: value,
  //         gender: gender,
  //           id:uuid.v1().toString()
  //       );
  //     })
  //         .catchError((error){
  //       emit(CatUploadCatImageErrorState());
  //     });
  //   })
  //       .catchError((error){
  //     emit(CatUploadCatImageErrorState());
  //   });
  // }




  Future<void> getDataaaaa()async{
    QuerySnapshot<Map<String,dynamic>> yasmeenSnapshots = await FirebaseFirestore.instance.collection('users')
        .doc(uId).collection('cats').get();
    List<QueryDocumentSnapshot<Map<String,dynamic>>> snapshots = yasmeenSnapshots.docs;
    for(var i in snapshots){

      list.add(i.data()as Map<String,dynamic>);
      //( i.data() as Map<String,dynamic>)
    }

  }


  // List<SocialUserModel> users =[];
  // void getUsers()
  // {
  //   users=[];
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .get()
  //       .then((value) {
  //     for (var element in value.docs) {
  //       if(element.data()['uId'] != userModel!.uId) {
  //         users.add(SocialUserModel.fromJson(element.data()));
  //       }
  //       emit(SocialGetUsersSuccessState());
  //     }
  //   })
  //       .catchError((error){
  //     emit(SocialGetUsersErrorState(error.toString()));
  //   });
  // }


  UserModel? userFaceModel;
  User? user=FirebaseAuth.instance.currentUser;
  Future<void> login()async {//edit

    try{
      emit(CatLoginFaceLoadingState());
      final fb=FacebookLogin();
      FacebookLoginResult facebookLoginResult=await fb.logIn(permissions: [
        FacebookPermission.publicProfile,FacebookPermission.email
      ]);

      if(facebookLoginResult.status==FacebookLoginStatus.success){

        final FacebookAccessToken accessToken=facebookLoginResult.accessToken!;
        final OAuthCredential authCredential=FacebookAuthProvider.credential(accessToken.token);
        UserCredential userCredential=
        await FirebaseAuth.instance.signInWithCredential(authCredential);
        user=userCredential.user;
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${accessToken.token}'));
        String imageUrl = jsonDecode(graphResponse.body)['picture']['data']['url'];
        print('graph image ${imageUrl}');
        if(user==null){
          print('user is null');
        }else{
          print('id ${user!.uid}');
          print('displayName ${user!.displayName}');
          print('email ${user!.email}');
          print('photoURL ${user!.photoURL}');
          // userFaceModel = UserModel(name: user!.displayName,email: user!.email,
          //     phone: user!.phoneNumber,profileImage: imageUrl,uId: user!.uid);
          userCreate(
            name: user!.displayName.toString(),
            email: user!.email.toString(),
            phone: user!.phoneNumber.toString(),
            uId: user!.uid,
            image: imageUrl,
            userType: ischecked1?1:ischecked2?2:3
          );
        }
        emit(CatLoginFaceSuccessState(user!.uid));
      }
      else{
        print('login error ${facebookLoginResult.error}');
        emit(CatLoginFaceErrorState());
      }
    }catch(e){
      print('error ${e}');
      emit(CatLoginFaceErrorState());
    }
  }
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get userGoogle => _user!;

  Future signInWithGoogle() async {

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuthentication = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    // final graphResponse = await http.get(Uri.parse(
    //     'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${credential.idToken}'));
    // String imageUrl = jsonDecode(graphResponse.body)['picture']['data']['url'];
    //print('graph image ${imageUrl}');
    userCreate(
        name: userGoogle.displayName.toString(),
        email: userGoogle.email.toString(),
        uId: userGoogle.id,
      image: userGoogle.photoUrl,
        phone: '',
      userType: ischecked1?1:ischecked2?2:3
    );
   emit(CatLoginGoogleSuccessState(userGoogle.id));
  }

  void rememberMe (String email,String password,bool isChecked ){
    if(isChecked){
    CacheHelper.saveData(key: 'email', value:email,
    );
    CacheHelper.saveData(key: 'password', value:password,
    );
     email=CacheHelper.getData(key: 'email');
     password=CacheHelper.getData(key: 'password');
    emit(CatLoginRememberedState());
    }
  }
  void putEmailAndPass(bool isCheck,String email,String pass){
if(isCheck)
  {
    email=CacheHelper.getData(key: 'email');
    pass=CacheHelper.getData(key: 'password');
  }
  }



  void changeGender(String value){
    userData!.gender=value;
    emit(ChangeGradeDropdownState());
  }
}