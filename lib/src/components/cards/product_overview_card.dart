// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shop_app/src/models/product.dart';

class ProductOverviewCard extends StatefulWidget {
  final Product product;
  const ProductOverviewCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductOverviewCardState createState() => _ProductOverviewCardState();
}

class _ProductOverviewCardState extends State<ProductOverviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: Text(
        widget.product.productName!,
      ),
    );
  }
}
