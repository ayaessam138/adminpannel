import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

class FeaturesModel {
  final int id;
  final String title;
  final String titleEn;
  final String Content;
  final String ContentEn;
  final int status;
  final int SortAt;
  String? image;

  FeaturesModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.Content,
      required this.ContentEn,
      required this.status,
      required this.SortAt,
      this.image});

  factory FeaturesModel.fromJson(Map<String, dynamic> json) {
    return FeaturesModel(
        id: Utility.getValue("int", json['id']),
        title: Utility.getValue("String", json['title']),
        titleEn: Utility.getValue("String", json['titleEn']),
        Content: Utility.getValue("String", json['Content']),
        ContentEn: Utility.getValue("String", json['ContentEn']),
        status: Utility.getValue("int", json['status']),
        SortAt: Utility.getValue("int", json['SortAt']),
        image: Utility.getValue("int", json['image']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['titleEn'] = this.titleEn;
    data['Content'] = this.Content;
    data['ContentEn'] = this.ContentEn;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }

  String toString() => title;
  static Map<String, dynamic> postToJson(FeaturesModel data) {
    final dy = data.toJson();
    return dy;
  }
}

class AddFeaturesimage {
  Uint8List? image;

  AddFeaturesimage({
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

  static Map<String, dynamic> postToJson(AddFeaturesimage data) {
    var dy = data.toJson();
    return dy;
  }
}
