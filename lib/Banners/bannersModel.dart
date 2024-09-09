import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

class BannersModel {
  final int id;
  final String title;
  final String titleEn;
  final String url;
  final int status;
  final String image;
  final int Durantion;
  final int ShowinWebSite;
  final int ShowinApp;
  final int ItemOrder;

  BannersModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.url,
      required this.status,
      required this.image,
      required this.Durantion,
      required this.ShowinWebSite,
      required this.ShowinApp,
      required this.ItemOrder,

      });

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
        id: Utility.getValue("int", json['id']),
        title: Utility.getValue("String", json['title']),
        titleEn: Utility.getValue("String", json['titleEn']),
        url: Utility.getValue("String", json['url']),
        status: Utility.getValue("int", json['status']),
        Durantion: Utility.getValue("int", json['Durantion']),
        image: Utility.getValue("int", json['image']),
        ShowinWebSite: Utility.getValue("int", json['ShowinWebSite']),
        ItemOrder: Utility.getValue("int", json['ItemOrder']),
        ShowinApp: Utility.getValue("int", json['ShowinApp']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.title;
    data['titleEn'] = this.titleEn;
    data['url'] = this.url;
    data['status'] = this.status;
    data['image'] = this.image;
    data['Durantion'] = this.Durantion;
    data['ShowinWebSite'] = this.ShowinWebSite;
    data['ItemOrder'] = this.ItemOrder;
    data['ShowinApp'] = this.ShowinApp;
    return data;
  }

  static Map<String, dynamic> postToJson(BannersModel data) {
    var dy = data.toJson();
    return dy;
  }

  String toString() => title;
}

class AddBannersimage {
  Uint8List? image;

  AddBannersimage({
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

  static Map<String, dynamic> postToJson(AddBannersimage data) {
    var dy = data.toJson();
    return dy;
  }
}
