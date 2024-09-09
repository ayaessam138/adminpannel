import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';


class AddOfferimage{

  Uint8List? image;


  AddOfferimage({
    required this.image,

  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};


    if (image != null) {
      data['image'] = MultipartFile.fromBytes(
        image!,
        filename: 'image.png',
      );
    }

    return data;
  }

  static Map<String, dynamic> postToJson(AddOfferimage data) {
    var dy = data.toJson();
    return dy;
  }
}