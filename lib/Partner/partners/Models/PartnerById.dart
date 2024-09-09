import 'package:afcooadminpanel/Core/utility.dart';

class PartnerbyIdModel {
  final int  id;
  final String  slug;
  final String  keysWord;
  final String  metaDescription;
  final String  name;
  final String  nameEn;
  final String  logo;
  final String  contract;
  final String  description;
  final String  descriptionEn;
  final String  address;
  final String  addressEn;
  final String  mobile;
  final String  whatsapp;
  final String  phone;
  final String  email;
  final int  cityId;
  final int  regionId;
  final String listSetting;
  final String  listSocial;
  final String  lng;
  final String  lat;
  final DateTime  createdDate;
  final int  isFeatured;
  final int  status;
  final int  userCreatedId;
  final int  sortAt;
  final int  cateId;
  final int  cateServiceId;
  final String  banner;

  PartnerbyIdModel(
      {
        required this.id,
        required this.slug,
        required this.keysWord,
        required this.metaDescription,
        required this.name,
        required this.nameEn,
        required this.logo,
        required this.contract,
        required this.description,
        required this.descriptionEn,
        required this.address,
        required this.addressEn,
        required this.mobile,
        required this.whatsapp,
        required this.phone,
        required this.email,
        required this.cityId,
        required this.regionId,
        required this.listSetting,
        required this.listSocial,
        required this.lng,
        required this.lat,
        required this.createdDate,
        required this.isFeatured,
        required this.status,
        required this.userCreatedId,
        required this.sortAt,
        required this.cateId,
        required this.cateServiceId,
        required this.banner});

  factory PartnerbyIdModel.fromJson(Map<String, dynamic> json) {
    return PartnerbyIdModel(
    id : Utility.getValue("int", json['id']),
    slug : Utility.getValue("String", json['slug']),
    keysWord : Utility.getValue("String",json['keys_word']),
    metaDescription :Utility.getValue("String", json['meta_description']),
    name : Utility.getValue("String",json['name']),
    nameEn : Utility.getValue("String",json['name_en']),
    logo : Utility.getValue("String",json['logo']),
    contract : Utility.getValue("String",json['contract']),
    description :Utility.getValue("String", json['description']),
    descriptionEn : Utility.getValue("String",json['description_en']),
    address :Utility.getValue("String", json['address']),
    addressEn :Utility.getValue("String", json['address_en']),
    mobile : Utility.getValue("String",json['mobile']),
    whatsapp : Utility.getValue("String",json['whatsapp']),
    phone :Utility.getValue("String", json['phone']),
    email :Utility.getValue("String", json['email']),
    cityId :Utility.getValue("int", json['city_id']),
    regionId : Utility.getValue("int",json['region_id']),
    listSetting :Utility.getValue("String", json['list_setting']),
    listSocial :Utility.getValue("String", json['list_social']),
    lng : Utility.getValue("String",json['lng']),
    lat : Utility.getValue("String",json['lat']),
    createdDate :json['created_date'],
    isFeatured : Utility.getValue("int",json['is_featured']),
    status : Utility.getValue("int",json['status']),
    userCreatedId :Utility.getValue("int", json['user_created_id']),
    sortAt : Utility.getValue("int",json['sort_at']),
    cateId :Utility.getValue("int", json['cate_id']),
    cateServiceId : Utility.getValue("int",json['cate_service_id']),
    banner : Utility.getValue("String",json['banner'],));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['keys_word'] = this.keysWord;
    data['meta_description'] = this.metaDescription;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['logo'] = this.logo;
    data['contract'] = this.contract;
    data['description'] = this.description;
    data['description_en'] = this.descriptionEn;
    data['address'] = this.address;
    data['address_en'] = this.addressEn;
    data['mobile'] = this.mobile;
    data['whatsapp'] = this.whatsapp;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['list_setting'] = this.listSetting;
    data['list_social'] = this.listSocial;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['created_date'] = this.createdDate;
    data['is_featured'] = this.isFeatured;
    data['status'] = this.status;
    data['user_created_id'] = this.userCreatedId;
    data['sort_at'] = this.sortAt;
    data['cate_id'] = this.cateId;
    data['cate_service_id'] = this.cateServiceId;
    data['banner'] = this.banner;
    return data;
  }
}