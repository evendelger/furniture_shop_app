import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class FurnitureStoreApp extends StatefulWidget {
  const FurnitureStoreApp({super.key});

  @override
  State<FurnitureStoreApp> createState() => _FurnitureStoreAppState();
}

class _FurnitureStoreAppState extends State<FurnitureStoreApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
