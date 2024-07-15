import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class ContactShimmer extends ConsumerWidget {
  const ContactShimmer({super.key});

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.09,),
                Center(
                  child: Container(
                    height: h * 0.1,
                    width: w*0.3,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: h*0.006,),
                Container(
                  height: h * 0.5,
                  width: w,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: h * 0.08,),
                Center(
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.4,
                    decoration: BoxDecoration(
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