import 'package:flutter/material.dart';
import 'package:shop_app/src/models/appData.dart';
import 'package:shop_app/src/store/store.dart';
import 'package:shop_app/src/utils/colors.dart';
//We need statefull widget for our categories

class Categories extends StatefulWidget {
  final sendDataToParent; // this is a call back function which we will use to send data to parent
  const Categories({
    Key? key,
    this.sendDataToParent,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late AppData appData; // late initilization of appData
  int selectedIndex = 0; // this is the selected index of the categories
  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index; // this is the set state of the selected index
    });
  }

  @override
  void initState() {
    super.initState();
    appData = Store.instance
        .getAppData(); // loading the app data from mock data via Store
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: appData.categories!.length,
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
        widget.sendDataToParent(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appData.categories![index].catgoryName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: kDefaultPaddin / 4,
              ),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
