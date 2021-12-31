import 'package:shop_app/src/models/product.dart';

class GridItem {
  GridItemType? itemType;
  Product? product;

  GridItem({
    this.itemType,
    this.product,
  });
}

enum GridItemType {
  HOME_PRODUCT_GRID,
  MERCHANT_PRODUCT_GRID,
}
