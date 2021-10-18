import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void openCartPage( BuildContext context ) {
  Navigator.of(context)
      .pushNamed('/cart');
}
