import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/products/blocs/blocs.dart';

class Functions {
  static void selectCategory(BuildContext context, Category category) {
    context
        .read<CategoriesBloc>()
        .add(SelectCategory(selectedCategory: category));
  }
}
