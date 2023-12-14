import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class AddAllButton extends StatelessWidget {
  const AddAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: ElevatedButton(
        onPressed: () => FavBlocFunc.addAll(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(50),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Add all to my cart',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
