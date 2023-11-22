import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
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
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
            minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
          ),
          child: Text(
            'Check out',
            style: AppFonts.nsSemiBold.copyWith(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
