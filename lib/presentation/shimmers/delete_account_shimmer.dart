import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class DeleteAccountShimmer extends ConsumerWidget {
  const DeleteAccountShimmer({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.08),
              Container(
                height: h * 0.03,
                width: w * 0.4,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.circular(0),
                ),
              ),
              SizedBox(height: h * 0.01,),
              Container(
                height: h * 0.055,
                width: w * 0.78,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.circular(0),
                ),
              ),
              SizedBox(height: h * 0.15,),
              Row(
                children: [
                  Container(
                    height: h * 0.045,
                    width: w * 0.1,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(h * 0.03),
                    ),
                  ),
                  SizedBox(width: h * 0.03,),
                  Container(
                    height: h * 0.03,
                    width: w * 0.50,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01,),
              Row(
                children: [

                  Container(
                    height: h * 0.045,
                    width: w * 0.1,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(h * 0.03),
                    ),
                  ),
                  SizedBox(width: h * 0.03,),
                  Container(
                    height: h * 0.03,
                    width: w * 0.55,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01,),
              Row(
                children: [
                  Container(
                    height: h * 0.045,
                    width: w * 0.1,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(h * 0.03),
                    ),
                  ),
                  SizedBox(width: h * 0.03,),
                  Container(
                    height: h * 0.03,
                    width: w * 0.45,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.06,),
              Center(
                child: Container(
                  height: h * 0.05,
                  width: w * 0.43,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:BorderRadius.circular(h * 0.01),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}