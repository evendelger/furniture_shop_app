import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/products/blocs/blocs.dart';
import 'package:furniture_shop_app/presentation/ui/router/routes_data.dart';
import 'package:go_router/go_router.dart';

class Functions {
  static void selectCategory(BuildContext context, Category category) {
    context
        .read<CategoriesBloc>()
        .add(SelectCategory(selectedCategory: category));
  }

  static void popBack(BuildContext context) => context.pop();

  static void goToCart(BuildContext context) => context.push(Routes.cart);
}
