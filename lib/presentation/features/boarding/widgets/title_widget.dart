import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'MAKE YOUR',
          style: AppFonts.glsSemiBold.copyWith(
            fontSize: 24,
            color: AppColors.black3,
            letterSpacing: 1.28,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'HOME BEAUTIFUL',
          style: AppFonts.glsBold.copyWith(
            fontSize: 30,
            color: AppColors.blackFont,
          ),
        ),
      ].animate().fadeIn(duration: 2000.ms).move(
            begin: const Offset(0, -50),
            end: const Offset(0, 0),
            curve: Curves.easeOut,
            duration: 2500.ms,
          ),
    );
  }
}
