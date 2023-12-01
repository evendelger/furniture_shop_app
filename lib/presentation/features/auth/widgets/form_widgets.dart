import 'package:flutter/material.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

void changeFormType(BuildContext context) =>
    locator<AuthBloc>().add(const ChangeAuthType());

Text getLabel(String text) {
  return Text(
    text,
    style: AppFonts.nsRegular.copyWith(
      fontSize: 18,
      color: AppColors.lightGrey,
    ),
  );
}

Padding passwordDisplayIcon(VoidCallback onPressed, bool obscureText) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      icon: Icon(
        obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColors.primary,
      ),
    ),
  );
}

String? validateName(String? value) {
  if (value != null && value.isEmpty) {
    return 'Please, enter name';
  }
  return null;
}

String? validateEmail(String? value) {
  final regExp = RegExp(r'^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$');
  if (value != null) {
    if (value.isEmpty) {
      return 'Please, enter email';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid email';
    }
  }
  return null;
}

String? validatePassword(String? value) {
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

String? validateConfirmPassword(String? value, String? passwordValue) {
  if (value != null && passwordValue != null) {
    if (value.isEmpty) {
      return 'Please, enter a confirmed password';
    } else if (value != passwordValue) {
      return "The passwords don't match";
    }
  }
  return null;
}
