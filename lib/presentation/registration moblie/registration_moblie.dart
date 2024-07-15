import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/presentation/registration%20moblie/registration_moblie_controller.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/common_components/text_input_field.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../shimmers/registration_mobile_shimmer.dart';

class RegistrationMobile extends ConsumerWidget {
  String phoneNo;
  String email;
  bool fromRegister;
  RegistrationMobile(
      {Key? key, this.phoneNo = "", this.email = "", this.fromRegister = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(registrationMoblieControllerProvider(
        phoneNo: phoneNo, email: email, fromRegister: fromRegister));
    controller() => ref.read(registrationMoblieControllerProvider(
            phoneNo: phoneNo, email: email, fromRegister: fromRegister)
        .notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: controller().isLoading == true
          ? RegistrationMobShimmer()
          : SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Positioned(
                    top: h * 0.02,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: h * 0.05),
                      height: h * 0.4,
                      width: w * 0.6,
                      child: Image.asset(
                        AppImg.topRing,
                        fit: BoxFit.fill,
                        color: AppColors.white.withOpacity(0.02),
                        colorBlendMode: BlendMode.lighten,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.12,
                    child: Container(
                      padding: EdgeInsets.only(top: h * 0.05),
                      height: h * 0.4,
                      width: w * 0.6,
                      child: Image.asset(
                        AppImg.bottomRing,
                        fit: BoxFit.fill,
                        color: AppColors.white.withOpacity(0.02),
                        colorBlendMode: BlendMode.lighten,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: h * 0.07, right: h * 0.07),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: h * 0.15),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: AppText.enteryour,
                                style: juraTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CommonText(
                                text: AppText.mobilenumberand,
                                style: juraTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CommonText(
                                text: AppText.mailid,
                                style: juraTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        TextInputField(
                          hintText: AppText.entermoblienumber,
                          underline: false,
                          controller: controller().phoneController,
                          errorText: controller().isSubmit == true
                              ? validatePhone(controller().phoneController.text)
                              : null,
                          errorStyle: juraTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          textstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          counterStyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: juraTextStyle(
                              color: AppColors.gray,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.number,
                          containerwidth: w,
                          borderRadius: BorderRadius.circular(5),
                          containercolor: AppColors.black.withOpacity(0.05),
                          textCapitalization: TextCapitalization.none,
                          prefix: const SizedBox(),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        TextInputField(
                          hintText: AppText.enteremailid,
                          underline: false,
                          errorText: controller().isSubmit == true
                              ? validateEmail(
                                  controller().emailidController.text)
                              : null,
                          errorStyle: juraTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          borderRadius: BorderRadius.circular(5),
                          textstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          counterStyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          controller: controller().emailidController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          containercolor: AppColors.black.withOpacity(0.05),
                          textCapitalization: TextCapitalization.none,
                          prefix: const SizedBox(),
                        ),
                        SizedBox(
                          height: h * 0.08,
                        ),
                        CommonButton(
                            containerwidth: w * 0.4,
                            containerheight: h * 0.05,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: commonGradient(),
                            ),
                            text: AppText.done,
                            textStyle: juraTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              controller().onSubmitTap(context);
                            }),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        CommonButton(
                            containerwidth: w * 0.4,
                            containerheight: h * 0.05,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: commonGradient(),
                            ),
                            text: AppText.skipForNow,
                            textStyle: juraTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  Globals.navigatorKey.currentContext!,
                                  PageTransition(
                                      child: AfterBottomBar(),
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 200)),
                                  (Route<dynamic> route) {
                                return false;
                              });
                              // if (fromRegister) {
                              //   Navigator.push(
                              //     Globals.navigatorKey.currentContext!,
                              //     PageTransition(
                              //         child:
                              //             MyAccountScreen(frromRegister: true),
                              //         type: PageTransitionType.fade,
                              //         duration:
                              //             const Duration(milliseconds: 200)),
                              //   );
                              // }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
