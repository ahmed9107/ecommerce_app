class CategoryModel {
  String? id;
  String? name;
  String? nameAr;
  String? nameFr;
  String? image;

  CategoryModel(
      {this.id,
      this.name,
      this.nameAr,
      this.nameFr,
      this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id      = json['categories_id'];
    name    = json['categories_name'];
    nameAr  = json['categories_name_ar'];
    nameFr  = json['categories_name_fr'];
    image   = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id']       = id;
    data['categories_name']     = name;
    data['categories_name_ar']  = nameAr;
    data['categories_name_fr']  = nameFr;
    data['categories_image']    = image;
    return data;
  }
}