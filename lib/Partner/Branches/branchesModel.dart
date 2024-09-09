import 'package:afcooadminpanel/Core/utility.dart';

class BranchesModel {
  final int id;
  final String partnername;
  final String name;
  final String nameEn;
  final int status;
  final String image;

  BranchesModel(
      {required this.id,
      required this.partnername,
        required this.name,
        required this.nameEn,
        required this.status,
        required this.image});

  factory BranchesModel.fromJson(Map<String, dynamic> json) {
    return BranchesModel(
        id: Utility.getValue("int", json['id']),
        partnername: Utility.getValue("String", json['id']),
        name: Utility.getValue("String", json['name']),
        nameEn: Utility.getValue("String", json['name_en']),
        status: Utility.getValue("int", json['status']),
        image: Utility.getValue("int", json['image']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partnername'] = this.partnername;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
  String toString() => name ;

}
