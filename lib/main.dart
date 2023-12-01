import 'package:flutter/material.dart';
import 'package:furniture_shop_app/furniture_store_app.dart';
import 'package:furniture_shop_app/locator.dart';

Future<void> main() async {
  await Locator.init();
  runApp(const FurnitureStoreApp());
}
