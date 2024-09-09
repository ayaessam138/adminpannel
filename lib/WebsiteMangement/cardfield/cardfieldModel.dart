import 'dart:typed_data';

import 'package:dio/dio.dart';

class CardFieldModel {
  final int id;
  final String title;
  final String titleEn;
  final String image;
  final String icon;
  final int sortAt;
  final int status;
  final String content;
  final String contentEn;

  CardFieldModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.image,
      required this.icon,
      required this.sortAt,
      required this.status,
      required this.content,
      required this.contentEn});

  factory CardFieldModel.fromJson(Map<String, dynamic> json) {
    return CardFieldModel(
      id: json['id'],
      title: json['title'],
      titleEn: json['title_en'],
      image: json['image'],
      icon: json['icon'],
      sortAt: json['sort_at'],
      status: json['status'],
      content: json['content'],
      contentEn: json['content_en'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['sort_at'] = this.sortAt;
    data['status'] = this.status;
    data['content'] = this.content;
    data['content_en'] = this.contentEn;
    return data;
  }
  static Map<String, dynamic> postToJson(CardFieldModel data) {
    final dy = data.toJson();
    return dy;
  }
  String toString() => title;
}
class AddcardFieldimage{

  Uint8List? image;


  AddcardFieldimage({
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

  static Map<String, dynamic> postToJson(AddcardFieldimage data) {
    var dy = data.toJson();
    return dy;
  }
}