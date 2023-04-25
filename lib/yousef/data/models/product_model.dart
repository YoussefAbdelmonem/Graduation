import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? name;
  String? image;
  String? id;
  String? price;
  String? details;
  ProductModel({
    this.name,
    this.image,
    this.id,

    this.price,
    this.details,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'id': id,
      'price': price,
      'details': details,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
