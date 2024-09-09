import 'package:afcooadminpanel/Core/utility.dart';

class DisCountCodeModel {
  final int id;
  final String name;
  final String startDate;
  final String endDate;
  final int discountType;
  final int discountValue;

  DisCountCodeModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.discountValue,
    required this.discountType,
  });

  factory DisCountCodeModel.fromJson(Map<String, dynamic> json) {
    return DisCountCodeModel(
      id: Utility.getValue("int", json['id']),
      name: Utility.getValue("String", json['name']),
      startDate: Utility.getValue("String", json['start_date']),
      endDate: Utility.getValue("String", json['end_date']),
      discountValue: Utility.getValue("int", json['discount_value']),
      discountType: Utility.getValue("int", json['discount_type']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['discount_value'] = this.discountValue;
    data['discount_type'] = this.discountType;

    return data;
  }
  static Map<String, dynamic> postToJson(DisCountCodeModel data) {
    final dy = data.toJson();
    return dy;
  }
  String toString() => name;
}
