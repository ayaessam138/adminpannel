import 'package:afcooadminpanel/Core/utility.dart';

class CityModel {
   int id;
   String name;
   String nameEn;
   int status;
   int sortAt;
  int regionId;

  CityModel(
      {required this.id,
      required this.name,
      required this.nameEn,
      required this.status,
      required this.sortAt,
      required this.regionId});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      nameEn: Utility.getValue("String", json['name_en']),
      status: Utility.getValue("int", json['status']),
      sortAt: Utility.getValue("int", json['sort_at']),
      regionId: Utility.getValue("int", json['region_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['sort_at'] = this.sortAt;
    data['region_id'] = this.regionId;
    return data;
  }
  static Map<String, dynamic> postToJson(CityModel data) {
    final dy = data.toJson();
    return dy;
  }
  @override
  String toString() => name;

}
