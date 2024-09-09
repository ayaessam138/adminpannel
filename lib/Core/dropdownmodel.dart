
import 'package:afcooadminpanel/Core/utility.dart';


class DDCodeListModel {

  String v ;
  String d;


  DDCodeListModel({
    required this.v ,
    required this.d,
  });

  factory DDCodeListModel.fromJson(Map<String, dynamic> json) {
    return DDCodeListModel(
      v : Utility.getValue("String", json['v']),
      d: Utility.getValue("String", json['d']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = v ;
    data['d'] = d;
    return data;
  }

  static Map<String, dynamic> postToJson(DDCodeListModel data) {
    final dy = data.toJson();
    return dy;
  }

  bool isEqual(DDCodeListModel? model) {
    return this.v == model?.v;
  }

  @override
  String toString() => d;
}
