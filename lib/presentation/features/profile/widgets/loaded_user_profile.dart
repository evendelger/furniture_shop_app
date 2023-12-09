import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class LoadedUserProfile extends StatelessWidget {
  const LoadedUserProfile({
    super.key,
    required this.profileModel,
  });

  final ProfileModel profileModel;

  void _showDialog(BuildContext context) => showDialog(
        context: context,
        builder: (dialogContext) => BlocProvider.value(
          value: BlocProvider.of<ProfileBloc>(context),
          child: const ImageDialog(),
        ),
      );

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
                    ? const AssetImage('assets/images/avatar.png')
                    : Image.network(profileModel.photoUrl!).image,
              ),
            ),
            child: _inkChild(context),
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
          onTap: () => _showDialog(context),
        ),
      );
}

// class _CachedImageWidget extends StatelessWidget {
//   const _CachedImageWidget({required this.photoUrl});

//   final String photoUrl;

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: photoUrl,
//       imageBuilder: (context, imageProvider) {
//         return DecoratedBox(
//           decoration: BoxDecoration(
//             image: DecorationImage(image: imageProvider),
//           ),
//         );
//       },
//       progressIndicatorBuilder: (context, url, progress) => Shimmer.fromColors(
//         baseColor: AppColors.shimmerBase,
//         highlightColor: AppColors.shimmerHighlight,
//         child: const SizedBox.expand(),
//       ),
//     );
//   }
// }
