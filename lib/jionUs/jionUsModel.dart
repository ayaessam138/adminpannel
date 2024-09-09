import 'package:afcooadminpanel/Core/utility.dart';

class JionUsModel {
  final int id;
  final String name;
  final String mobile;
  final String email;
  final String city;
  final String status;

  JionUsModel({
    required this.id,
    required this.name,
    required this.mobile,
    required this.city,
    required this.email,
    required this.status,
  });

  factory JionUsModel.fromJson(Map<String, dynamic> json) {
    return JionUsModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      mobile: Utility.getValue("String", json['name_en']),
      city: Utility.getValue("int", json['status']),
      email: Utility.getValue("int", json['image']),
      status: Utility.getValue("int", json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.mobile;
    data['status'] = this.city;
    data['image'] = this.email;

    return data;
  }

  String toString() => name;
}
