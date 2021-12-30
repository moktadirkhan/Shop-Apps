import 'package:shop_app/src/models/new/category.dart';

class Merchant {
  String? merchantId;
  String? merchantName;
  String? merchantRating;
  List<Category>? categories;

  Merchant({
    this.merchantId,
    this.merchantName,
    this.merchantRating,
    this.categories,
  });
}
