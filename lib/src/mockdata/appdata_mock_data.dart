import 'package:shop_app/src/mockdata/category_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/category_model.dart';

class AppDataResponse {
  static Appdata getAppData() {
    List<CategoryModel> categories = CategoryResponse.getDummyCategory();
    Appdata appData = Appdata(
      categoryList: categories,
    );

    return appData;
  }
}
