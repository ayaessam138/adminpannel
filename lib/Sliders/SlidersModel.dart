import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

class SliderModel {
  final int id;
  final String title;
  final String titleEn;
  final String content;
  final String contentEn;
  final String url;
  final int status;
  final String image;

  SliderModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.content,
      required this.contentEn,
      required this.url,
      required this.status,
      required this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
        id: Utility.getValue("int", json['id']),
        title: Utility.getValue("String", json['title']),
        titleEn: Utility.getValue("String", json['titleEn']),
        content: Utility.getValue("String", json['content']),
        contentEn: Utility.getValue("String", json['contentEn']),
        url: Utility.getValue("String", json['url']),
        status: Utility.getValue("int", json['status']),
        image: Utility.getValue("int", json['image']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.title;
    data['name_en'] = this.titleEn;
    data['name_en'] = this.url;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }

  static Map<String, dynamic> postToJson(SliderModel data) {
    var dy = data.toJson();
    return dy;
  }
  String toString() => title;
}


class AddSlidersimage{

  Uint8List? image;


  AddSlidersimage({
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

  static Map<String, dynamic> postToJson(AddSlidersimage data) {
    var dy = data.toJson();
    return dy;
  }
}