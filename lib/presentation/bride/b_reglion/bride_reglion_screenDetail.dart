import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bride/bride.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';

import '../../../utils/color.dart';
import '../b_fullDetails/bride_Full_Details_controller.dart';
import 'bride_reglion_screenDetail_controller.dart';

class BrideRegDetails extends ConsumerWidget {
  const BrideRegDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final asyncState = ref.watch(brideReglionscreenDetailsControllerProvider);
    controller() =>
        ref.read(brideReglionscreenDetailsControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppText.religious_inf,
            style: juraTextStyle(
              fontSize: h * 0.024,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: h * 0.01),
          CommonListView(
            itemCount: controller().religiousInfo.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            width: w,
            height: h * 0.1,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(h * 0.009),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grey,
                        width: h * 0.001,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: controller().religiousInfo[index].keys.first,
                        style: juraTextStyle(fontSize: h * 0.02),
                      ),
                      CommonText(
                        text: controller().religiousInfo[index].values.first,
                        style: juraTextStyle(
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: h * 0.04),
          CommonText(
            text: AppText.edu,
            style: juraTextStyle(
              fontSize: h * 0.024,
              // decoration: TextDecoration.underline,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: h * 0.015),
          CommonListView(
            itemCount: controller().eduAndCarrier.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            width: w,
            height: h * 0.3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(h * 0.009),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grey,
                        width: h * 0.001,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: controller().eduAndCarrier[index].keys.first,
                        style: juraTextStyle(fontSize: h * 0.02),
                      ),
                      CommonText(
                        text: controller().eduAndCarrier[index].values.first,
                        style: juraTextStyle(
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
