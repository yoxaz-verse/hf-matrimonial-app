import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class SendInterestScreenShimmer extends ConsumerWidget {
  const SendInterestScreenShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding:
            EdgeInsets.only(top: h * 0.16, left: w * 0.05, right: w * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.15),
              Container(
                height: h * 0.07,
                width: w * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                ),
              ),
              SizedBox(height: h * 0.1),
              Container(
                height: h * 0.15,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.15,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.15,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.1,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.shimmerGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
