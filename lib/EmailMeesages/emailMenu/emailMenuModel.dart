import 'package:afcooadminpanel/Core/utility.dart';

class EmailMenuModel {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String companyName;
  final String emailGroup;
String? Message;
  EmailMenuModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.companyName,
    required this.emailGroup,
    this.Message
  });

  factory EmailMenuModel.fromJson(Map<String, dynamic> json) {
    return EmailMenuModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      email: Utility.getValue("String", json['email']),
      mobile: Utility.getValue("String", json['mobile']),
      companyName: Utility.getValue("int", json['companyName']),
      emailGroup: Utility.getValue("int", json['emailGroup']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;
    data['name_en'] = this.email;
    data['name_en'] = this.mobile;
    data['status'] = this.companyName;
    data['image'] = this.emailGroup;

    return data;
  }
  static Map<String, dynamic> postToJson(EmailMenuModel data) {
    final dy = data.toJson();
    return dy;
  }
  String toString() => name;
}


