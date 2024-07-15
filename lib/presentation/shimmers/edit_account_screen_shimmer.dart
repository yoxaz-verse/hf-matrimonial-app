import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class EditAccountScreenShimmer extends ConsumerWidget {
  const EditAccountScreenShimmer({super.key});

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
                SizedBox(height: h*0.090,),
                Container(
                  height: h * 0.25,
                  width: w * 0.9,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: h * 0.01,),
                Center(
                  child: Container(
                    height: h * 0.09,
                    width: w * 0.6,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.01,),
                Container(
                  height: h * 0.54,
                  width: w * 0.90,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}