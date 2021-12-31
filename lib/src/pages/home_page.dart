// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/src/components/container/grid_container.dart';
import 'package:shop_app/src/mockdata/product_mockdata.dart';
import 'package:shop_app/src/models/grid_container_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GridContainerData? _homeFeed;
  GridContainerData _getHomeFeed() {
    return homePageProductGrid;
  }

  @override
  void initState() {
    super.initState();
    _homeFeed = _getHomeFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
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
              Icons.notifications,
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return Container(
      child: GridContainer(
        data: _homeFeed,
        crossAxisCount: 2,
      ),
    );
  }
}
