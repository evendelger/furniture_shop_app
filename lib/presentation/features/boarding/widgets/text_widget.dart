import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'The best simple place where you discover most wonderful furnitures and make your home beautiful',
      textAlign: TextAlign.justify,
      style: AppFonts.nsRegular.copyWith(
        fontSize: 18,
        color: AppColors.grey,
        height: 1.9,
      ),
    ).animate().fadeIn(duration: 2000.ms).move(
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
          curve: Curves.easeOut,
          duration: 2500.ms,
        );
  }
}
