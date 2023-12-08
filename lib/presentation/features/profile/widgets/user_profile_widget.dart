import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 80,
            height: 80,
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bruno Pham',
              style: AppFonts.nsBold.copyWith(
                fontSize: 20,
                color: AppColors.blackFont,
              ),
            ),
            Text(
              'bruno203@gmail.com',
              style: AppFonts.nsRegular.copyWith(
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
