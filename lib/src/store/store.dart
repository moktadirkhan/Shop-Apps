import 'package:shop_app/src/mockdata/appdata_mock_data.dart';
import 'package:shop_app/src/mockdata/category_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/product.dart';

class Store {
  Appdata _appdata = Appdata();

  List<Product> productList = [];
  static Store _instance = Store();
  static Store get instance => _instance;

  Future<void> initStore() async {
    await _initAllDataAsync();
  }

  Future _initAllDataAsync() async {
    await _loadAppData();
  }

  Future<void> _loadAppData() async {
    _appdata = AppDataResponse.getAppData();
  }

  Appdata getAppData() {
    return _appdata;
  }

  List<Product> getAllProduct() {
    for (int i = 0; i < _appdata.categoryList!.length; i++) {
      for (int j = 0; j < _appdata.categoryList![i].productList!.length; j++) {
        productList.add(_appdata.categoryList![i].productList![j]);
      }
    }
    return productList;
  }
}
