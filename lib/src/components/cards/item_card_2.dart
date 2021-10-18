import 'package:flutter/material.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/utils/colors.dart';

class ItemCard2 extends StatelessWidget {
  final Product? product;
  final Function()? press;
  const ItemCard2({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () {
          print("product name: ${product!.title}");
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product!.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product!.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(product!.price!.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
