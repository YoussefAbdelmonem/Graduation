import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/screens/userReport/cubit/reportStates.dart';
class ReportCubit extends Cubit<ReportStates>
{
  ReportCubit(): super(ReportInitialState());
  static ReportCubit get(context) => BlocProvider.of(context);


  Stream<QuerySnapshot> getReports () {return FirebaseFirestore.instance.collection('reports').snapshots();}
  Stream<QuerySnapshot> getPets () {return FirebaseFirestore.instance.collection('posts').doc(ShelterId).collection("posts").snapshots();}

}