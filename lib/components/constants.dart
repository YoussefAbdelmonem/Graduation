import 'dart:ui';

import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';

import '../getPosts/getCubit/model.dart';

String? uId;
List<Map<String,dynamic>> list=[];
String? ShelterId;
String translateEnd="api/";
bool reverse= false;
var audio=0;
int? userType;
List<ArticleModel>careList=[];
List<ArticleModel>diseaseList=[];
List<ArticleModel> sArticleModelResults=[];

List<PostModel> postModelsList = [];

// Set<ArticleModel> articleModelResultSet = {};
// Set<String>bodySet = {};
// Set<String> resultSet={};


const KPrimaryColor=Color(0xff274460);
const KLogo='assets/images/chat/img.png';
const KCollection='messages';
const KMessageField='message';
const KCreatedAt ='created at';
const KId ='id';
const KColorPrimary= Color(0xffA35638);