class CategoryModel {
  int? id;
  String? categoryName;
  String? categoryImage;
  String? slug;
  String? seoTitle;
  String? seoDesc;
  String? seoKeyword;

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    categoryName = json['Category_Name'] ?? '';
    categoryImage = json['Category_Image'] ?? '';
    slug = json['slug'] ?? '';
    seoTitle = json['seo_title'] ?? '';
    seoDesc = json['seo_desc'] ?? '';
    seoKeyword = json['seo_keyword'] ?? '';
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['Category_Name'] = this.categoryName;
  //   data['Category_Image'] = this.categoryImage;
  //   data['slug'] = this.slug;
  //   data['seo_title'] = this.seoTitle;
  //   data['seo_desc'] = this.seoDesc;
  //   data['seo_keyword'] = this.seoKeyword;
  //   return data;
  // }
}
