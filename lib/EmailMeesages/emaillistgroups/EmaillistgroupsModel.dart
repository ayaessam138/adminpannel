import 'package:afcooadminpanel/Core/utility.dart';

class EmailListGrpoupModel {
  final int id;
  final String Groupname;

  EmailListGrpoupModel({
    required this.id,
    required this.Groupname,
  });

  factory EmailListGrpoupModel.fromJson(Map<String, dynamic> json) {
    return EmailListGrpoupModel(
      id: Utility.getValue("int", json['id']),
      Groupname: Utility.getValue("String", json['Groupname']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.Groupname;

    return data;
  }
  static Map<String, dynamic> postToJson(EmailListGrpoupModel data) {
    final dy = data.toJson();
    return dy;
  }
  String toString() => Groupname;
}
