
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/cubitTest/states.dart';

import 'package:meaw/model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(Initial());
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  // bool obscure=true;
  // bool visibility=true;
  // void change(){
  //   visibility=!visibility;
  //   obscure=!obscure;
  //   emit(SecureChange());
  //
  // }
  // int current_index = 0;
  // void changeNav(index) {
  //   current_index = index;
  //   if (index==0)
  //     getBusiness();
  //
  //   emit(ChangeState());
  // }
  //User user;
  UserModelDymmy? model;
 Future <void> userLogin({
    required String email,
    required String password,
  })async
  {
    emit(Load());
   await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user);
      print('ok');
     // user = User.fromJson(value.data);
       model= UserModelDymmy(uid: value.user!.uid);
       if (model!=null){
         print(model!.uid);
       }
      emit(Success());
    }
    ).catchError((error){
      print(error.toString());
      print('error');
      emit(Error(error.toString()));
    });
  }

 // Stream<UserModel> get user{
  // return
     //map(u)=> FirebaseAuth.instance.authStateChanges();
 // }
  void checkLogin(){
   if (_auth.currentUser==null){
     print('null');
   }else{
     model= UserModelDymmy(uid:_auth.currentUser!.uid);
     if (model!=null){
       print(model!.uid);
     }
     print('logged in');
   }
  }
  void logOut(){
   if(_auth.currentUser!=null){
   _auth.signOut();}
  }
}