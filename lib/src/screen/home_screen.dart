import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/router.dart';
import 'package:shop_app/src/components/categories.dart';
import 'package:shop_app/src/components/item_card.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/screen/cart.dart';
import 'package:shop_app/src/screen/details_screen.dart';
import 'package:shop_app/src/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Widget buildAppBar(BuildContext context) {
    return Row(
      // mainAxisAlignment:MainAxisAlignment.spaceBetween,
      // backgroundColor: Colors.white,
      // elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {},
      // ),
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            // by default our icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: kDefaultPaddin / 2),
      ],
    );
  }

  Widget buildItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        // ItemCard(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      product: products[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
