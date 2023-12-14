import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class LoadedUserProfile extends StatelessWidget {
  const LoadedUserProfile({
    super.key,
    required this.profileModel,
  });

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.avatarBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: profileModel.photoUrl == null
                    ? const AssetImage(ImagePaths.avatar)
                    : Image.network(profileModel.photoUrl!).image,
              ),
            ),
            child: profileModel.email.isEmpty ? null : _inkChild(context),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileModel.displayName,
              style: AppFonts.nsBold.copyWith(
                fontSize: 20,
                color: AppColors.blackFont,
              ),
            ),
            profileModel.email.isEmpty
                ? const SizedBox.shrink()
                : Text(
                    profileModel.email,
                    style: AppFonts.nsRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _inkChild(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => ProfilePopUpFunc.showPhotoDialog(context),
        ),
      );
}
