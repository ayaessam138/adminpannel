import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

class PagesModel {
  final int id;
  final String title;
  final String titleEn;
  final String content;
  final String contentEn;
  final String slug;
   String? createdAt;
  final int status;

  PagesModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.content,
    required this.contentEn,
    required this.slug,
     this.createdAt,
    required this.status,
  });

  factory PagesModel.fromJson(Map<String, dynamic> json) {
    return PagesModel(
      id: Utility.getValue("int", json['id']),
      title: Utility.getValue("String", json['name']),
      titleEn: Utility.getValue("String", json['name_en']),
      content: Utility.getValue("String", json['content']),
      contentEn: Utility.getValue("String", json['name_en']),
      slug: Utility.getValue("String", json['slug']),
      createdAt: Utility.getValue("String", json['contentEn']),
      status: Utility.getValue("int", json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    data['name_en'] = this.titleEn;
    data['content'] = this.content;
    data['contentEn'] = this.contentEn;
    data['name_en'] = this.createdAt;
    data['status'] = this.status;

    return data;
  }
  static Map<String, dynamic> postToJson(PagesModel data) {
    final dy = data.toJson();
    return dy;
  }
  String toString() => title;
}
class AddPagesimage {
  Uint8List? image;

  AddPagesimage({
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

  static Map<String, dynamic> postToJson(AddPagesimage data) {
    var dy = data.toJson();
    return dy;
  }
}