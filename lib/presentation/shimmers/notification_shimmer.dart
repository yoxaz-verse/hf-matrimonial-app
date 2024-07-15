import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class NotificationShimmer extends ConsumerWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.12),
            Container(
              height: h * 0.07,
              width: w*0.9,
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: h * 0.1),
            Container(
              height: h * 0.07,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h * 0.005),
                color: AppColors.white,
              ),
            ),
            SizedBox(height: h * 0.03),
            Container(
              height: h * 0.07,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h * 0.005),
                color: AppColors.white,
              ),
            ),
            SizedBox(height: h * 0.03),
            Container(
              height: h * 0.07,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h * 0.005),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
