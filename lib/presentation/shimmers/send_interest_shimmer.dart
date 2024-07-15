import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';


class SendInterestShimmer extends ConsumerWidget {
  const SendInterestShimmer({super.key});

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
              SizedBox(height: h * 0.07),
              Center(
                child: Container(
                  height:h*0.02,
                  width: w*0.5,
                  decoration: BoxDecoration(
                    color: AppColors.white,

                  ),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Center(
                child: Container(
                  height:h*0.03,
                  width: w*0.6,
                  decoration: BoxDecoration(
                    color: AppColors.white,

                  ),
                ),
              ),
              SizedBox(
                height: h * 0.1,
              ),
              Row(
                children: [
                  Container(
                    height:h*0.045,
                    width: w*0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.03),
                      color: AppColors.white,

                    ),
                  ),
                  SizedBox(
                   width:w* 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.45,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                    ],
                  ),
                ],
              ), SizedBox(
                height: h * 0.05,
              ),
              Row(
                children: [
                  Container(
                    height:h*0.045,
                    width: w*0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.03),
                      color: AppColors.white,

                    ),
                  ),
                  SizedBox(
                   width:w* 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.45,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                    ],
                  ),
                ],
              ), SizedBox(
                height: h * 0.05,
              ),
              Row(
                children: [
                  Container(
                    height:h*0.045,
                    width: w*0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.03),
                      color: AppColors.white,

                    ),
                  ),
                  SizedBox(
                   width:w* 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.65,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ), Container(
                        height:h*0.02,
                        width: w*0.45,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.07,
              ),
              Center(
                child: Container(
                  height:h*0.04,
                  width: w*0.4,
                  decoration: BoxDecoration(
                    color: AppColors.white,

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
