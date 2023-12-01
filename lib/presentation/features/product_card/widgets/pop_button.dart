import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:go_router/go_router.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => context.pop(),
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(AppColors.white),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primary,
          size: 20,
        ),
      ),
    );
  }
}
