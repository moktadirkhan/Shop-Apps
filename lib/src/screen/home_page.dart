// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/router.dart';
import 'package:shop_app/src/components/categories.dart';
import 'package:shop_app/src/components/item_card.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/screen/cart.dart';
import 'package:shop_app/src/screen/details_screen.dart';
import 'package:shop_app/src/store/store.dart';
import 'package:shop_app/src/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  final List<Product>? products1;
  const HomeScreen({Key? key, this.products1}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Appdata appData;
  final List<Product>? productList = Store.instance.getAllProduct();

  int selectedCategory = 0;
  void getSelectedValueFromChild(selectedValue) {
    setState(
      () {
        selectedCategory = selectedValue;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    appData = Store.instance.getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "ShopApp",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shop,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: buildItems(context),
    );
  }

  Widget buildItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Bags",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(
          sendDataToParent: getSelectedValueFromChild,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: buildGridView(
              context,
              appData.categoryList![selectedCategory].productList!,
            ),
          ),
        ),
      ],
    );
  }

  GridView buildGridView(BuildContext context, List<Product> products) {
    return GridView.builder(
      itemCount: appData.categoryList![selectedCategory].productList!.length,
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
        // press: () => openProductPage(context, products[index]),
      ),
    );
  }
}
