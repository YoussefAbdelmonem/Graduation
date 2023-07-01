class OrderModel
{
  String? petname;
  String? petage;
  String? petgender;
  String? petimage;
  String? petcategory;
  String? petweight;
  String? name;
  String? phone;
  String? addressDetails;
  String? address;
  String? postid;
  String? id;

  OrderModel({
    required this.petname,
    required this.petage,
    required this.petgender,
    required this.petimage,
    required this.petcategory,
    required this.petweight,
    required this.name,
    required this.phone,
    required this.addressDetails,
    required this.address,
    this.postid,
    this.id,

  });
  OrderModel.fromJson(Map<String,dynamic>json)
  {
    petname = json['petname'];
    petage = json['petage'];
    petgender = json['petgender'];
    petimage = json['petimage'];
    petcategory = json['petcategory'];
    petweight = json['petweight'];
    name= json['name'];
    phone= json['phone'];
    addressDetails= json['addressDetails'];
    address= json['address'];
    postid = json['postid'];
    id = json['id'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'petname': petname,
      'petage': petage,
      'petgender':petgender,
      'petimage':petimage,
      'petcategory':petcategory,
      'petweight':petweight,
      'name':name,
      'phone':phone,
      'addressDetails':addressDetails,
      'address':address,
      'postid':postid,
      'id':id
      // 'userId':userId,
    };
  }
}