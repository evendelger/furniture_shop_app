import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class AddAllButton extends StatelessWidget {
  const AddAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor2,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => FavBlocFunc.addAll(context),
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
            minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
          ),
          child: Text(
            'Add all to my cart',
            style: AppFonts.nsSemiBold.copyWith(
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
