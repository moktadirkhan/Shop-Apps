import 'package:shop_app/src/mockdata/product_mockdata.dart';
import 'package:shop_app/src/models/new/category.dart';

Category category1 = Category(
  categoryId: "cat1",
  categoryName: "Category 1",
  products: aarongList,
);

Category category2 = Category(
  categoryId: "cat2",
  categoryName: "Category 2",
  products: bataList,
);

List<Category> categories = [category1, category2];
