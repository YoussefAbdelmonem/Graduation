import 'dart:convert';

class AddProductModel
{
  String? name;
  String? image;
  String? price;
  bool ? cart;
  bool ? favorite;
  AddProductModel({
    this.name,
    this.image,
    this.price,
    this.cart,
    this.favorite

  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'cart': cart,
      'favorite': favorite,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as String,
      cart: map['cart'] as bool,
      favorite: map['favorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductModel.fromJson(String source) =>
      AddProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}