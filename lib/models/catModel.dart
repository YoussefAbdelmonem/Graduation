class CatModel
{
  String? name;
  String? year;
  String? gender;
  String? catImage;
  //String? userId;
  String? id;

  CatModel({

    required this.name,
    required this.year,
    required this.catImage,
    required this.gender,
     this.id
   // required this.userId,
  });
  CatModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    year = json['year'];
    catImage = json['catImage'];
    gender = json['gender'];
     id = json['id'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'year': year,
      'catImage':catImage,
      'gender':gender,
      'id':id
     // 'userId':userId,
    };
  }
}