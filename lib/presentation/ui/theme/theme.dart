import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/constants/app_constants.dart';

part 'app_fonts.dart';
part 'app_colors.dart';

final myTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    scrolledUnderElevation: 0,
    toolbarHeight: AppConstants.appBarHeight,
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
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 6,
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.blueGray,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(),
      foregroundColor: AppColors.grey,
      elevation: 6,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    ),
  ),
);
