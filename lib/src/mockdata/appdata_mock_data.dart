import 'package:shop_app/src/mockdata/category_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/category_model.dart';

class AppDataResponse {
  static AppData getAppData() {
    List<CategoryModel> categories = CategoryResponse.getDummyCategory();
    AppData appData = AppData(
      categories: categories,
    );

    return appData;
  }
}
