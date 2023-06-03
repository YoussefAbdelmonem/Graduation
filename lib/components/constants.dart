import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/articleModel.dart';

String? uId;
List<Map<String,dynamic>> list=[];
String? ShelterId;
String translateEnd="api/";
bool reverse= false;
var audio=0;
int? userType;
List<ArticleModel>careList=[];
Set<ArticleModel> articleModelResultSet = {};
Set<String>bodySet = {};
Set<String> resultSet={};