import 'dart:collection';

import 'package:shop_app/src/mockdata/appdata_mock_data.dart';
import 'package:shop_app/src/mockdata/category_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/store/hive_db.dart';

class Store {
  Appdata _appdata = Appdata();

  List<Product> productList = [];
  List<Product> cartItemList = [];
  static Store _instance = Store();
  static Store get instance => _instance;

  Future<void> initStore() async {
    await _initAllDataAsync();
    await _loadCartData();
  }

  Future _initAllDataAsync() async {
    await _loadAppData();
  }

  Future<void> _loadAppData() async {
    _appdata = AppDataResponse.getAppData();
  }

  Future _loadCartData() async {
    cartItemList = await HiveDB.getCartData();
  }

  Appdata getAppData() {
    return _appdata;
  }

  // to load all cart items
  List<Product> getCartData() {
    return UnmodifiableListView(cartItemList);
  }

  List<Product> getAllProduct() {
    for (int i = 0; i < _appdata.categoryList!.length; i++) {
      for (int j = 0; j < _appdata.categoryList![i].productList!.length; j++) {
        productList.add(_appdata.categoryList![i].productList![j]);
      }
    }
    return productList;
  }

  // utility functions: set single item and remove single item
  void setSingleItemInCart(Product pro) async {
    cartItemList.add(pro);
    await HiveDB.setCartData(cartItemList);
  }

  void deleteSingleItemFromCart(int index) async {
    cartItemList.removeAt(index);
    await HiveDB.setCartData(cartItemList);
  }
}
