import 'dart:typed_data';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

// class PartnerModel {
//   final int id;
//   final String name;
//   final String name_en;
//   final String slug;
//   final String cate_name;
//   final int status;
//   // final int sort_at;
//   final int branches_num;
//   final int offer_num;
//   final int services_num;
//
//   PartnerModel(
//       {required this.id,
//       required this.name,
//       required this.slug,
//       required this.cate_name,
//       required this.name_en,
//       required this.status,
//       // required this.sort_at,
//       required this.branches_num,
//       required this.offer_num,
//       required this.services_num});
//
//   factory PartnerModel.fromJson(Map<String, dynamic> json) {
//     return PartnerModel(
//       id: Utility.getValue("int", json["id"]),
//       name: Utility.getValue("String", json["name"]),
//       slug: Utility.getValue("String", json["slug"]),
//       cate_name: Utility.getValue("String", json["cate_name"]),
//       name_en: Utility.getValue("String", json["name_en"]),
//       status: Utility.getValue("int", json["status"]),
//
//       branches_num: Utility.getValue("String", json["branches_num"]),
//       offer_num: Utility.getValue("String", json["offer_num"]),
//       services_num: Utility.getValue("String", json["services_num"]),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['name_en'] = name_en;
//     data['slug'] = slug;
//     data['cate_name'] = cate_name;
//     data['status'] = status;
//     // data['sort_at'] = sort_at;
//     data['branches_num'] = branches_num;
//     data['offer_num'] = offer_num;
//     data['services_num'] = services_num;
//     return data;
//   }
// }
class PartnerModel {
  final int? id;
  final String? name;
  final String? name_en;
  final String? slug;
  final String? cate_name;
  final int? status;
  final int? branches_num;
  final int? offer_num;
  final int? services_num;

  // Additional properties from PartnerbyIdModel
  final String? keysWord;
  final String? metaDescription;
  final String? logo;
  final String? contract;
  final String? description;
  final String? descriptionEn;
  final String? address;
  final String? addressEn;
  final String? mobile;
  final String? whatsapp;
  final String? phone;
  final String? email;
  final int? cityId;
  final int? regionId;
  final String? listSetting;
  final String? listSocial;
  final String? lng;
  final String? lat;
  final String? createdDate;
  final int? isFeatured;
  final int? userCreatedId;
  final int? sortAt;
  final int? cateId;
  final int? cateServiceId;
  final String? banner;
  final String? Servicename;
  final String? ServicenameEn;
  final String? discountPercent;
  final String? price;
  final String? discountPrice;
  final String? itemorder;


  PartnerModel({
    this.id,
    this.name,
    this.slug,
    this.cate_name,
    this.name_en,
    this.status,
    this.branches_num,
    this.offer_num,
    this.services_num,
    // Properties from PartnerbyIdModel
    this.keysWord,
    this.metaDescription,
    this.logo,
    this.contract,
    this.description,
    this.descriptionEn,
    this.address,
    this.addressEn,
    this.mobile,
    this.whatsapp,
    this.phone,
    this.email,
    this.cityId,
    this.regionId,
    this.listSetting,
    this.listSocial,
    this.lng,
    this.lat,
    this.createdDate,
    this.isFeatured,
    this.userCreatedId,
    this.sortAt,
    this.cateId,
    this.cateServiceId,
    this.banner,
    this.Servicename,
    this.ServicenameEn,
    this.discountPercent,
    this.price,
    this.discountPrice,
    this.itemorder,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      id: Utility.getValue("int", json["id"]),
      name: Utility.getValue("String", json["name"]),
      slug: Utility.getValue("String", json["slug"]),
      cate_name: Utility.getValue("String", json["cate_name"]),
      name_en: Utility.getValue("String", json["name_en"]),
      status: Utility.getValue("int", json["status"]),
      branches_num: Utility.getValue("int", json["branches_num"]),
      offer_num: Utility.getValue("int", json["offer_num"]),
      services_num: Utility.getValue("int", json["services_num"]),
      // Properties from PartnerbyIdModel
      keysWord: Utility.getValue("String", json['keys_word']),
      metaDescription: Utility.getValue("String", json['meta_description']),
      logo: Utility.getValue("String", json['logo']),
      contract: Utility.getValue("String", json['contract']),
      description: Utility.getValue("String", json['description']),
      descriptionEn: Utility.getValue("String", json['description_en']),
      address: Utility.getValue("String", json['address']),
      addressEn: Utility.getValue("String", json['address_en']),
      mobile: Utility.getValue("String", json['mobile']),
      whatsapp: Utility.getValue("String", json['whatsapp']),
      phone: Utility.getValue("String", json['phone']),
      email: Utility.getValue("String", json['email']),
      cityId: Utility.getValue("int", json['city_id']),
      regionId: Utility.getValue("int", json['region_id']),
      listSetting: Utility.getValue("String", json['list_setting']),
      listSocial: Utility.getValue("String", json['list_social']),
      lng: Utility.getValue("String", json['lng']),
      lat: Utility.getValue("String", json['lat']),
      createdDate: json['created_date'],
      isFeatured: Utility.getValue("int", json['is_featured']),
      userCreatedId: Utility.getValue("int", json['user_created_id']),
      sortAt: Utility.getValue("int", json['sort_at']),
      cateId: Utility.getValue("int", json['cate_id']),
      cateServiceId: Utility.getValue("int", json['cate_service_id']),
      banner: Utility.getValue("String", json['banner']),
      Servicename: Utility.getValue("String", json['banner']),
      ServicenameEn: Utility.getValue("String", json['banner']),
      discountPercent: Utility.getValue("String", json['banner']),
      price: Utility.getValue("String", json['banner']),
      discountPrice: Utility.getValue("String", json['banner']),
      itemorder: Utility.getValue("String", json['banner']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['name_en'] = name_en;
    data['slug'] = slug;
    data['cate_name'] = cate_name;
    data['status'] = status;
    data['branches_num'] = branches_num;
    data['offer_num'] = offer_num;
    data['services_num'] = services_num;
    // Properties from PartnerbyIdModel
    data['keys_word'] = keysWord;
    data['meta_description'] = metaDescription;
    data['logo'] = logo;
    data['contract'] = contract;
    data['description'] = description;
    data['description_en'] = descriptionEn;
    data['address'] = address;
    data['address_en'] = addressEn;
    data['mobile'] = mobile;
    data['whatsapp'] = whatsapp;
    data['phone'] = phone;
    data['email'] = email;
    data['city_id'] = cityId;
    data['region_id'] = regionId;
    data['list_setting'] = listSetting;
    data['list_social'] = listSocial;
    data['lng'] = lng;
    data['lat'] = lat;
    data['created_date'] = createdDate;
    data['is_featured'] = isFeatured;
    data['user_created_id'] = userCreatedId;
    data['sort_at'] = sortAt;
    data['cate_id'] = cateId;
    data['cate_service_id'] = cateServiceId;
    data['banner'] = banner;
    data['banner'] = ServicenameEn;
    data['banner'] = Servicename;
    data['banner'] = discountPercent;
    data['banner'] = discountPrice;
    data['banner'] = price;
    data['banner'] = itemorder;
    return data;
  }

  static Map<String, dynamic> postToJson(PartnerModel data) {
    var dy = data.toJson();
    return dy;
  }
}


class AddPartnerimage{

  Uint8List? image;


  AddPartnerimage({
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

  static Map<String, dynamic> postToJson(AddPartnerimage data) {
    var dy = data.toJson();
    return dy;
  }
}