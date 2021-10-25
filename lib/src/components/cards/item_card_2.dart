import 'package:flutter/material.dart';
import 'package:shop_app/src/components/detail_screen/couter_favbutton.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/screen/details_screen.dart';
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
    return InkWell(
      child: Container(
        height: 100,
        padding: EdgeInsets.only(top: 15, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        product!.image!,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title!,
                        style: TextStyle(
                          color: Color(0xff18172b),
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        product!.price!.toString(),
                        style: TextStyle(
                          color: Color(0xff18172b),
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CartCounter()],
            ),
          ],
        ),
      ),
    );
  }
}
