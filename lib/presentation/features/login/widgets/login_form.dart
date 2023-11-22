import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:talker/talker.dart';

// отнимаем по 11 у padding'ов вокруг TextButton, потому что они имеют внутренний
// и почему-то неизменяемый padding по 11 вверх и вниз

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 35, bottom: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validateEmail,
                decoration: InputDecoration(
                  label: _getLabel('Email'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: _obscureText,
                validator: _validatePassword,
                decoration: InputDecoration(
                  label: _getLabel('Password'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: _passwordDisplayIcon(),
                  // не понял, как добиться эффекта парения label текста и
                  // одновременно ровным расположением иконки, поэтому убрал паддинги
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 15),
              _forgotPasswordButton(),
              const SizedBox(height: 15),
              _logInButton(),
              const SizedBox(height: 15),
              _logInAnonymously(),
              const SizedBox(height: 4),
              _signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _passwordDisplayIcon() {
    return IconButton(
      onPressed: () => setState(() {
        _obscureText = !_obscureText;
      }),
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      icon: Icon(
        _obscureText
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: AppColors.primary,
      ),
    );
  }

  Padding _signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () {},
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
        onPressed: () {},
        child: Text(
          'LOG IN ANONYMOUSLY',
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
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor2,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: _validateForm,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
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
      ),
    );
  }

  Padding _forgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () {},
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

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Talker().good('Validate successful');
    } else {
      Talker().error('Validate is failed');
    }
  }

  String? _validateEmail(String? value) {
    final regExp =
        RegExp(r'^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$');
    if (value != null) {
      if (value.isEmpty) {
        return 'Please, enter email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter valid email!';
      }
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final lengthRegExp = RegExp(r'.{6,}');
    final upperCaseRegExp = RegExp(r'(.*?[A-Z])');
    final lowerCaseRegExp = RegExp(r'(.*?[a-z])');
    final digitRegExp = RegExp(r'(.*?[0-9])');

    if (value != null) {
      if (value.isEmpty) {
        return 'Please, enter password';
      } else if (!lengthRegExp.hasMatch(value)) {
        return 'Password must be 6 characters or longer';
      } else if (!upperCaseRegExp.hasMatch(value)) {
        return 'Password must contain an uppercase letter';
      } else if (!lowerCaseRegExp.hasMatch(value)) {
        return 'Password must contain an lowercase letter';
      } else if (!digitRegExp.hasMatch(value)) {
        return 'Password must contain a digit';
      }
    }
    return null;
  }

  Text _getLabel(String text) {
    return Text(
      text,
      style: AppFonts.nsRegular.copyWith(
        fontSize: 18,
        color: AppColors.lightGrey,
      ),
    );
  }
}
