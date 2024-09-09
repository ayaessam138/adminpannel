import 'package:afcooadminpanel/Core/utility.dart';

class MangersModel {
  final String name;
  final int id;
  final String userName;
  final String mobile;
  final String email;
  final String image;
  final String status;
  final String userType;
  final String CreatedAt;
  final String title;
  String? password;
  String? confirmPassword;

  MangersModel(
      {required this.name,
      required this.userName,
      required this.id,
      required this.mobile,
      required this.email,
      required this.image,
      required this.status,
      required this.userType,
      required this.CreatedAt,
      required this.title,
      this.password,
      this.confirmPassword});

  factory MangersModel.fromJson(Map<String, dynamic> json) {
    return MangersModel(
      name: Utility.getValue("String", json['name']),
      userName: Utility.getValue("int", json['status']),
      id: Utility.getValue("int", json['status']),
      mobile: Utility.getValue("String", json['name_en']),
      email: Utility.getValue("int", json['image']),
      image: Utility.getValue("int", json['id']),
      status: Utility.getValue("int", json['image']),
      title: Utility.getValue("String", json['title']),
      userType: Utility.getValue("String", json['name_en']),
      CreatedAt: Utility.getValue("String", json['name_en']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.userName;
    data['name_en'] = this.mobile;
    data['image'] = this.email;
    data['id'] = this.image;
    data['id'] = this.status;
    data['id'] = this.userType;
    data['id'] = this.CreatedAt;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['title'] = this.title;

    return data;
  }

  static Map<String, dynamic> postToJson(MangersModel data) {
    final dy = data.toJson();
    return dy;
  }

  String toString() => name;
}
