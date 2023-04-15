

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/cubitTest/cubit.dart';
import 'package:meaw/cubitTest/states.dart';
class Ath extends StatefulWidget {
  const Ath({Key? key}) : super(key: key);

  @override
  State<Ath> createState() => _AthState();
}

class _AthState extends State<Ath> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInAnon()async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
     catch(e){
      print(e.toString());
      return null ;
     }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          body: Center(child: Column(
            children: [
              TextButton(onPressed: ()async{
                await LoginCubit.get(context).userLogin(email: 'amira@gmail.com', password: '123456');
                //LoginCubit.get(context).userLogin(email: 'amira@gmail.com', password: '123456');
              // dynamic result= await signInAnon();
              // if(result==null){
              //    print('error');
              //  }else{
              //    print(result);
              //  }
              }, child:Text('login',style:TextStyle(
                color: Colors.black
              ),)),
              TextButton(onPressed: (){
                 LoginCubit.get(context).logOut();
                //LoginCubit.get(context).userLogin(email: 'amira@gmail.com', password: '123456');
                // dynamic result= await signInAnon();
                // if(result==null){
                //    print('error');
                //  }else{
                //    print(result);
                //  }
              }, child:Text('log out',style:TextStyle(
                  color: Colors.black
              ),)),
            ],
          ),),
        );
     },
    );
  }
}
