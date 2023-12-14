part of 'functions.dart';

abstract class PopUpFunc extends Functions {
  static void showErrorSnackBar(BuildContext context, String errorMessage) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primary,
          content: Row(
            children: [
              const Icon(
                Icons.error_outline_rounded,
                color: AppColors.red,
              ),
              const SizedBox(width: 5),
              Flexible(child: Text(errorMessage)),
            ],
          ),
        ),
      );
}

enum MessageType {
  success,
  error,
  anon,
}

abstract class AuthPopUpFunc extends PopUpFunc {
  static void showSuccessBar(BuildContext context, UserModel userModel) {
    if (userModel.isAnonymous!) {
      _showSnackBar(context, userModel.displayName!, MessageType.anon);
    } else {
      _showSnackBar(context, userModel.displayName!, MessageType.success);
    }
  }

  static void showErrorBar(BuildContext context, String message) =>
      _showSnackBar(context, message, MessageType.error);

  static void _showSnackBar(
    BuildContext context,
    String text,
    MessageType messageType,
  ) {
    final textStyle = AppFonts.nsRegular.copyWith(fontSize: 14);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primary,
        content: Row(
          children: [
            switch (messageType) {
              MessageType.success => const Icon(
                  Icons.done_rounded,
                  color: AppColors.success,
                ),
              MessageType.error => const Icon(
                  Icons.error_outline_rounded,
                  color: AppColors.red,
                ),
              MessageType.anon => const Icon(
                  Icons.priority_high_rounded,
                  color: AppColors.yellow,
                ),
            },
            const SizedBox(width: 5),
            Flexible(
              child: switch (messageType) {
                MessageType.success =>
                  Text('Welcome, $text!', style: textStyle),
                MessageType.error => Text(text, style: textStyle),
                MessageType.anon => Text(
                    'You have logged in anonymously, but you can create an account and log in through it at any time.',
                    style: textStyle),
              },
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ProfilePopUpFunc extends PopUpFunc {
  static void showPhotoDialog(BuildContext context) => showDialog(
        context: context,
        builder: (dialogContext) => BlocProvider.value(
          value: BlocProvider.of<ProfileBloc>(context),
          child: const ImageDialog(),
        ),
      );
}
