import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final _confirmPassfocusNode = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 35, bottom: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: validateName,
              decoration: InputDecoration(
                label: getLabel('Name'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 30),
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
              textInputAction: TextInputAction.next,
              obscureText: _obscureText,
              validator: (value) => validatePassword(value, false),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_confirmPassfocusNode),
              decoration: InputDecoration(
                label: getLabel('Password'),
                suffixIcon:
                    passwordDisplayIcon(_onPressedObscureText, _obscureText),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _confirmPassController,
              focusNode: _confirmPassfocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: _obscureText,
              validator: (value) =>
                  validateConfirmPassword(value, _passwordController.text),
              decoration: InputDecoration(
                label: getLabel('Confirm Password'),
                suffixIcon:
                    passwordDisplayIcon(_onPressedObscureText, _obscureText),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 50),
            _signUpButton(),
            const SizedBox(height: 19),
            _signInButton(),
          ],
        ),
      ),
    );
  }

  void _validateRegisterForm() {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      AuthBlocFunc.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  Padding _signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: ElevatedButton(
        onPressed: _validateRegisterForm,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 6,
          backgroundColor: AppColors.primary,
          fixedSize: const Size.fromHeight(50),
        ),
        child: Text(
          'Sign up',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Padding _signInButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have account?',
            style: AppFonts.nsSemiBold.copyWith(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          TextButton(
            onPressed: () => AuthBlocFunc.changeFormType(context),
            child: Text(
              'SIGN IN',
              style: AppFonts.nsBold.copyWith(
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressedObscureText() => setState(() {
        _obscureText = !_obscureText;
      });
}
