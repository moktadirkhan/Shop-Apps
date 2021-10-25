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
    print(selectedCategory);
  }

  @override
  void initState() {
    super.initState();
    appData = Store.instance.getAppData();
    // ignore: avoid_print
    // print(appData.categoryList![1].catgoryName);
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
    // productList:appData.categoryList![selectedCategory].productList!.length;

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
        // ItemCard(),
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
