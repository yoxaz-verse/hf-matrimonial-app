import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class CheckYourMailShimmer extends ConsumerWidget {
  const CheckYourMailShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      child: Column(
        children: [
          SingleChildScrollView(
            physics:  NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h*0.22,),
                Container(
                  height:h*0.5,
                  width: w,
                  decoration: BoxDecoration(
                    color: AppColors.white,

                  ),
                ),
                SizedBox(height: h * 0.03),

              ],
            ),
          ),
        ],
      ),
    );
  }
}