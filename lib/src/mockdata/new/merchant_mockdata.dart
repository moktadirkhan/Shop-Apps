import 'package:shop_app/src/mockdata/new/category_mockdata.dart';
import 'package:shop_app/src/models/new/merchant.dart';

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
