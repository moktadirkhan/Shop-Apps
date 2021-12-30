import 'package:shop_app/src/models/new/product.dart';

class ListItem {
  ListItemType? itemType;
  Product? product;

  ListItem({
    this.product,
  });
}

enum ListItemType {
  HOME_PAGE_PRODUCT,
  MERCHANT_PAGE_PRODUCT,
}
