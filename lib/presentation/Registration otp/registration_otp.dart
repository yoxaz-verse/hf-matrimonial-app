import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/common_components/text_input_field.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../br_detail/br_detail.dart';
import '../error/error_screen.dart';
import '../my_account/my_account_screen.dart';
import '../shimmers/registration_otp_shimmer.dart';
import 'registration_otp_controller.dart';

class RegistrationOtp extends ConsumerWidget {
  final String email;
  final String phoneNo;
  bool fromRegister;
  RegistrationOtp(
      {Key? key,
      required this.email,
      required this.phoneNo,
      this.fromRegister = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
        registrationOtpControllerProvider(email: email, phoneNo: phoneNo));
    controller() => ref.read(
        registrationOtpControllerProvider(email: email, phoneNo: phoneNo)
            .notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: asyncState.when(
            data: (data) => Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
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
                    Align(
                      alignment: Alignment.bottomLeft,
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
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding:
                            EdgeInsets.only(top: h * 0.1, left: w * 0.1),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: AppText.enteryour,
                                  style: juraTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                CommonText(
                                  text: AppText.otpnow,
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
                            controller: controller().phoneController,
                            underline: false,
                            readonly: true,
                            borderRadius: BorderRadius.circular(5),
                            containerheight: h * 0.05,
                            errorStyle: TextStyle(
                                color: AppColors.red,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            titletextstyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            lableStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            textstyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            counterStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            hintStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.8,
                            containercolor: AppColors.black.withOpacity(0.05),
                            textCapitalization: TextCapitalization.none,
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.15),
                            child: Pinput(
                              length: 4,
                              obscureText: false,
                              closeKeyboardWhenCompleted: true,
                              pinAnimationType: PinAnimationType.slide,
                              defaultPinTheme: controller().isPinTheme!,
                              disabledPinTheme: controller().isPinTheme!,
                              errorPinTheme: controller().isPinTheme!,
                              focusedPinTheme: controller().isPinTheme!,
                              followingPinTheme: controller().isPinTheme!,
                              submittedPinTheme: controller().isPinTheme!,
                              keyboardType: TextInputType.number,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              showCursor: true,
                              animationDuration:
                              const Duration(milliseconds: 300),
                              androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                              controller: controller().phoneotpcontroller,
                              animationCurve: Curves.easeInOut,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              isCursorAnimationEnabled: true,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                // controller().verifyOTP();
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.046,
                          ),
                          TextInputField(
                            hintText: AppText.enteremailid,
                            underline: false,
                            readonly: true,
                            containerheight: h * 0.05,
                            borderRadius: BorderRadius.circular(5),
                            errorStyle: TextStyle(
                                color: AppColors.red,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            titletextstyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            lableStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            textstyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            counterStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            hintStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            controller: controller().emailIdController,
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.8,
                            containercolor: AppColors.black.withOpacity(0.05),
                            textCapitalization: TextCapitalization.none,
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.15),
                            child: Pinput(
                              length: 4,
                              obscureText: false,
                              closeKeyboardWhenCompleted: true,
                              pinAnimationType: PinAnimationType.slide,
                              defaultPinTheme: controller().isPinTheme!,
                              disabledPinTheme: controller().isPinTheme!,
                              errorPinTheme: controller().isPinTheme!,
                              focusedPinTheme: controller().isPinTheme!,
                              followingPinTheme: controller().isPinTheme!,
                              submittedPinTheme: controller().isPinTheme!,
                              keyboardType: TextInputType.number,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              showCursor: true,
                              animationDuration:
                              const Duration(milliseconds: 300),
                              androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                              controller: controller().emailotpcontroller,
                              animationCurve: Curves.easeInOut,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              isCursorAnimationEnabled: true,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                // controller().verifyOTP();
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
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
                              text: AppText.verify,
                              textStyle: juraTextStyle(
                                color: AppColors.white,
                                fontSize: h * 0.022,
                                fontWeight: FontWeight.w600,
                              ),
                              onPressed: () {
                                controller().onVerifyTap(context);
                                // commonNavigator(
                                //     context: context,
                                //     child: BrDetailScreen(),
                                //     type: PageTransitionType.fade);
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
                                //         MyAccountScreen(frromRegister: true),
                                //         type: PageTransitionType.fade,
                                //         duration:
                                //         const Duration(milliseconds: 200)),
                                //   );
                                // }
                              }),
                        ],
                      ),
                    ),

                  ],
                ),
            error: (error, stackTrace) {
              return ErrorScreen(
                  text: error.toString(),
                  backgroundColor: AppColors.white,
                  color: AppColors.red);
            },
            loading: () {
              if (controller().isLoading) {
                return RegistrationOtpShimmer();
              }
            }),
      ),
    );
  }
}
