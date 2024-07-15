import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class PersonalDetailsShimmer extends ConsumerWidget {
  const PersonalDetailsShimmer({super.key});

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
              children: [
                SizedBox(
                  height: h * 0.12,
                ),
                Center(
                  child: Container(
                    height: h * 0.8,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      //   color: AppColors.white,
                      borderRadius: BorderRadius.circular(h * 0.015),
                      border:
                          Border.all(color: AppColors.white, width: w * 0.02),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Center(
                          child: Container(
                            height: h * 0.04,
                            width: w * 0.7,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Center(
                          child: Container(
                            height: h * 0.2,
                            width: w * 0.8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Center(
                          child: Container(
                            height: h * 0.03,
                            width: w * 0.45,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Center(
                          child: Container(
                            height: h * 0.04,
                            width: w * 0.55,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        // Center(
                        //   child: Container(
                        //     height: h * 0.09,
                        //     width: w * 0.6,
                        //     decoration: const BoxDecoration(
                        //       color: AppColors.white,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: h * 0.03,),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.08,
                            width: w * 0.35,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        // SizedBox(height: h * 0.01,),
                        // Center(
                        //   child: Container(
                        //     height: h * 0.05,
                        //     width: w * 0.9,
                        //     decoration:  BoxDecoration(
                        //       color: AppColors.white,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: h * 0.01,),
                        // Center(
                        //   child: Container(
                        //     height: h * 0.05,
                        //     width: w * 0.9,
                        //     decoration:  BoxDecoration(
                        //       color: AppColors.white,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: h * 0.01,),
                        // Center(
                        //   child: Container(
                        //     height: h * 0.05,
                        //     width: w * 0.9,
                        //     decoration:  BoxDecoration(
                        //       color: AppColors.white,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: h * 0.01,),
                      ],
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
