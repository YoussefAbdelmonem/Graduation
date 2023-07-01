
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/data/models/user_uid_model.dart';
import 'package:meaw/screens/loginScreen/cubit/states.dart';



class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(Initial());
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }
  FirebaseAuth _auth=FirebaseAuth.instance;

  UserModelUID? model;
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
       model= UserModelUID(uid: value.user!.uid);
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


  void checkLogin(){
   if (_auth.currentUser==null){
     print('null');
   }else{
     model= UserModelUID(uid:_auth.currentUser!.uid);
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