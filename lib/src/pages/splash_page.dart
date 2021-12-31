// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/src/pages/navigation_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initAppAndNavigate();
  }

  Future initAppAndNavigate() async {
    // Store.instance.initStore();
    var _duration = new Duration(microseconds: 500);
    return new Timer(_duration, navigateToHomeScreen);
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavigationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
