import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => context.router.navigate(const HomeRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            SvgPicture.asset(
              'assets/icons/app_icon.svg',
              height: size.height / 4,
              width: size.width / 4,
            ),
            const SizedBox(height: 5),
            Text(
              'Furniture Shop',
              style: AppFonts.nsRegular.copyWith(
                color: AppColors.primary,
                fontSize: 40,
              ),
            ),
            const Spacer(),
            Text(
              'Loading...',
              style: AppFonts.nsRegular.copyWith(
                color: AppColors.primary,
                fontSize: 18,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
