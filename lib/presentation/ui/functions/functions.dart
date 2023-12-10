import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';
import 'package:furniture_shop_app/presentation/ui/router/routes_data.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

part 'bloc_functions.dart';
part 'router_functions.dart';
part 'provider_functions.dart';

abstract class Functions {}
