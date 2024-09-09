import 'package:afcooadminpanel/Core/utility.dart';

class CardModel {
  final int id;
  final String name;
  final String nameEn;
  final String code;
  final String image;
  final String cardImage;
  final int status;

  CardModel(
      {required this.id,
      required this.cardImage,
      required this.name,
      required this.nameEn,
      required this.code,
      required this.status,
      required this.image});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        id: Utility.getValue("int", json['id']),
        cardImage: Utility.getValue("String", json['image_card']),
        name: Utility.getValue("String", json['name']),
        nameEn: Utility.getValue("String", json['name_en']),
        status: Utility.getValue("int", json['status']),
        image: Utility.getValue("String", json['image']),
        code: Utility.getValue("String", json['code']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_card'] = this.cardImage;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['code'] = this.code;
    data['image'] = this.image;
    return data;
  }

  String toString() => name;
}
