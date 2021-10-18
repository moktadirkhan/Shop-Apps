import 'package:shop_app/src/models/category_model.dart';

class CategoryResponse {
  static List<CategoryModel> getDummyCategory() {
    CategoryModel category1 = CategoryModel(
      categoryId: 1,
      catgoryName: "Rafsan",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    );
    CategoryModel category2 = CategoryModel(
      categoryId: 2,
      catgoryName: "2Rafsan",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    );
    CategoryModel category3 = CategoryModel(
      categoryId: 3,
      catgoryName: "3Rafsan",
      categoryImageUrl:
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    );

    return [
      category1,
      category2,
      category3,
    ];
  }
}
