import 'package:flutter/material.dart';

enum ScreenType {
  productsCategories,
  productsSearch,
}

// слежу за изменением типа экрана товаров для ребилда
class ProductsScreenType with ChangeNotifier {
  ProductsScreenType();

  ScreenType _screenType = ScreenType.productsCategories;
  String _searchQuery = '';

  ScreenType get screenType => _screenType;
  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void changeToSearch() {
    _screenType = ScreenType.productsSearch;
    notifyListeners();
  }

  void changeToCategories() {
    _screenType = ScreenType.productsCategories;
    notifyListeners();
  }
}
