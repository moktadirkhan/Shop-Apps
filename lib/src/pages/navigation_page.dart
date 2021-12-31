// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/src/pages/cart_page.dart';
import 'package:shop_app/src/pages/home_page.dart';
import 'package:shop_app/src/pages/profile_page.dart';
import 'package:shop_app/src/pages/search_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  Widget loadScreens(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CartPage();
      case 2:
        return SearchPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadScreens(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
        selectedIndex: _currentIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: Colors.green,
            inactiveColor: Color(0xff6e80b0),
            title: Text(
              "Feed",
            ),
            icon: Icon(
              Icons.feed,
            ),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.feed,
            ),
            activeColor: Colors.green,
            inactiveColor: Color(0xff6e80b0),
            title: Text("Category"),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.feed,
            ),
            activeColor: Colors.green,
            inactiveColor: Color(0xff6e80b0),
            title: Text(
              "Favorites",
            ),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.feed,
            ),
            activeColor: Colors.green,
            inactiveColor: Color(0xff6e80b0),
            title: Text("Profile"),
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
