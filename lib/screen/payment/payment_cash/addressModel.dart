class AddressModel
{
  String? name;
  String? phone;
  String? addressDetails;
  String? address;
  //String? userId;
  String? id;
  AddressModel({

    required this.name,
    required this.phone,
    required this.addressDetails,
    required this.address,
    this.id
    // required this.userId,
  });
  AddressModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    phone = json['phone'];
    addressDetails = json['addressDetails'];
    address = json['address'];
    id = json['id'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'phone': phone,
      'addressDetails':addressDetails,
      'address':address,
      'id':id
      // 'userId':userId,
    };
  }
}