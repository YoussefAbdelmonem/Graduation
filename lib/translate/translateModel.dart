import 'package:flutter/foundation.dart';

class TranslateModel {
  String? translation;

  TranslateModel({ this.translation});

   TranslateModel.fromJson(Map<String, dynamic> json) {
    translation = json['Translation'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Translation'] = this.translation;
    return data;
  }
}