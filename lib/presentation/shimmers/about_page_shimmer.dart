import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class AboutPageShimmer extends ConsumerWidget {
  const AboutPageShimmer({super.key});

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
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:w*0.1 ),
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.03),
                Center(
                  child: Container(
                    height: h * 0.4,
                    width: w * 0.78,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.015),
                      color: AppColors.white,
                    ),

                  ),
                ),
                SizedBox(height: h * 0.05),
                Padding(
                  padding:  EdgeInsets.only(left:w*0.1 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.02,
                        width: w * 0.65,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.7,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.75,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.65,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.7,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),SizedBox(height: h * 0.005),Container(
                        height: h * 0.02,
                        width: w * 0.65,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.7,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.75,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.65,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        height: h * 0.02,
                        width: w * 0.7,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                        ),
                      ),
                    ],
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
