import 'package:flutter/material.dart';
import 'package:shop_app/src/components/cards/product_overview_card.dart';
import 'package:shop_app/src/models/grid_item.dart';

class GridCardHandler extends StatelessWidget {
  final GridItem gridItem;
  final int index;

  GridCardHandler(this.gridItem, this.index);

  @override
  Widget build(BuildContext context) {
    switch (gridItem.itemType) {
      case GridItemType.HOME_PRODUCT_GRID:
        return ProductOverviewCard(
          product: gridItem.product!,
        );
      default:
        return Container();
    }
  }
}
