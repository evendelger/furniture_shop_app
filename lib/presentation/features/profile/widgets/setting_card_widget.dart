import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class SettingCardWidget extends StatelessWidget {
  const SettingCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.nsBold
                    .copyWith(color: AppColors.dark, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: AppFonts.nsRegular
                    .copyWith(color: AppColors.grey, fontSize: 12),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: AppColors.primary,
          ),
        ],
      ),
    );
    // return InkWell(
    //   onTap: () {},
    //   child: Card(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    //       child:
    //     ),
    //   ),
    // );
  }
}
