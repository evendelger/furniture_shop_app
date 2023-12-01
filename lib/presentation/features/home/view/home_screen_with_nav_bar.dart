import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:go_router/go_router.dart';

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
      icon: Icon(Icons.bookmark_outline),
      activeIcon: Icon(Icons.bookmark),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      activeIcon: Icon(Icons.notifications),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.092, // TODO
        child: Theme(
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

  void _openPage(int index, BuildContext context) {
    if (index == 1) {
      context.read<FavoritesBloc>().add(const FetchFavorites());
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
