import 'package:afcooadminpanel/Core/utility.dart';

class CustomersModel {
  final int id;
  final String status;
  final String name;
  String? username;
  String? password;
  String? confirmPassword;
   int identity;
  final String mobile;
  final String email;
  String? title;
  String? Nationailty;
  int? Gender;
  String? BirthDate;
  String? Description;
  String? AccountStatus;

  CustomersModel(
      {required this.id,
      required this.status,
      required this.name,
      required this.username,
      required this.password,
      required this.confirmPassword,
      required this.identity,
      required this.mobile,
      required this.email,
      required this.title,
      required this.Nationailty,
      required this.Gender,
      required this.BirthDate,
      required this.Description,
      required this.AccountStatus});

  factory CustomersModel.fromJson(Map<String, dynamic> json) {
    return CustomersModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      status: Utility.getValue("String", json['status']),
      mobile: Utility.getValue("String", json['mobile']),
      identity: Utility.getValue("int", json['identity']),
      email: Utility.getValue("int", json['email']),
      username:  Utility.getValue("String", json['mobile']),
      password:  Utility.getValue("String", json['mobile']),
      confirmPassword:  Utility.getValue("String", json['mobile']),
      title: Utility.getValue("String", json['mobile']),
      Nationailty:  Utility.getValue("String", json['mobile']),
      Gender:  Utility.getValue("int", json['mobile']),
      BirthDate:  Utility.getValue("String", json['mobile']),
      Description:  Utility.getValue("String", json['mobile']),
      AccountStatus: Utility.getValue("int", json['mobile']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;
    data['name_en'] = this.status;
    data['name_en'] = this.mobile;
    data['status'] = this.identity;
    data['image'] = this.email;

    return data;
  }

  String toString() => name;
}
