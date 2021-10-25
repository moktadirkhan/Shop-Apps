import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/router.dart';
import 'package:shop_app/src/components/categories.dart';
import 'package:shop_app/src/components/item_card.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/models/product.dart';
import 'package:shop_app/src/pages/cart_page.dart';
import 'package:shop_app/src/pages/details_screen.dart';
import 'package:shop_app/src/store/store.dart';
import 'package:shop_app/src/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Appdata _appData;
  int selectedCategory = 0;
  void getSelectedValueFromChild(selectedValue) {
    setState(
      () {
        selectedCategory = selectedValue;
      },
    );
    // ignore: avoid_print
    print(selectedCategory);
  }

  @override
  void initState() {
    super.initState();
    _appData = Store.instance.getAppData();
    // ignore: avoid_print
    print(_appData.categoryList![1].catgoryName);
  }

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
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: kTextColor,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
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
                  builder: (context) => const Cart(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: kDefaultPaddin / 2),
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
        Categories(
          sendDataToParent: getSelectedValueFromChild,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: _buildProductsGrid(
              context,
              _appData.categoryList![selectedCategory].productList!,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsGrid(BuildContext context, List<Product> productsList) {
    return GridView.builder(
      itemCount: productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPaddin,
        crossAxisSpacing: kDefaultPaddin,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) => ItemCard(
        product: productsList[index],
        // press: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductDetails(
        //       product: productsList[index],
        //     ),
        //   ),
        // ),
        press: () => openProductPage(context, productsList[index]),
      ),
    );
  }
}
