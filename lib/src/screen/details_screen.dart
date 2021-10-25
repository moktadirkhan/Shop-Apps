import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/src/components/detail_screen/add_to_cart.dart';
import 'package:shop_app/src/components/detail_screen/color_size.dart';
import 'package:shop_app/src/components/detail_screen/couter_favbutton.dart';
import 'package:shop_app/src/components/detail_screen/product_description.dart';
import 'package:shop_app/src/components/detail_screen/product_image.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/utils/colors.dart';

class ProductDetails extends StatelessWidget {
  final Product? product;
  // final List<Product>? productList;

  const ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: product!.color!,
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
      body: builItemDetails(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            // by default our icon color is white
            color: Colors.white,
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
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  // by default our icon color is white
                  color: Colors.white,
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

  Widget builItemDetails(BuildContext context) {
    //it provide us total size and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      ProductDescription(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterwithFavourite(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddtoCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color? color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color! : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color!,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            //if our item is less than 10 then it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            setState(() {
              numOfItems++;
            });
          },
        )
      ],
    );
  }

  SizedBox buildOutlineButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          onPressed: press,
          child: Icon(icon)),
    );
  }
}
