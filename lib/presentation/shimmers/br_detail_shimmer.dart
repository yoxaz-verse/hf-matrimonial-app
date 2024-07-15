import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class BrDetailShimmer extends ConsumerWidget {
  const BrDetailShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: h*0.08),
          Center(
            child: Container(
              height: h * 0.8,
              width: w * 0.9,
              decoration: BoxDecoration(
                //   color: AppColors.white,
                borderRadius:BorderRadius.circular(h * 0.015),
                border: Border.all(
                    color: AppColors.white, width: w * 0.02),

                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.07),
                    spreadRadius: w * 0.005,
                    blurRadius: w * 0.015,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Column(

                children: [
                  SizedBox(height: h*0.05),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: w*0.002),
                        Container(
                          height:h*0.03,
                          width: w*0.3,
                          decoration: BoxDecoration(
                            color: AppColors.white,

                          ),

                        ),
                        Container(
                          height:h*0.03,
                          width: w*0.45,
                          decoration: BoxDecoration(
                            color: AppColors.white,

                          ),
                        ),
                        SizedBox(width: w*0.008),
                      ],
                    ),
                  ),
                  SizedBox(height: h*0.02),
                  Container(
                    height: h * 0.35,
                    width: w * 0.75,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.015),

                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: h * 0.05,),
                  Container(
                    height: h * 0.26,
                    width: w * 0.75,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.015),
                      color: AppColors.white,
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