import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/send_interest_reason/send_interest_reason_controller.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_appbar.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_radio.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../shimmers/send_interest_shimmer.dart';

class SendInterestReason extends ConsumerWidget {
  String accountId;
  void Function() afterSentCallback;


   SendInterestReason({super.key,required this.accountId,required this.afterSentCallback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(sendInterestControllerProvider(accountId: accountId));
    final controller = ref.read(sendInterestControllerProvider(accountId: accountId).notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: asyncState.when(
          data: (data) => Center(
                child: Container(
                  height: h * 0.9,
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
                                            color: AppColors.black
                                                .withOpacity(0.025),
                                            fontSize: h * 0.052,
                                            fontWeight: FontWeight.w500),
                                        matrimonyStyle: juraTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.025),
                                            fontSize: h * 0.032,
                                            fontWeight: FontWeight.w500))),
                              ),
                              Positioned(
                                bottom: h * 0.1,
                                left: -w * 0.04,
                                child: RotatedBox(
                                    quarterTurns: -1,
                                    child: appNameText(
                                        heavenly: AppText.heavenly,
                                        matrimony: AppText.appName,
                                        containerHeight: w * 0.22,
                                        containerWidth: h * 0.374,
                                        heavenlyStyle: juraTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.025),
                                            fontSize: h * 0.052,
                                            fontWeight: FontWeight.w500),
                                        matrimonyStyle: juraTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.025),
                                            fontSize: h * 0.032,
                                            fontWeight: FontWeight.w500))),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        CommonText(
                                          text: AppText.sendY,
                                          style: juraTextStyle(
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        CommonText(
                                          text: AppText.interest,
                                          style: juraTextStyle(
                                              fontSize: h * 0.04,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: h * 0.04,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            controller.toggleSelected(
                                                AppText.iam); //changed
                                            controller.onPaymentval(1);
                                          },
                                          title: CommonText(
                                            text: AppText.iam,
                                            style: juraTextStyle(
                                                fontSize: h * 0.022,
                                                color: AppColors.gray,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          leading: CustomRadio(
                                            size: h * 0.03,
                                            value: 1,
                                            groupValue:
                                                controller.selectedmethod,
                                            onChanged: (value) {
                                              controller.onPaymentval(value!);
                                              controller.toggleSelected(
                                                  AppText.iam);
                                            },
                                          ),
                                          // trailing: controller.selectedmethod == 3 ? Image.asset(AppImg.ring) : null,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            controller
                                                .toggleSelected(AppText.you);
                                            controller.onPaymentval(2);
                                          },
                                          title: CommonText(
                                            text: AppText.you,
                                            style: juraTextStyle(
                                                fontSize: h * 0.022,
                                                color: AppColors.gray,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          leading: CustomRadio(
                                            size: h * 0.03,
                                            value: 2,
                                            groupValue:
                                                controller.selectedmethod,
                                            onChanged: (value) {
                                              controller.onPaymentval(value!);
                                              controller
                                                  .toggleSelected(AppText.you);

                                            },
                                          ),
                                          // trailing: controller.selectedmethod == 3 ? Image.asset(AppImg.ring) : null,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            controller
                                                .toggleSelected(AppText.our);
                                            controller.onPaymentval(3);
                                          },
                                          title: CommonText(
                                            text: AppText.our,
                                            style: juraTextStyle(
                                                fontSize: h * 0.022,
                                                color: AppColors.gray,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          leading: CustomRadio(
                                            size: h * 0.03,
                                            value: 3,
                                            groupValue:
                                                controller.selectedmethod,
                                            onChanged: (value) {
                                              controller.onPaymentval(value!);
                                              controller
                                                  .toggleSelected(AppText.our);
                                            },
                                          ),
                                          // trailing: controller.selectedmethod == 3 ? Image.asset(AppImg.ring) : null,
                                        ),
                                        SizedBox(
                                          height: h * 0.04,
                                        ),
                                        CommonButton(
                                          containerwidth: w * 0.4,
                                          containerheight: h * 0.06,
                                          // backgroundColor: AppColors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(h * 0.01),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(h * 0.01),
                                            gradient: commonGradient(),
                                          ),
                                          text: AppText.send,
                                          textStyle: juraTextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: h * 0.018,
                                          ),
                                          onPressed: () async {
                                            if (controller.selectReason=="") {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Please select a reason before sending interest.'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                ),
                                              );
                                            } else {
                                               controller
                                                  .onCreateSendInterestDetail(afterCallback:    afterSentCallback);

                                            }

                                            // commonNavigator(
                                            //     context: context,
                                            //     child: BrideDetails(),
                                            //     type: PageTransitionType.fade);
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
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller.isLoading) {
              return SendInterestShimmer();
            }
          }),
    );
  }
}
