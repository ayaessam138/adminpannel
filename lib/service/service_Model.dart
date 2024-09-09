class ServiceModel {
  final int id;
  final String title;
  final String titleEn;
  final String image;
  final int sortAt;
  final int status;
  final bool isMedical;

  ServiceModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.image,
      required this.sortAt,
      required this.status,
      required this.isMedical});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      titleEn: json['title_en'],
      image: json['image'],
      sortAt: json['sort_at'],
      status: json['status'],
      isMedical: json['is_medical'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['image'] = this.image;
    data['sort_at'] = this.sortAt;
    data['status'] = this.status;
    data['is_medical'] = this.isMedical;
    return data;
  }

  @override
  String toString() => title;
}
