class ProductSubCategoryModel {
  bool? success;
  String? errorMsg;
  List<Categories>? categories;

  ProductSubCategoryModel({this.success, this.errorMsg, this.categories});

  ProductSubCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMsg'] = this.errorMsg;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  int? mainCategoryId;
  String? subCategory;
  String? status;
  String? imageName;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.mainCategoryId,
      this.subCategory,
      this.status,
      this.imageName,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategoryId = json['main_category_id'];
    subCategory = json['sub_category'];
    status = json['status'];
    imageName = json['image_name'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_category_id'] = this.mainCategoryId;
    data['sub_category'] = this.subCategory;
    data['status'] = this.status;
    data['image_name'] = this.imageName;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}