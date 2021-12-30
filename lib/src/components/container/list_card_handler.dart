import 'package:flutter/material.dart';
import 'package:shop_app/src/components/cards/product_card.dart';
import 'package:shop_app/src/components/cards/product_overview_card.dart';
import 'package:shop_app/src/models/list_item.dart';

class ListCardHandler extends StatelessWidget {
  final ListItem? item;
  final int? index;

  ListCardHandler({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    switch (item!.itemType) {
      case ListItemType.HOME_PAGE_PRODUCT:
        return ProductOverviewCard(
          product: item!.product!,
        );
      case ListItemType.MERCHANT_PAGE_PRODUCT:
        return ProductCard(
          product: item!.product!,
        );
      default:
        return Container();
    }
  }
}
