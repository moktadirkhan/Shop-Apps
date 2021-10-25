import 'package:flutter/material.dart';
import 'package:shop_app/src/screen/home_screen.dart';
import 'package:shop_app/src/screen/splash_screen.dart';
import 'package:shop_app/src/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
