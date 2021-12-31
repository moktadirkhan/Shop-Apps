import 'package:shop_app/src/mockdata/category_mockdata.dart';
import 'package:shop_app/src/models/merchant.dart';

Merchant merchant1 = Merchant(
  merchantId: "aarong",
  merchantName: "aarong",
  categories: categories,
);

Merchant merchant2 = Merchant(
  merchantId: "bata",
  merchantName: "bata",
  categories: categories,
);

List<Merchant> feed = [merchant1, merchant2];
