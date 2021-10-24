import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/src/components/item_card.dart';
import 'package:shop_app/src/components/cards/item_card_2.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/utils/colors.dart';

class Cart extends StatelessWidget {
  final Product? product;

  const Cart({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            height: 80,
            child: buildAppBar(context),
          ),
        ),
      ),
      body: buildItems(context),
    );
  }

  Widget buildItems(BuildContext context) {
    return InkWell(
      onTap: () {},
      // padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Cart",
                style: TextStyle(
                  color: Color(0xff18172b),
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          //     child: GridView.builder(
          //       itemCount: products.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 1,
          //         mainAxisSpacing: kDefaultPaddin,
          //         crossAxisSpacing: kDefaultPaddin,
          //         childAspectRatio: 3,
          //       ),
          //       itemBuilder: (context, index) {
          //         return Container(
          //           height: 120,
          //           child: ItemCard2(
          //             // product: products[index],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return Row(
    children: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          // by default our icon color is white
          color: kTextColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      Spacer(),
      Container(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                // by default our icon color is white
                color: kTextColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                // by default our icon color is white
                color: kTextColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      SizedBox(width: kDefaultPaddin / 2),
    ],
  );
}
