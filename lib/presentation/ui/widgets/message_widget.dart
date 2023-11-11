import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppFonts.nsSemiBold.copyWith(fontSize: 20),
      ),
    );
  }
}
