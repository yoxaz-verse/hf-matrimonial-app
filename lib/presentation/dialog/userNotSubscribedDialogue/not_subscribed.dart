import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/import_utils.dart';

class SingleButtonDialogue extends ConsumerWidget {
  String titleText;
  String subtitleText;
  String buttonText;
  String? keyId;
  bool backButtonCanDismiss;
  void Function() onYesPressed;

  SingleButtonDialogue(
      {super.key,
        required this.titleText,
        this.keyId,
        this.backButtonCanDismiss = true,
        required this.subtitleText,
        required this.buttonText,
        required this.onYesPressed,
        });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return backButtonCanDismiss == true?AlertDialog(
      key:Globals.alertKey,
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      title: CommonText(
          text: titleText,
          style: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    AppColors.colorPrimary,
                    AppColors.colorSecondary
                  ],
                ).createShader(const Rect.fromLTRB(100, 0, 180, 100)),
              fontSize: h * 0.025,
              fontWeight: FontWeight.w600)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      buttonPadding: EdgeInsets.zero,
      actionsPadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: CommonText(
          text: subtitleText,
          style: TextStyle(
              color: AppColors.black,
              fontSize: h * 0.02,
              fontWeight: FontWeight.w600)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
                containerwidth: w * 0.5,
                containerheight: h * 0.05,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: commonGradient(),
                ),
                text: buttonText,
                textStyle: juraTextStyle(
                  color: AppColors.white,
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  onYesPressed();
                }),
          ],
          
        ),
      ],
    ): WillPopScope(
      onWillPop: () async {

        DialogServiceV1().areYouSureDialogue(barriertransperent: true,titleText: "Are you sure you want to exit?",yesText: "Exit",onYesPressed: (){              SystemNavigator.pop();
        }, subtitleText: '',onNoPressed: (){Navigator.pop(context);},noText: "no");



        return false;
      },
      child: AlertDialog(
        key:Globals.alertKey,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        titlePadding:
        EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
        title: CommonText(
            text: titleText,
            style: TextStyle(
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      AppColors.colorPrimary,
                      AppColors.colorSecondary
                    ],
                  ).createShader(const Rect.fromLTRB(100, 0, 180, 100)),
                fontSize: h * 0.025,
                fontWeight: FontWeight.w600)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding:
        EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
        buttonPadding: EdgeInsets.zero,
        actionsPadding:
        EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
        iconPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
        content: CommonText(
            text: subtitleText,
            style: TextStyle(
                color: AppColors.black,
                fontSize: h * 0.02,
                fontWeight: FontWeight.w600)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonButton(
                  containerwidth: w * 0.5,
                  containerheight: h * 0.05,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: commonGradient(),
                  ),
                  text: buttonText,
                  textStyle: juraTextStyle(
                    color: AppColors.white,
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                  onPressed: () {
             onYesPressed();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
