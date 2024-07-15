import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class SubscriptionShimmer extends ConsumerWidget {
  const SubscriptionShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.035),
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.only(top:h*0.08),
              child: Center(
                child: Container(
                  height: h * 0.8,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                    //   color: AppColors.white,
                    borderRadius:BorderRadius.circular(h * 0.015),
                    border: Border.all(
                        color: AppColors.white, width: w * 0.02),

                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.07),
                        spreadRadius: w * 0.005,
                        blurRadius: w * 0.015,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: h * 0.029),
                      Row(
                        children: [
                          Container(
                            height: h * 0.05,
                            width: w *0.15,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:BorderRadius.circular(h * 0.01),
                            ),
                          ),
                          SizedBox(width: h * 0.01),
                          Container(
                            height: h * 0.05,
                            width: w *0.6,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:BorderRadius.circular(0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.05,),
                      Center(
                        child: Container(
                          height: h * 0.5,
                          width: w *0.8,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(h * 0.015),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.03,),
                      Center(
                        child: Container(
                          height: h * 0.050,
                          width: w *0.4,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(h * 0.005),
                          ),
                        ),
                      ),SizedBox(height: h * 0.03,),
                      Center(
                        child: Container(
                          height: h * 0.04,
                          width: w *0.8,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.only(
                              topRight:Radius.circular(h*0.012),
                                topLeft:Radius.circular(h * 0.012),

                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}