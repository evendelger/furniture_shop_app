import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        ImagePaths.startPhoto,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
