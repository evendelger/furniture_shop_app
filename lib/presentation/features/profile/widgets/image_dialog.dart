import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Container(
        height: 242,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15)
              .copyWith(top: 20, bottom: 15),
          child: Column(
            children: [
              Text(
                'Change profile picture',
                style: AppFonts.nsSemiBold.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 20),
              _ListTileItem(
                icon: Icons.photo_library_rounded,
                title: 'Select from gallery',
                onTap: () => ProfileBlocFunc.selectGalleryImage(context),
              ),
              const SizedBox(height: 10),
              _ListTileItem(
                icon: Icons.photo_camera_rounded,
                title: 'Take a picture',
                onTap: () => ProfileBlocFunc.selectCameraImage(context),
              ),
              const SizedBox(height: 10),
              Text(
                'You must enable permissions for these actions',
                style: AppFonts.nsRegular.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListTileItem extends StatelessWidget {
  const _ListTileItem({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: const BorderSide(color: AppColors.lightGrey),
          ),
          leading: Icon(
            icon,
            color: AppColors.primary,
          ),
          title: Text(
            title,
            style: AppFonts.nsRegular.copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
