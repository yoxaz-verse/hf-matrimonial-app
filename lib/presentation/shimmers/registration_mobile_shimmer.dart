import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class RegistrationMobShimmer extends ConsumerWidget {
  const
  RegistrationMobShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.16, vertical: h * 0.02),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.1),
              Container(
                height:h*0.035,
                width: w*0.45,
                  color: AppColors.white,
              ),
              SizedBox(height: h * 0.006),
              Container(
                height: h * 0.045,
                width: w * 0.9,
                  color: AppColors.white,
              ),
              SizedBox(height: h * 0.006),
              Container(
                height: h * 0.045,
                width: w * 0.4,
                  color: AppColors.white,
              ),
              SizedBox(height: h * 0.06),
              Container(
                  height: h * 0.07,
                  width: w * 0.9,
                  color: AppColors.white
              ),
              SizedBox(height: h * 0.04),
              Container(
                height: h * 0.07,
                width: w * 0.9,
                  color: AppColors.white,
              ),
              SizedBox(height: h * 0.06),
              Center(
                child: Container(
                  height: h * 0.055,
                  width: w * 0.4,
                    color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
