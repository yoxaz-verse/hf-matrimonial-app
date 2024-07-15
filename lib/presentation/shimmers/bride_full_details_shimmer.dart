import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class BrideFullDetailsShimmer extends ConsumerWidget {
  const BrideFullDetailsShimmer({super.key});

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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.15,
                ),
                Center(
                  child: Container(
                    height: h * 0.28,
                    width: w * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.015),
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.008),
            Center(
              child: Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,

                ),),),   SizedBox(height: h * 0.008),
            Center(
              child: Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,

                ),),),   SizedBox(height: h * 0.008),
            Center(
              child: Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,

                ),),),
                SizedBox(height: h * 0.008),
                Center(
                  child: Container(
                    height:h*0.06,
                    width: w*0.4,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),),),
                  SizedBox(height: h * 0.05),
                  Center(
                    child: Container(
                      height: h * 0.32,
                      width: w * 0.8,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
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
