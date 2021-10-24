import 'package:shop_app/src/models/product.dart';

class CategoryModel {
  int? categoryId;
  String? catgoryName;
  String? categoryImageUrl;
  List<Product>? products;

  CategoryModel({
    this.categoryId,
    this.catgoryName,
    this.categoryImageUrl,
    this.products,
  });
}
