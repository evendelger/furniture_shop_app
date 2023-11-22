import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/login/login.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: LoginWelcomeText(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, right: 30),
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
