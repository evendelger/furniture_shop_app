import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  final _delay = 1500.ms;
  var _isVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(_delay, () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  void _goToLogin(BuildContext context) =>
      context.router.navigate(const LoginRoute());

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor3,
              blurRadius: 30,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => _goToLogin(context),
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
            fixedSize: const MaterialStatePropertyAll(Size(159, 54)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          child: Text(
            'Get Started',
            style: AppFonts.glsSemiBold.copyWith(
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ),
      ).animate().fadeIn(
          curve: Curves.fastOutSlowIn, delay: _delay, duration: 3000.ms),
    );
  }
}
