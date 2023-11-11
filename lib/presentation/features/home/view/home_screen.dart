import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _navBarItems = const [
    BottomNavigationBarItem(
      activeIcon: CustomIcon(
        iconName: 'home_solid',
        color: AppColors.primary,
        size: 30,
      ),
      icon: CustomIcon(
        iconName: 'home',
        color: AppColors.disabled,
        size: 30,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: CustomIcon(
        iconName: 'bookmark_solid',
        color: AppColors.primary,
      ),
      icon: CustomIcon(
        iconName: 'bookmark',
        color: AppColors.disabled,
      ),
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
                onTap: (index) => _openPage(index, tabsRouter),
                items: _navBarItems,
              ),
            ),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
