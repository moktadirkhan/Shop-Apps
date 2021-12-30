import 'package:shop_app/src/models/new/product.dart';

class Category {
  String? categoryId;
  String? categoryName;
  List<Product>? products;
  Category({
    this.categoryId,
    this.categoryName,
    this.products,
  });
}
