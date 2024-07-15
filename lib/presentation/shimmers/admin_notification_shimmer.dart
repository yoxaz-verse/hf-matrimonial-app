import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class AdminNotificationShimmer extends ConsumerWidget {
  const AdminNotificationShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
        baseColor: AppColors.shimmerGrey,
        highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: SingleChildScrollView(
          physics:  NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h*0.15,),
              Container(
                width: w*0.75,
                height: h*0.06,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.circular(0),
                ),
              ),
              SizedBox(height: h * 0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: h * 0.35,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:BorderRadius.circular(h*0.005),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.01,),
                  Center(
                    child: Container(
                      height: h * 0.35,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:BorderRadius.circular(h*0.005),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.01,),
                  Center(
                    child: Container(
                      height: h * 0.2,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:BorderRadius.circular(h*0.005),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

