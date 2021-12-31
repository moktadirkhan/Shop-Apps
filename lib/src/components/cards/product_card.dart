import 'package:flutter/material.dart';
import 'package:shop_app/src/models/product.dart';

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
