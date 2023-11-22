import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello !',
          style: AppFonts.mrwRegular.copyWith(
            fontSize: 30,
            color: AppColors.lightGrey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'WELCOME BACK',
          style: AppFonts.mrwBold.copyWith(
            fontSize: 24,
            color: AppColors.blackFont,
            letterSpacing: 1.20,
          ),
        ),
      ],
    );
  }
}
