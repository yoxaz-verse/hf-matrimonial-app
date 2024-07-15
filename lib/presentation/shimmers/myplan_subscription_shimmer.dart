import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class MyPlanSubscriptionShimmer extends ConsumerWidget {
  const MyPlanSubscriptionShimmer({super.key});

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.08, vertical: h * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.008),
                  Center(
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.4,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h*0.012,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.5,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                    ),
                  ), SizedBox(
                    height: h*0.012,
                  ),
                  Center(
                    child: Container(
                      height: h * 0.3,
                      width: w * 0.9,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(h*0.015),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w*0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h * 0.04,
                          width: w * 0.65,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Container(
                          height: h * 0.04,
                          width: w * 0.55,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),SizedBox(
                          height: h * 0.006,
                        ),
                        Container(
                          height: h * 0.02,
                          width: w * 0.8,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),SizedBox(
                          height: h * 0.004,
                        ),
                        Container(
                          height: h * 0.02,
                          width: w * 0.8,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.004,
                        ),
                        Container(
                          height: h * 0.02,
                          width: w * 0.3,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: h * 0.025,
                              width: w * 0.5,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                              ),
                            ),

                            Container(
                              height: h * 0.03,
                              width: w * 0.1,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(width: w*0.01,),
                          ],
                        ),
                        SizedBox(height: w*0.03,),
                        Container(
                          height: h * 0.05,
                          width: w * 0.4,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: w*0.04,),
                        Container(
                          height: h * 0.04,
                          width: w * 0.55,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),SizedBox(
                          height: h * 0.006,
                        ),
                        Container(
                          height: h * 0.02,
                          width: w * 0.8,
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
          ),
        ],
      ),
    );
  }
}
