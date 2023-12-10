import 'package:flutter/material.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';

class AuthBlocListenable extends ChangeNotifier {
  AuthBlocListenable() {
    bloc = locator<AuthBloc>()
      ..stream.listen((state) {
        if (state is AuthSuccess ||
            state is AuthInitial ||
            state is AuthLoading) {
          notifyListeners();
        }
      });
  }

  late final AuthBloc bloc;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
