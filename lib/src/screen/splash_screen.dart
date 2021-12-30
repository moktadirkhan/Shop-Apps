import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/src/screen/home_page.dart';
import 'package:shop_app/src/store/store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    initAppAndNavigate();
  }

  Future initAppAndNavigate() async {
    await Store.instance.initStore();
    var _duration = new Duration(microseconds: 500);
    return new Timer(_duration, navigateToHomeScreen);
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff75c760),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildAppName(),
          // SizedBox(height: 20),
          // _buildSpinner(),
        ],
      ),
    );
  }

  // Widget _buildAppName() {
  //   return Text(
  //     "MasterChef",
  //     style: GoogleFonts.robotoMono(
  //       color: Colors.black,
  //       fontStyle: FontStyle.normal,
  //       fontSize: 30,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }

  // Widget _buildSpinner() {
  //   return SpinKitDoubleBounce(
  //     color: Colors.white,
  //   );
  // }
}
