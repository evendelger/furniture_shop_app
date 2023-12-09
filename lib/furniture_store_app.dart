import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

import 'package:furniture_shop_app/presentation/ui/router/app_router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class FurnitureStoreApp extends StatelessWidget {
  const FurnitureStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(
            cartRepository: locator<ICartRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
