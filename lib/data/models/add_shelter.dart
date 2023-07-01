class AddPet
{
  String? name;
  String? age;
  String? image;
  String? category;
  String? gender;
  String? health;
  String? id;
  String? price;
  String? shelterid;
  String? weight;
  String? behavior;

  AddPet(
      {this.name,
      this.age,
      this.image,
      this.category,
      this.gender,
      this.health,
      this.id,
      this.price,
      this.shelterid,
      this.weight,
      this.behavior});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'image': image,
      'category': category,
      'gender': gender,
      'health': health,
      'id': id,
      'price': price,
      'shelterid': shelterid,
      'weight': weight,
      'behavior': behavior,
    };
  }

  factory AddPet.fromMap(Map<String, dynamic> map) {
    return AddPet(
      name: map['name'] ,
      age: map['age'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
      gender: map['gender'] as String,
      health: map['health'] as String,
      id: map['id'] as String,
      price: map['price'] as String,
      shelterid: map['shelterid'] as String,
      weight: map['weight'] as String,
      behavior: map['behavior'] as String,
    );
  }
}