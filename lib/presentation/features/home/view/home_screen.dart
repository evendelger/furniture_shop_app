import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _navBarItems = const [
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.house_rounded),
      icon: Icon(Icons.house_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.bookmark),
      icon: Icon(Icons.bookmark_outline),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.notifications),
      icon: Icon(Icons.notifications_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outline),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProductsRoute(),
        FeaturedRoute(),
        NotificationsRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.092,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) => _openPage(index, tabsRouter, context),
                items: _navBarItems,
              ),
            ),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter, BuildContext context) {
    if (index == 1) {
      context.read<FavoritesBloc>().add(const FetchFavorites());
    }
    tabsRouter.setActiveIndex(index);
  }
}
