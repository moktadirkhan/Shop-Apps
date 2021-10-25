import 'package:shop_app/src/mockdata/product_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/category_model.dart';
import 'package:shop_app/src/models/product.dart';

class CategoryResponse {
  static List<CategoryModel> getDummyCategory() {
    List<Product>? mensProduct = ProductMockData.getMensProduct();
    List<Product>? womensProduct = ProductMockData.getWomensProduct();
    CategoryModel category1 = CategoryModel(
      categoryId: 1,
      catgoryName: "Gents",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      productList: mensProduct,
    );
    CategoryModel category2 = CategoryModel(
      categoryId: 2,
      catgoryName: "Ladies",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      productList: womensProduct,
    );
    // CategoryModel category3 = CategoryModel(
    //   categoryId: 3,
    //   catgoryName: "3Rafsan",
    //   categoryImageUrl:
    //       "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    //   productList: womensProduct,
    // );

    return [
      category1,
      category2,
      // category3,
    ];
  }
}

class AppdataResponse {
  static Appdata getDummyAppdata() {
    List<CategoryModel>? categoryList = CategoryResponse.getDummyCategory();
    Appdata appdata1 = Appdata(categoryList: categoryList);
    return appdata1;
  }
}
