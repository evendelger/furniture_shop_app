import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/constants/constants.dart';

part 'app_fonts.dart';
part 'app_colors.dart';

final myTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    toolbarHeight: Constants.appBarHeight,
    titleTextStyle: AppFonts.mrwBold.copyWith(
      fontSize: 16,
      color: AppColors.primary,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.disabled,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      color: AppColors.primary,
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.disabled,
      size: 30,
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.blueGray,
  ),
);
