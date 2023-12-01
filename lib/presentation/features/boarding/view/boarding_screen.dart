import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/boarding/boarding.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundImage(),
          Positioned(
            top: 210,
            left: 30,
            right: 30,
            child: SizedBox(
              height: 250,
              child: Stack(
                children: [
                  TitleWidget(),
                  Positioned(
                    top: 120,
                    right: 0,
                    left: 30,
                    child: TextWidget(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            child: GetStartedButton(),
          ),
        ],
      ),
    );
  }
}
