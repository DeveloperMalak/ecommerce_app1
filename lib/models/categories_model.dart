class CatergoriesModel {
  List<Categories>? categories;

  CatergoriesModel({this.categories});

  CatergoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;
  List<String>? subcategoreis;

  Categories({this.name, this.subcategoreis});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subcategoreis = json['subcategoreis'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subcategoreis'] = this.subcategoreis;
    return data;
  }
}
