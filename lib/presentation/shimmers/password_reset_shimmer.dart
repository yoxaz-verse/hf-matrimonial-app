import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class PasswordResetShimmer extends ConsumerWidget {
  const
  PasswordResetShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.03),
        child:Column(

          children: [
            SizedBox(height: h * 0.005),
            Container(
              height:h*0.07,
              width: w*0.8,
              color: AppColors.white,
            ),
            SizedBox(height: h * 0.19),
            Padding(
              padding:  EdgeInsets.all(h*0.012),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.04,
                    width: w * 0.6,
                      color: AppColors.white,
                  ),
                  SizedBox(height: h * 0.01),
                  Container(
                    height: h * 0.05,
                    width: w * 0.7,
                    color: AppColors.white,
                  ),
                  SizedBox(height: h * 0.03),
                  Container(
                    height: h * 0.06,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.white,

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.03),
            Container(
              height: h * 0.06,
              width: w * 0.4,
              decoration: BoxDecoration(
                color: AppColors.white,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
