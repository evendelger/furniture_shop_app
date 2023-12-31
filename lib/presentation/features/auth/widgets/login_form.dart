import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

// отнимаем по 11 у padding'ов вокруг TextButton, потому что они имеют внутренний
// и почему-то неизменяемый padding по 11 вверх и вниз

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPressedObscureText() => setState(() {
        _obscureText = !_obscureText;
      });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 35, bottom: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: validateEmail,
              decoration: InputDecoration(
                label: getLabel('Email'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: _obscureText,
              validator: (value) => validatePassword(value, true),
              decoration: InputDecoration(
                label: getLabel('Password'),
                suffixIcon:
                    passwordDisplayIcon(_onPressedObscureText, _obscureText),
                // не понял, как добиться эффекта парения label текста и
                // одновременно ровным расположением иконки, поэтому убрал паддинги
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 15),
            //_forgotPasswordButton(),
            const SizedBox(height: 15),
            _logInButton(),
            const SizedBox(height: 15),
            _logInAnonymously(),
            const SizedBox(height: 4),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  Padding _signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () => AuthBlocFunc.changeFormType(context),
        child: Text(
          'SIGN UP',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.blackFont,
          ),
        ),
      ),
    );
  }

  Padding _logInAnonymously() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: AuthBlocFunc.logInAnon,
        child: Text(
          'Log in Anonymously',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.blackFont,
          ),
        ),
      ),
    );
  }

  Padding _logInButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: ElevatedButton(
        onPressed: () => _validateLoginForm(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 6,
          backgroundColor: AppColors.primary,
          fixedSize: const Size.fromHeight(50),
        ),
        child: Text(
          'Log In',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Padding _forgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () => throw Error(),
        child: Text(
          'Forgot Password',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.blackFont,
          ),
        ),
      ),
    );
  }

  void _validateLoginForm(BuildContext context) {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      AuthBlocFunc.logIn(
        _emailController.text,
        _passwordController.text,
      );
    }
  }
}
