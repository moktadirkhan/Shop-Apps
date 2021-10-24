import 'package:shop_app/src/mockdata/product_mock_data.dart';
import 'package:shop_app/src/models/category_model.dart';
import 'package:shop_app/src/models/product.dart';

class CategoryResponse {
  static List<CategoryModel> getDummyCategory() {
    List<Product> mensProduct = ProductMockData.getDummyProduct();
    List<Product> womensProduct = ProductMockData.getDummyProduct();
    CategoryModel category1 = CategoryModel(
      categoryId: 1,
      catgoryName: "Men",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      products: mensProduct,
    );
    CategoryModel category2 = CategoryModel(
      categoryId: 2,
      catgoryName: "Women",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      products: womensProduct,
    );

    return [
      category1,
      category2,
    ];
  }
}
