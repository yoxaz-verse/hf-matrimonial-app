import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/common_components/text_input_field.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_appbar.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_radio.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../shimmers/delete_account_shimmer.dart';
import 'delete_account_controller.dart';

class DeleteAccountScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(deleteAccountControllerProvider);
     controller() => ref.read(deleteAccountControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04, top: h * 0.02),
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
          Navigator.pop(context);
            // commonNavigator(
            //     context: context,
            //     child: MyAccountScreen(),
            //     type: PageTransitionType.fade);
          },
        ),
      ),
      body: asyncState.when(
          data: (data) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [

                    Positioned(
                      top: h * 0.06,
                      left: w * 0.6,
                      child: Image.asset(
                        AppImg.ringbg,
                        height: h * 0.2,
                        width: w * 0.6,
                      ),
                    ),
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
                    Positioned(
                      bottom: -h * 0.01,
                      left: -w * 0.1,
                      child: Image.asset(
                        AppImg.ringbg,
                        height: h * 0.2,
                        width: w * 0.6,
                      ),
                    ),
                    Positioned(
                      bottom: -h * 0.01,
                      left: w * 0.5,
                      child: Image.asset(
                        AppImg.rose,
                        height: h * 0.2,
                        width: w * 0.5,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: AppText.reasonFor,
                                  style: juraTextStyle(
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                CommonText(
                                  text: AppText.
                                  delete,
                                  style: juraTextStyle(
                                      fontSize: h * 0.04,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                ListTile(
                                  onTap: () {
                                    controller().onPaymentval(1);
                                  },
                                  title: CommonText(
                                    text: AppText.not,
                                    style: juraTextStyle(
                                        fontSize: h * 0.024,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: CustomRadio(
                                    size: h * 0.03,
                                    value: 1,
                                    groupValue: controller().selectedmethod,
                                    onChanged: (value) {
                                      controller().onPaymentval(value!);
                                    },
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    controller().onPaymentval(2);
                                  },
                                  title: CommonText(
                                    text: AppText.lifePartner,
                                    style: juraTextStyle(
                                        fontSize: h * 0.024,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: CustomRadio(
                                    size: h * 0.03,
                                    value: 2,
                                    groupValue: controller().selectedmethod,
                                    onChanged: (value) {
                                      controller().onPaymentval(value!);
                                    },
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    controller().onPaymentval(3);
                                  },
                                  title: CommonText(
                                    text: AppText.oreason,
                                    style: juraTextStyle(
                                        fontSize: h * 0.024,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: CustomRadio(
                                    size: h * 0.03,
                                    value: 3,
                                    groupValue: controller().selectedmethod,
                                    onChanged: (value) {
                                      controller().onPaymentval(value!);
                                    },
                                  ),
                                  // trailing: controller().selectedmethod == 3 ?
                                  // TextInputField(
                                  //   hintText: AppText.otherReason,
                                  //   counterStyle: juraTextStyle(
                                  //       color: AppColors.black.withOpacity(0.2),
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   errorStyle: juraTextStyle(
                                  //       color: AppColors.red,
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   lableStyle: juraTextStyle(
                                  //       color: AppColors.gray,
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   textstyle: juraTextStyle(
                                  //       color: AppColors.gray,
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   titletextstyle: juraTextStyle(
                                  //       color: AppColors.gray,
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   hintStyle: juraTextStyle(
                                  //       color: AppColors.gray,
                                  //       fontSize: h * 0.02,
                                  //       fontWeight: FontWeight.w400),
                                  //   controller(): controller().otherReasonController,
                                  //   keyboardType: TextInputType.text,
                                  //   containerwidth: w * 0.5,
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: AppColors.black.withOpacity(0.2),
                                  //       blurRadius: h * 0.1,
                                  //       blurStyle: BlurStyle.inner,
                                  //     )
                                  //   ],
                                  //   containercolor: AppColors.white.withOpacity(0.6),
                                  //   textCapitalization: TextCapitalization.none,
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   underline: false,
                                  // ): null,
                                ),
                                Container(
                                  child: controller().selectedmethod == 3
                                      ? TextInputField(
                                    hintText: AppText.otherReason,
                                    counterStyle: juraTextStyle(
                                        color: AppColors.black
                                            .withOpacity(0.2),
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    errorStyle: juraTextStyle(
                                        color: AppColors.red,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    lableStyle: juraTextStyle(
                                        color: AppColors.gray,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    textstyle: juraTextStyle(
                                        color: AppColors.gray,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    titletextstyle: juraTextStyle(
                                        color: AppColors.gray,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    hintStyle: juraTextStyle(
                                        color: AppColors.gray,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400),
                                    controller:
                                    controller().otherReasonController,
                                    keyboardType: TextInputType.text,
                                    containerwidth: w * 0.7,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black
                                            .withOpacity(0.2),
                                        blurRadius: h * 0.1,
                                        blurStyle: BlurStyle.inner,
                                      )
                                    ],
                                    containercolor:
                                    AppColors.white.withOpacity(0.6),
                                    textCapitalization:
                                    TextCapitalization.none,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    underline: false,
                                  )
                                      : null,
                                ),
                                SizedBox(
                                  height: h * 0.1,
                                ),
                                Center(
                                  child: CommonButton(
                                    containerwidth: w * 0.4,
                                    containerheight: h * 0.06,
                                    // backgroundColor: AppColors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: commonGradient(),
                                    ),
                                    text: AppText.done,
                                    textStyle: juraTextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: h * 0.018,
                                    ),
                                    onPressed: () {
                                      controller().onDeleteTap();

                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller().isLoading) {
              return DeleteAccountShimmer();
            }
          }),
    );
  }
}
