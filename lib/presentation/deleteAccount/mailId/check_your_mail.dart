import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/deleteAccount/delete_Account.dart';
import 'package:heavenlymatrimony/presentation/home_page/home_page_screen.dart';
import 'package:heavenlymatrimony/utils/common_components/common_iconbutton.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/text.dart';
import 'check_your_mail_controller.dart';

class CheckYourMail extends ConsumerWidget {
  CheckYourMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(checkMailControllerProvider);
    final controller = ref.read(checkMailControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      insetPadding: EdgeInsets.only(
        bottom: h * 0.38,
        top: h * 0.1,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: Stack(
        children: [
          Positioned(
            bottom: h * 0.0,
            top: 0,
            right: -w * 0.08,
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
            bottom: h * 00,
            top: 0,
            left: -w * 0.08,
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
          Container(
            width: w * 1,
            height: h * 0.5,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: CommonIconButton(
                          containerwidth: w * 0.1,
                          containerheight: h * 0.02,
                          backgroundColor: AppColors.transparent,
                          shape: LinearBorder.none,
                          centericon: const Icon(CupertinoIcons.back),
                          onPressed: () {
                            commonNavigator(
                                context: context,
                                child: DeleteAccountScreen(),
                                type: PageTransitionType.fade);
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                CommonText(
                  text: AppText.idd,
                  style: juraTextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                CommonText(
                  text: AppText.mail,
                  style: juraTextStyle(
                      fontSize: h * 0.04, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: h * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: TextInputField(
                    hintText: AppText.idd,
                    counterStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.2),
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
                    controller: controller.emailController,
                    keyboardType: TextInputType.text,
                    containerwidth: w * 0.9,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        blurRadius: h * 0.1,
                        blurStyle: BlurStyle.inner,
                      )
                    ],
                    containercolor: AppColors.white.withOpacity(0.6),
                    textCapitalization: TextCapitalization.none,
                    borderRadius: BorderRadius.circular(10),
                    underline: false,
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
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
                      text: AppText.send,
                      textStyle: juraTextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: h * 0.018,
                      ),
                      onPressed: () {
                        commonNavigator(
                            context: context,
                            child: const HomePage(),
                            type: PageTransitionType.fade);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
