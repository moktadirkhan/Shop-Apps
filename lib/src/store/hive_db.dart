import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/src/models/product.dart';

class HiveDB {
  static const HIVE_DB_NAME = "Hive_DB";
  static const CART_DATA_KEY = 'cartData';

  static Future<List<Product>> getCartData() async {
    var box = Hive.box(HIVE_DB_NAME);
    List<Product> products = [];
    String data = await box.get(CART_DATA_KEY, defaultValue: "");
    if (data == "") {
      return products;
    } else {
      products = List<Product>.from(
        json.decode(data).map((x) => Product.fromJson(x)),
      );
    }
    return products;
  }

  static Future<void> setCartData(List<Product> products) async {
    var box = Hive.box(HIVE_DB_NAME);
    String jsonData = json.encode(
      List<dynamic>.from(
        products.map(
          (e) => e.toJson(),
        ),
      ),
    );
  }

  static Future<void> deleteAllData() async {
    var box = Hive.box(HIVE_DB_NAME);
    box.clear();
    print("THE ENTIRE DB WAS RAFSANED");
  }
}
