import 'package:afcooadminpanel/Core/utility.dart';

class ContactUsModel {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String city;
  final String ceratedAt;
  final String status;

  ContactUsModel({
    required this.id,
    required this.name,
    required this.ceratedAt,
    required this.mobile,
    required this.city,
    required this.email,
    required this.status,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      ceratedAt: Utility.getValue("String", json['ceratedAt']),
      mobile: Utility.getValue("String", json['mobile']),
      city: Utility.getValue("int", json['city']),
      email: Utility.getValue("int", json['email']),
      status: Utility.getValue("int", json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ceratedAt'] = this.ceratedAt;
    data['mobile'] = this.mobile;
    data['city'] = this.city;
    data['email'] = this.email;
    data['status'] = this.status;

    return data;
  }

  String toString() => name;
}
