import 'package:flutter/material.dart';
class CatList
{
  String? name;
  String? year;
  String? gender;
  String? catImage;
  String? userId;


  CatList({

    required this.name,
    required this.year,
    required this.catImage,
    required this.gender,
    required this.userId,
  });
  CatList.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    year = json['year'];
    catImage = json['catImage'];
    gender = json['gender'];
    userId = json['userId'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'year': year,
      'catImage':catImage,
      'gender':gender,
      'userId':userId,
    };
  }
}