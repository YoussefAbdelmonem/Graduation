class PostModel
{
  String? name;
  String? age;
  String? gender;
  String? image;
  String? category;
  String? weight;
  String? price;
  String? shelterid;
  String? health;
  String? behavior;
  String? id;

  PostModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.image,
    required this.category,
    required this.weight,
    required this.price,
    required this.shelterid,
    required this.health,
    required this.behavior,
    this.id,

  });
  PostModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    image = json['image'];
    category = json['category'];
    weight = json['weight'];
    price= json['price'];
    shelterid= json['shelterid'];
    health= json['health'];
    behavior= json['behavior'];
    id = json['id'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'age': age,
      'gender':gender,
      'image':image,
      'category':category,
      'weight':weight,
      'price':price,
      'shelterid':shelterid,
      'health':health,
      'behavior':behavior,
      'id':id
      // 'userId':userId,
    };
  }
}