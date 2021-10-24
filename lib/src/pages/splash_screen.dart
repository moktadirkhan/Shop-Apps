import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/src/pages/home_screen.dart';
import 'package:shop_app/src/store/store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initAppAndNavigate();
  }

  Future initAppAndNavigate() async {
    await Store.instance.initStore();
    var _duration = const Duration(microseconds: 500);
    return Timer(_duration, navigateToHomeScreen);
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff75c760),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAppName(),
          const SizedBox(height: 20),
          _buildSpinner(),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      "MasterChef",
      style: GoogleFonts.robotoMono(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSpinner() {
    return const SpinKitDoubleBounce(
      color: Colors.white,
    );
  }
}
