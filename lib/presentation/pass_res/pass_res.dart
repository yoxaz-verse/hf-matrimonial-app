import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/pass_res/pass_res_controller.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';

import '../../application/validate/validate.dart';
import '../error/error_screen.dart';
import '../shimmers/password_reset_shimmer.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(passwordResScreenControllerProvider);
    controller() => ref.read(passwordResScreenControllerProvider.notifier);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingicon: false,
        suffixicon: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // commonNavigator(
            //     context: context,
            //     child: const ProfilePageScreen(),
            //     type: PageTransitionType.fade);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.005),
      ),
      body: asyncState.when(
          data: (data) => Stack(
                children: [
                  Positioned(
                    bottom: h * 0.1,
                    top: 0,
                    right: -w * 0.04,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: appNameText(
                            heavenly: AppText.heavenly.toUpperCase(),
                            matrimony: AppText.appName.toUpperCase(),
                            containerHeight: h * 0.068,
                            containerWidth: w,
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
                            heavenly: AppText.heavenly.toUpperCase(),
                            matrimony: AppText.appName.toUpperCase(),
                            containerHeight: h * 0.068,
                            containerWidth: w,
                            heavenlyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.019),
                                fontSize: h * 0.052,
                                fontWeight: FontWeight.w500),
                            matrimonyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.05),
                                fontSize: h * 0.032,
                                fontWeight: FontWeight.w500))),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CommonText(
                              text: AppText.passwordreset,
                              style: juraTextStyle(
                                  fontSize: h * 0.04, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.13,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: AppText.enterMail,
                                    style: juraTextStyle(
                                      fontSize: h * 0.025,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  CommonText(
                                    text: AppText.passwordreset,
                                    style: juraTextStyle(
                                        fontSize: h * 0.04,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: h * 0.01),
                                    child: TextInputField(
                                      hintText: AppText.emailhintText,
                                      counterStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().isSubmit == true
                                          ? validateEmail(
                                          controller().emailIdController.text)
                                          : null,
                                      errorStyle: juraTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      lableStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      textstyle: juraTextStyle(
                                          color: AppColors.textColor,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      titletextstyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.3),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().emailIdController,
                                      keyboardType: TextInputType.text,
                                      containerwidth: w,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black.withOpacity(0.2),
                                          blurRadius: h * 0.1,
                                          blurStyle: BlurStyle.inner,
                                        )
                                      ],
                                      containercolor:
                                          AppColors.white.withOpacity(0.6),
                                      textCapitalization: TextCapitalization.none,
                                      borderRadius: BorderRadius.circular(10),
                                      underline: false,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: h * 0.01),
                                    child: TextInputField(
                                      hintText: AppText.enterCurrentPassword,
                                      counterStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().isSubmit == true
                                          ? validatePassword(
                                          controller().currentPasswordController.text)
                                          : null,
                                      errorStyle: juraTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      lableStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      textstyle: juraTextStyle(
                                          color: AppColors.textColor,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      titletextstyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.3),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().currentPasswordController,
                                      keyboardType: TextInputType.text,
                                      containerwidth: w,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black.withOpacity(0.2),
                                          blurRadius: h * 0.1,
                                          blurStyle: BlurStyle.inner,
                                        )
                                      ],
                                      containercolor:
                                      AppColors.white.withOpacity(0.6),
                                      textCapitalization: TextCapitalization.none,
                                      borderRadius: BorderRadius.circular(10),
                                      underline: false,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: h * 0.01),
                                    child: TextInputField(
                                      hintText: AppText.enterNewPassword,
                                      counterStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().isSubmit == true
                                          ? validateConfirmPassword(
                                          controller().newPasswordController.text, controller().currentPasswordController.text)
                                          : null,
                                      errorStyle: juraTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      lableStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      textstyle: juraTextStyle(
                                          color: AppColors.textColor,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      titletextstyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.1),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: juraTextStyle(
                                          color: AppColors.black.withOpacity(0.3),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().newPasswordController,
                                      keyboardType: TextInputType.text,
                                      containerwidth: w,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black.withOpacity(0.2),
                                          blurRadius: h * 0.1,
                                          blurStyle: BlurStyle.inner,
                                        )
                                      ],
                                      containercolor:
                                      AppColors.white.withOpacity(0.6),
                                      textCapitalization: TextCapitalization.none,
                                      borderRadius: BorderRadius.circular(10),
                                      underline: false,
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.04,
                                  ),
                                  Center(
                                    child: CommonButton(
                                        containerwidth: w * 0.4,
                                        containerheight: h * 0.05,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(h * 0.015)),
                                        text: AppText.done,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(h * 0.005),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 4,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                            gradient: commonGradient()),
                                        textStyle: juraTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        onPressed: () async  {
                                          await controller().onDoneTap();
                                          Navigator.pop(context);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
              return PasswordResetShimmer();
            }
          }),
    );
  }
}
