import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class SearchPartnerScreenShimmer extends ConsumerWidget {
  SearchPartnerScreenShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child:  Column(
        children: [
          // Container(
          //   height: h*0.06,
          //   width: w*0.2,
          //   decoration: BoxDecoration(
          //     color: AppColors.white,
          //
          //   ),
          // ),
          SingleChildScrollView(
            physics:  NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h*0.03,),
                Center(
                  child: Container(
                    height:h * 0.04,
                    width: w*0.55,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ), SizedBox(height: h*0.005,),
                Center(
                  child: Container(
                    height:h * 0.22,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.014),
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h*0.08,),
                Center(
                  child: Container(
                    height:h * 0.03,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),Center(
                  child: Container(
                    height:h * 0.03,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),Center(
                  child: Container(
                    height:h * 0.03,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),Center(
                  child: Container(
                    height:h * 0.03,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),Center(
                  child: Container(
                    height:h * 0.03,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ),
                SizedBox(height: h * 0.15),
                Center(
                  child: Container(
                    height:h * 0.05,
                    width:w * 0.4,
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