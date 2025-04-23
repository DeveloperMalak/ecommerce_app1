class CategoriesModel {
  List<Category>? categories;

  CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  List<String>? subcategories; // Corrected property name

  Category({this.name, this.subcategories});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subcategories = List<String>.from(json['subcategories'] ?? []); // Fixing typo mapping
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['subcategories'] = subcategories; // Keeping the original key name for JSON output
    return data;
  }
}
