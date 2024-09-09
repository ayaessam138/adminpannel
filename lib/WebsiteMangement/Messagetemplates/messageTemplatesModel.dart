import 'package:afcooadminpanel/Core/utility.dart';

class MessagetemplateModel {
  final int id;
  final String name;
  final String nameEn;
  final String emailMessagetitle;
  final String emailMessagetitle_En;

  MessagetemplateModel(
      {required this.id,
        required this.name,
        required this.nameEn,
        required this.emailMessagetitle,
        required this.emailMessagetitle_En});

  factory MessagetemplateModel.fromJson(Map<String, dynamic> json) {
    return MessagetemplateModel(
        id: Utility.getValue("int", json['id']),
        name: Utility.getValue("String", json['name']),
        nameEn: Utility.getValue("String", json['name_en']),
        emailMessagetitle: Utility.getValue("int", json['emailMessagetitle']),
        emailMessagetitle_En: Utility.getValue("int", json['emailMessagetitle_En']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['status'] = this.emailMessagetitle;
    data['sort_at'] = this.emailMessagetitle_En;
    return data;
  }
  String toString() => name ;

}
