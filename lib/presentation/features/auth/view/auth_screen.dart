import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
            } else if (state is AuthFailed) {
              if (context.loaderOverlay.visible) {
                context.loaderOverlay.hide();
              }
              AuthPopUpFunc.showErrorBar(context, state.errorMessage);
            } else if (state is AuthSuccess) {
              if (context.loaderOverlay.visible) {
                context.loaderOverlay.hide();
              }
              AuthPopUpFunc.showSuccessBar(context, state.userModel);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: locator<AuthBloc>(),
            buildWhen: (_, c) {
              if (c is AuthInitial) return true;
              return false;
            },
            builder: (context, state) {
              final authType =
                  state is AuthInitial ? state.authType : AuthType.login;
              final onLoginPage = authType == AuthType.login;

              return ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: LoginWelcomeText(
                      onLoginPage: onLoginPage ? true : false,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 30, bottom: 40),
                    child: AnimatedCrossFade(
                      firstChild: const FormContainer(child: LoginForm()),
                      secondChild: const FormContainer(child: RegisterForm()),
                      crossFadeState: onLoginPage
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: 300.ms,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
