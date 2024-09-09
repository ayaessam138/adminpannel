import 'package:afcooadminpanel/Core/utility.dart';

class OffersModel {
  final int id;
   int ?partnerId;
   String? partnername;
  final String name;
  final String nameEn;
  String? description;
   String? descriptionEn;
  final int status;
   String ?image;

  OffersModel(
      {required this.id,
           this.partnername,
      required this.name,
      required this.nameEn,
      this.description,
      this.partnerId,
      this.descriptionEn,
      required this.status,
       this.image});

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
        id: Utility.getValue("int", json['id']),
        partnername: Utility.getValue("String", json['partner_name']),
        partnerId: Utility.getValue("int", json['partnerId']),
        name: Utility.getValue("String", json['name']),
        nameEn: Utility.getValue("String", json['name_en']),
        description: Utility.getValue("String", json['description']),
        descriptionEn: Utility.getValue("String", json['description_en']),
        status: Utility.getValue("int", json['status']),
        image: Utility.getValue("String", json['image']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partnername'] = this.partnername;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['description'] = this.description;
    data['descriptionEn'] = this.descriptionEn;
    data['partnerId'] = this.partnerId;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }

  String toString() => name;
  static Map<String, dynamic> postToJson(OffersModel data) {
    var dy = data.toJson();
    return dy;
  }
}
