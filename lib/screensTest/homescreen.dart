// import 'dart:convert';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:http/http.dart' as http;
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   User? user=FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//             onTap: ()async{
//               // await login();
//             },
//       child: Text('login',style: TextStyle(fontSize: 30,color: Colors.black),)),
//           SizedBox(
//             height: 30,
//           ),
//           InkWell(
//             onTap: ()async{
//               await logOut();
//             },
//               child: Text('logout',style: TextStyle(fontSize: 30,color: Colors.black),)),
//           SizedBox(
//             height: 30,
//           ),
//           Text(user==null?'null':user!.email!,style: TextStyle(fontSize: 30,color: Colors.black),),
//         ],
//       ),
//     );
//   }
//
//
//   Future<void> logOut()async{
//     await FirebaseAuth.instance.signOut();
//   }
// }
