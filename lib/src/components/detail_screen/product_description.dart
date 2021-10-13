import 'package:flutter/material.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/utils/colors.dart';
class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product!.description!,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}