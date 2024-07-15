import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bride/b_fullDetails/bride_Full_Details.dart';
import 'package:heavenlymatrimony/presentation/bride/bride.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_appbar.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../send_interest_reason/send_interest_reason_controller.dart';

class SendInterest extends ConsumerWidget {
  String accountId;
   SendInterest({super.key,required this.accountId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(sendInterestControllerProvider(accountId: accountId));
    final controller = ref.read(sendInterestControllerProvider(accountId: accountId).notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingicon: false,
        suffixicon: IconButton(
          onPressed: () {
          Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.025),
      ),
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: h * 0.8,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: h * 0.1,
                      top: 0,
                      right: -w * 0.04,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child: appNameText(
                              heavenly: AppText.heavenly,
                              matrimony: AppText.appName,
                              containerHeight: w * 0.24,
                              containerWidth: h * 0.35,
                              heavenlyStyle: juraTextStyle(
                                  color: AppColors.black.withOpacity(0.019),
                                  fontSize: h * 0.052,
                                  fontWeight: FontWeight.w500),
                              matrimonyStyle: juraTextStyle(
                                  color: AppColors.black.withOpacity(0.019),
                                  fontSize: h * 0.032,
                                  fontWeight: FontWeight.w500))),
                    ),
                    Positioned(
                      bottom: h * 0.1,
                      top: 0,
                      left: -w * 0.04,
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: appNameText(
                              heavenly: AppText.heavenly,
                              matrimony: AppText.appName,
                              containerHeight: w * 0.24,
                              containerWidth: h * 0.35,
                              heavenlyStyle: juraTextStyle(
                                  color: AppColors.black.withOpacity(0.019),
                                  fontSize: h * 0.052,
                                  fontWeight: FontWeight.w500),
                              matrimonyStyle: juraTextStyle(
                                  color: AppColors.black.withOpacity(0.05),
                                  fontSize: h * 0.032,
                                  fontWeight: FontWeight.w500))),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h * 0.05,
                              ),
                              CommonText(
                                text: AppText.sendY,
                                style: TextStyle(
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              CommonText(
                                text: AppText.interest,
                                style: TextStyle(
                                    fontSize: h * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: h * 0.06,
                              ),
                              for (String reason in controller.reasons)
                                ListTile(
                                  leading: Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                      value: controller.isSelected(reason),
                                      onChanged: (value) {
                                        controller.toggleSelected(reason);
                                      },
                                      activeColor: AppColors.gradient2,
                                      checkColor: AppColors.gradient2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.02),
                                      ),
                                    ),
                                  ),
                                  title: CommonText(
                                    text: reason,
                                    style: juraTextStyle(fontSize: h * 0.021),
                                  ),
                                ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              CommonButton(
                                containerwidth: w * 0.4,
                                containerheight: h * 0.06,
                                // backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(h * 0.01),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 0.01),
                                  gradient: commonGradient(),
                                ),
                                text: AppText.send,
                                textStyle: juraTextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.018,
                                ),
                                onPressed: () {
                                  commonNavigator(
                                      context: context,
                                      //todo : accountId
                                      child: BrideDetails(accountId: accountId),
                                      type: PageTransitionType.fade);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -h * 0.045,
              left: w * 0.55,
              child: Image.asset(
                AppImg.ringbg,
                height: h * 0.2,
                width: w * 0.43,
              ),
            ),
            Positioned(
              bottom: -h * 0.01,
              left: -w * 0.15,
              child: Image.asset(
                AppImg.ringbg,
                height: h * 0.2,
                width: w * 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
