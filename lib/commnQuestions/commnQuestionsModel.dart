import 'package:afcooadminpanel/Core/utility.dart';

class CommnQuestionsModel {
  final int id;
  final String title;
  final String titleEn;
  final int status;
  final String Content;
  final String ContentEn;
  final int SortAt;

  CommnQuestionsModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.Content,
    required this.ContentEn,
    required this.SortAt,
    required this.status,
  });

  factory CommnQuestionsModel.fromJson(Map<String, dynamic> json) {
    return CommnQuestionsModel(
      id: Utility.getValue("int", json['id']),
      title: Utility.getValue("String", json['name']),
      titleEn: Utility.getValue("String", json['name_en']),
      Content: Utility.getValue("String", json['Content']),
      ContentEn: Utility.getValue("String", json['ContentEn']),
      SortAt: Utility.getValue("String", json['SortAt']),
      status: Utility.getValue("int", json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    data['name_en'] = this.titleEn;
    data['Content'] = this.Content;
    data['ContentEn'] = this.ContentEn;
    data['SortAt'] = this.SortAt;
    data['status'] = this.status;

    return data;
  }

  String toString() => title;
  static Map<String, dynamic> postToJson(CommnQuestionsModel data) {
    final dy = data.toJson();
    return dy;
  }
}
