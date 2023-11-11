import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _TitleImage(),
            _FavouritedIcon(),
          ],
        ),
        SizedBox(height: 10),
        _ItemTitle(),
        SizedBox(height: 5),
        _ItemPrice(),
      ],
    );
  }
}

class _ItemPrice extends StatelessWidget {
  const _ItemPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      r'$ 12.00',
      style: AppFonts.nsBold.copyWith(color: AppColors.blackFont),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Black Simple Lamp',
      style: AppFonts.nsRegular.copyWith(color: AppColors.black3),
    );
  }
}

class _TitleImage extends StatelessWidget {
  const _TitleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sample_lamp.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

class _FavouritedIcon extends StatelessWidget {
  const _FavouritedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 10,
      bottom: 0,
      child: CustomSquareButton(
        backgroundColor: AppColors.greyWithOpacity,
        iconColor: AppColors.white,
        sideLength: 30,
        iconName: 'shopping_bag',
        iconLength: 20,
        borderRadius: 6,
      ),
    );
  }
}
