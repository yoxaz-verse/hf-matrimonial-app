import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';

import '../../../utils/color.dart';
import '../bride.dart';
import 'bride_family_detail_controller.dart';

class BrideFamilyDetails extends ConsumerWidget {
  const BrideFamilyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(brideFamilyDetailsControllerProvider);
    controller() => ref.read(brideFamilyDetailsControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: h * 0.005, right: h * 0.005),
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppText.b_family,
            style: juraTextStyle(
              fontSize: h * 0.024,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: h * 0.015),
          CommonListView(
            itemCount: controller().familyDetails.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            width: w,
            height: h * 0.31,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(h * 0.01),
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
                        text: controller().familyDetails[index].keys.first,
                        style: juraTextStyle(fontSize: h * 0.02),
                      ),
                      CommonText(
                        text: controller().familyDetails[index].values.first,
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
