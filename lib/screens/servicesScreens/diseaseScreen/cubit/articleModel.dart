import 'dart:ffi';

class ArticleModel
{
  int? views;
  String? title;
  String? body;
  int? likes;
  //String? userId;
  String? id;
  String?type;

  ArticleModel({

    required this.views,
    required this.title,
    required this.body,
    required this.likes,
    this.id,
    this.type
    // required this.userId,
  });
  ArticleModel.fromJson(Map<String,dynamic>json)
  {
    views = json['views'];
    title = json['title'];
    body = json['body'];
    likes = json['likes'];
    id = json['id'];
    type = json['type'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'views': views,
      'title': title,
      'body':body,
      'likes':likes,
      'id':id,
      'type':type
      // 'userId':userId,
    };
  }
}