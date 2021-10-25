import 'package:flutter/material.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/store/store.dart';
import 'package:shop_app/src/utils/colors.dart';
//We need statefull widget for our categories

class Categories extends StatefulWidget {
  final sendDataToParent;

  const Categories({Key? key, this.sendDataToParent}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  late Appdata appData;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    appData = Store.instance.getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: appData.categoryList!.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.sendDataToParent(selectedIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                appData.categoryList![index].catgoryName!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor,
                ),
              ),
              //for underline the categories
              Container(
                margin:
                    EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ]),
      ),
    );
  }
}
