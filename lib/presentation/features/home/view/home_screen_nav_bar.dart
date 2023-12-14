import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  final _navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.house_outlined),
      activeIcon: Icon(Icons.house_rounded),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_outline_rounded),
      activeIcon: Icon(Icons.bookmark_rounded),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      activeIcon: Icon(Icons.notifications_rounded),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      activeIcon: Icon(Icons.person_rounded),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(
            productsRepository: locator<IProductsRepository>(),
            cartRepository: locator<ICartRepository>(),
          )..add(const ProductsFetch()),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
            favoritesRepository: locator<IFavoritesRepository>(),
            cartRepository: locator<ICartRepository>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: selectAppBar(),
        body: navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => _openPage(index, context),
            items: _navBarItems,
          ),
        ),
      ),
    );
  }
  // height: MediaQuery.of(context).size.height * 0.092, // TODO

  void _openPage(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  // анализатор не дает указать PreferedSizeWidget, поэтому использую это
  selectAppBar() => switch (navigationShell.currentIndex) {
        0 => null,
        1 => const FavoritesAppBar(),
        2 => const NotificationAppBar(),
        3 => const ProfileAppBar(),
        _ => null,
      };
}
