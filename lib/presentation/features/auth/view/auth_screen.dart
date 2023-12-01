import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

enum MessageType {
  success,
  error,
  anon,
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayColor: AppColors.loadingTransparent,
      overlayWidgetBuilder: (_) => const Center(child: CircularIndicator()),
      child: Scaffold(
        appBar: const LoginAppBar(),
        body: BlocListener<AuthBloc, AuthState>(
          bloc: locator<AuthBloc>(),
          listener: (context, state) {
            if (state is AuthLoading) {
              context.loaderOverlay.show();
            } else if (state is AuthFailure) {
              if (context.loaderOverlay.visible) {
                context.loaderOverlay.hide();
              }
              _showErrorBar(context, state.message);
            } else if (state is AuthSuccess) {
              if (context.loaderOverlay.visible) {
                context.loaderOverlay.hide();
              }
              _showSuccessBar(context, state.userModel);
            }
          },
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: LoginWelcomeText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 30, bottom: 40),
                child: BlocBuilder<AuthBloc, AuthState>(
                  bloc: locator<AuthBloc>(),
                  buildWhen: (_, c) {
                    if (c is AuthInitial) return true;
                    return false;
                  },
                  builder: (context, state) {
                    final authType =
                        state is AuthInitial ? state.authType : AuthType.login;

                    return AnimatedCrossFade(
                      firstChild: const FormContainer(child: LoginForm()),
                      secondChild: const FormContainer(child: RegisterForm()),
                      crossFadeState: authType == AuthType.login
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: 300.ms,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessBar(BuildContext context, UserModel userModel) {
    if (userModel.isAnonymous!) {
      _showSnackBar(context, userModel.displayName!, MessageType.anon);
    } else {
      _showSnackBar(context, userModel.displayName!, MessageType.success);
    }
  }

  void _showErrorBar(BuildContext context, String message) =>
      _showSnackBar(context, message, MessageType.error);

  void _showSnackBar(
      BuildContext context, String text, MessageType messageType) {
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
