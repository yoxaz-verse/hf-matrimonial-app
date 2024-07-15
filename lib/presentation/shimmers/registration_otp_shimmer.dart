import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class RegistrationOtpShimmer extends ConsumerWidget {
  const
  RegistrationOtpShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.05),
            Container(
              height: h * 0.03,
              width: w * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.white,
              ),
            ),
            SizedBox(
              height: h * 0.008,
            ),

            Container(
              height: h * 0.04,
              width: w * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.white,
              ),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            Center(
              child: Container(
                height: h * 0.055,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.06,
            ),
            Center(
              child: Container(
                height: h * 0.055,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                  Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.065,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.06,
            ),
            Center(
              child: Container(
                height: h * 0.055,
                width: w * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
