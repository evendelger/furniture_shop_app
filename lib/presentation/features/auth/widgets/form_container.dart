import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor1,
            blurRadius: 30,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }
}
