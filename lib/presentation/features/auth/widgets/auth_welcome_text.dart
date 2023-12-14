import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({
    super.key,
    required this.onLoginPage,
  });

  final bool onLoginPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        onLoginPage
            ? Text(
                'Hello !',
                style: AppFonts.mrwRegular.copyWith(
                  fontSize: 30,
                  color: AppColors.lightGrey,
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 10),
        Text(
          onLoginPage ? 'WELCOME BACK' : 'WELCOME',
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
