
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class TestimonyShimmer extends ConsumerWidget {
  TestimonyShimmer({super.key});

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
        child:Column(
          children: [
            SizedBox(height: h * 0.1,),
            Center(
              child: Container(
                height: h * 0.046,
                width: w * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.circular(0),
                ),
              ),
            ),
            SizedBox(height: h * 0.01,),
            Center(
              child: Container(
                height: h * 0.5,
                width: w * 0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.circular(h * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
