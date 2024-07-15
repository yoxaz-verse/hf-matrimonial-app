import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class LoginPageShimmer extends ConsumerWidget {
  const LoginPageShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.08,
            ),
            Center(
              child: Container(
                height: h * 0.25,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(h * 0.015),
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
            Center(
              child: Container(
                height: h * 0.05,
                width: w * 0.8,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: h * 0.008),
            Center(
              child: Container(
                height: h * 0.05,
                width: w * 0.8,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: h * 0.08),
            Center(
              child: Container(
                height: h * 0.05,
                width: w * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(h * 0.003),
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
