class ReportModel
{
  String? type;
  String? phone;
  String? addressDetails;
  String? city;
  String? email;
  String? id;
  ReportModel({

    required this.type,
    required this.phone,
    required this.addressDetails,
    required this.city,
    required this.email,
    this.id
  });
  ReportModel.fromJson(Map<String,dynamic>json)
  {
    type = json['type'];
    phone = json['phone'];
    addressDetails = json['addressDetails'];
    city = json['city'];
    email = json['email'];
    id = json['id'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'type': type,
      'phone': phone,
      'addressDetails':addressDetails,
      'city':city,
      'email':email,
      'id':id
      // 'userId':userId,
    };
  }
}