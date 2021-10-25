import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop_app/app.dart';
import 'package:path_provider/path_provider.dart';

// const HIVE_DB = "HiveDB";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox("HIVE_DB");
  runApp(const MyApp());
}
