import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class TermsConditionShimmer extends ConsumerWidget {
  const TermsConditionShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.11, vertical: h * 0.02),
        child:SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.008),
              Center(
                child: Container(
                  height:h*0.04,
                  width: w*0.7,
                  decoration: BoxDecoration(
                    color: AppColors.white,
          
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.07,
              ),
              Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.007,
              ),
              Container(
                height:h*0.016,
                width: w*0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.76,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.75,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.78,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),),
              SizedBox(
                height: h * 0.004,
              ),
                Container(
                  height:h*0.016,
                  width: w*0.6,
                  decoration: BoxDecoration(
                    color: AppColors.white,
          
                  ),
                ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.007,
              ),
              Container(
                height:h*0.016,
                width: w*0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.76,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.75,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.78,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.6,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.007,
              ),
              Container(
                height:h*0.016,
                width: w*0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.76,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.75,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.78,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.6,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height:h*0.03,
                width: w*0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.007,
              ),
              Container(
                height:h*0.016,
                width: w*0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),
              SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.76,
                decoration: BoxDecoration(
                  color: AppColors.white,
          
                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,

                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,

                ),
              ),SizedBox(
                height: h * 0.004,
              ),
              Container(
                height:h*0.016,
                width: w*0.76,
                decoration: BoxDecoration(
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
