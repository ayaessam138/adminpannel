import 'package:afcooadminpanel/Core/utility.dart';

class NationalityModel {
  final int id;
  final String name;
  final String nameEn;
  final int status;
  final int sortAt;

  NationalityModel(
      {required this.id,
        required this.name,
        required this.nameEn,
        required this.status,
        required this.sortAt});

  factory NationalityModel.fromJson(Map<String, dynamic> json) {
    return NationalityModel(
        id: Utility.getValue("int", json['id']),
        name: Utility.getValue("String", json['name']),
        nameEn: Utility.getValue("String", json['name_en']),
        status: Utility.getValue("int", json['status']),
        sortAt: Utility.getValue("int", json['sort_at']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['sort_at'] = this.sortAt;
    return data;
  }
  String toString() => name ;

}
