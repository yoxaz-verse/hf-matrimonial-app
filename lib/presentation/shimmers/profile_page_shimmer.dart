import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePageShimmer extends ConsumerWidget {
  const ProfilePageShimmer({super.key});

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

            child: Column(
              children: [
                SizedBox(height: h*0.12,),
                Center(
                  child: Container(
                    height: h * 0.65,
                    width: w * 0.8,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                     Container(
                       height: h * 0.15,
                       width: w * 0.8,
                       decoration: BoxDecoration(
                         color: AppColors.white,
                       ),
                     ),

                        SizedBox(height: h * 0.06,),
                        Padding(
                          padding:  EdgeInsets.only(left: w*0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.35,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: w * 0.02,),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.40,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: w * 0.02,),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.50,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: h* 0.02,),
                              Divider(
                                color: AppColors.white,
                                thickness: 2,
                              ),
                              SizedBox(height: h * 0.02,),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.35,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: w * 0.02,),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.45,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: w * 0.02,),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04,),
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.55,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}