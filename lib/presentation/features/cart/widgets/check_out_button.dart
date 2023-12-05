import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        bool enabledShimmer = true;
        if (state is CartLoading) {
          enabledShimmer = true;
        } else if (state is CartLoaded) {
          enabledShimmer = false;
        }

        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlight,
          enabled: true,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: enabledShimmer
                    ? null
                    : [
                        const BoxShadow(
                          color: AppColors.shadowColor2,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.primary),
                  minimumSize:
                      const MaterialStatePropertyAll(Size.fromHeight(60)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  elevation: const MaterialStatePropertyAll(0),
                ),
                child: Text(
                  'Check out',
                  style: AppFonts.nsSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
