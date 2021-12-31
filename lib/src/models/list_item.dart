import 'package:shop_app/src/models/cart_item.dart';
import 'package:shop_app/src/models/product.dart';

class ListItem {
  ListItemType? itemType;
  Product? product;
  CartItem? cartItem;
  ListItem({
    this.itemType,
    this.product,
    this.cartItem,
  });
}

enum ListItemType {
  HOME_PAGE_PRODUCT,
  MERCHANT_PAGE_PRODUCT,
}
