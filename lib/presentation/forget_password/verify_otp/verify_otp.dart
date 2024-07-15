import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/forget_password/verify_otp/verify_otp_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../application/validate/validate.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../error/error_screen.dart';
import '../../shimmers/registration_otp_shimmer.dart';

class VerifyOtp extends ConsumerWidget {
  final String email;

  const VerifyOtp({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(verifyOtpControllerProvider(email: email));
    controller() =>
        ref.read(verifyOtpControllerProvider(email: email).notifier);
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
                            height: h * 0.2,
                            padding:
                            EdgeInsets.only(top: h * 0.1, left: w * 0.1),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text:
                                  "${AppText.enteryour} ${AppText.email} and",
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
                            height: h * 0.03,
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
                          controller().isOTPVerified == false
                              ? CommonButton(
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
                              })
                              : Container(),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          controller().isOTPVerified == true
                              ? TextInputField(
                            hintText: AppText.newPassword,
                            underline: false,
                            containerheight: h * 0.05,
                            borderRadius: BorderRadius.circular(5),
                            errorText: controller().isSubmit == true
                                ? validatePassword(controller()
                                .newPasswordController
                                .text)
                                : null,
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
                            controller:
                            controller().newPasswordController,
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.8,
                            containercolor:
                            AppColors.black.withOpacity(0.05),
                            textCapitalization: TextCapitalization.none,
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                            ),
                          )
                              : Container(),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          controller().isOTPVerified == true
                              ? TextInputField(
                            hintText: AppText.confirmPassword,
                            underline: false,
                            containerheight: h * 0.05,
                            borderRadius: BorderRadius.circular(5),
                            errorText: controller().isSubmit == true
                                ? validateConfirmPassword(
                                controller()
                                    .newPasswordController
                                    .text,
                                controller()
                                    .confirmPasswordController
                                    .text)
                                : null,
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
                            controller:
                            controller().confirmPasswordController,
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.8,
                            containercolor:
                            AppColors.black.withOpacity(0.05),
                            textCapitalization: TextCapitalization.none,
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                            ),
                          )
                              : Container(),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          controller().isOTPVerified == true
                              ? CommonButton(
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
                              onPressed: () async {
                                await controller().onDoneTap();
                              })
                              : Container(),
                        ],
                      ),
                    ),

                  ],
                ),
            error: (error, stackTrace) => ErrorScreen(
                text: error.toString(),
                backgroundColor: AppColors.white,
                color: AppColors.red),
            loading: () {
              if (controller().isLoading) {
                return RegistrationOtpShimmer();
              }
            }),
      ),
    );
  }
}
