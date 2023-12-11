// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/data/models/cart_items_model.dart';
import 'package:machine_test/data/models/customers_list_model.dart';
import 'package:machine_test/data/models/products_list_model.dart';
import 'package:machine_test/domain/constants.dart';
import 'package:machine_test/domain/strings.dart';
import 'package:machine_test/presentation/pages/landing/landing_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(DataAdapterCust());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const LandingPage());
  }
}
