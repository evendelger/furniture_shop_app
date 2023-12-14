import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  final _delay = 1250.ms;
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

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: ElevatedButton(
        onPressed: () => RouterFunc.goToLogin(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          fixedSize: const Size(159, 54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 10,
        ),
        child: Text(
          'Get Started',
          style: AppFonts.glsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ).animate().fadeIn(
            curve: Curves.fastOutSlowIn,
            delay: _delay,
            duration: 3000.ms,
          ),
    );
  }
}
