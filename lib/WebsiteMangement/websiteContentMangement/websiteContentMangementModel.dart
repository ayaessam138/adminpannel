import 'dart:typed_data';

import 'package:dio/dio.dart';

class WebsiteContentMangementModel {
  final int id;
  final String title;
  final String titleEn;
  final String image;
  final String Showinpage;
  final String content;
  final String contentEn;

  WebsiteContentMangementModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.image,
    required this.Showinpage,
    required this.content,
    required this.contentEn,
  });

  factory WebsiteContentMangementModel.fromJson(Map<String, dynamic> json) {
    return WebsiteContentMangementModel(
      id: json['id'],
      title: json['title'],
      titleEn: json['title_en'],
      image: json['image'],
      Showinpage: json['Showinpage'],
      content: json['Showinpage'],
      contentEn: json['Showinpage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['image'] = this.image;
    data['content'] = this.Showinpage;

    return data;
  }
  static Map<String, dynamic> postToJson(WebsiteContentMangementModel data) {
    var dy = data.toJson();
    return dy;
  }
  String toString() => title;
}
class AddWebsiteContentMangementModel {
  final int id;
  final String title;
  final String titleEn;

  final String content;
  final String contentEn;

  AddWebsiteContentMangementModel({
    required this.id,
    required this.title,
    required this.titleEn,

    required this.content,
    required this.contentEn,
  });

  factory AddWebsiteContentMangementModel.fromJson(Map<String, dynamic> json) {
    return AddWebsiteContentMangementModel(
      id: json['id'],
      title: json['title'],
      titleEn: json['title_en'],

      content: json['Showinpage'],
      contentEn: json['Showinpage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;


    return data;
  }
  static Map<String, dynamic> postToJson(AddWebsiteContentMangementModel data) {
    var dy = data.toJson();
    return dy;
  }
  String toString() => title;
}
class AddWebsiteContentMangementimage{

  Uint8List? image;


  AddWebsiteContentMangementimage({
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

  static Map<String, dynamic> postToJson(AddWebsiteContentMangementimage data) {
    var dy = data.toJson();
    return dy;
  }
}