import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/before_bottom_bar_controller.dart';

import '../../application/validate/validate.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/common_components/text_input_field.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../shimmers/contact_shimmer.dart';
import 'contact_controller.dart';

class contact extends ConsumerWidget {
  bool isFromHomeScreen;
  contact({Key? key, this.isFromHomeScreen = true}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(contactControllerProvider);
    controller() => ref.read(contactControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: asyncState.when(
          data: (data) => SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          left: w * 0.0,
                          bottom: -h * 0.02,
                          child: Container(
                            height: h * 0.34,
                            width: w * 0.9,
                            child: Image.asset(
                              AppImg.Leaf,
                              fit: BoxFit.contain,
                              color: AppColors.white.withOpacity(0.8),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                        ),
                        Positioned(
                          right: w * 0.01,
                          top: h * 0.01,
                          child: Container(
                            height: h * 0.24,
                            width: w * 0.34,
                            child: Image.asset(
                              AppImg.ringimg,
                              fit: BoxFit.contain,
                              color: AppColors.white.withOpacity(0.8),
                              colorBlendMode: BlendMode.lighten,
                            ),
                          ),
                        ),
                        Positioned(
                          right: w * 0.026,
                          top: h * 0.05,
                          child: IconButton(
                            onPressed: () {
                              if (isFromHomeScreen == false) {
                                Navigator.pop(context);
                              } else {
                                ref
                                    .read(bottomBarControllerProvider.notifier)
                                    .onItemTapped(0);
                              }
                              // commonNavigator(
                              //   context: context,
                              //   child: HomePage(),
                              //   type: PageTransitionType.fade,
                              // );
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: h * 0.08,
                                width: w * 0.35,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: w * 0.31,
                                      height: h * 0.031,
                                      child: CommonText(
                                        text: AppText.getin,
                                        style: juraTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.022,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: h * 0.004,
                                      child: Container(
                                        height: h * 0.06,
                                        width: w * 0.4,
                                        child: CommonText(
                                          text: AppText.touch,
                                          style: juraTextStyle(
                                            color: AppColors.black,
                                            fontSize: h * 0.042,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    AppImg.cake,
                                    height: h * 0.5,
                                    width: w,
                                    fit: BoxFit.cover,
                                    color: AppColors.textColor.withOpacity(0.7),
                                    colorBlendMode: BlendMode.srcOver,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(h * 0.03),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: AppText.Heavenly,
                                          style: juraTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                            fontSize: h * 0.028,
                                          ),
                                        ),
                                        CommonText(
                                          text: AppText.Matrimony,
                                          style: juraTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white,
                                            fontSize: h * 0.042,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        CommonText(
                                          text: AppText.address,
                                          style: juraTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                            fontSize: h * 0.025,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        CommonText(
                                          text: AppText.contactPageAddress,
                                          style: juraTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                            fontSize: h * 0.023,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                              text: AppText.contact,
                                              style: juraTextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                                fontSize: h * 0.023,
                                              ),
                                            ),
                                            CommonText(
                                              text: AppText.contactPageNumber,
                                              style: juraTextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                                fontSize: h * 0.023,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: AppColors.white,
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                              text: AppText.contactPageEmail,
                                              style: juraTextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                                fontSize: h * 0.023,
                                              ),
                                            ),
                                            CommonText(
                                              text: AppText.contactPageEmailId,
                                              style: juraTextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                                fontSize: h * 0.023,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: AppColors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(h * 0.02),
                                  child: Column(
                                    children: [
                                      TextInputField(
                                        hintText: AppText.urName,
                                        hintStyle: juraTextStyle(
                                          fontSize: h * 0.024,
                                          color: AppColors.textGreyColor,
                                        ),
                                        errorText: controller().isSubmit == true
                                            ? validate(
                                            controller().nameController.text)
                                            : null,
                                        errorStyle: juraTextStyle(
                                            color: AppColors.red,
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400),
                                        controller: controller().nameController,
                                        keyboardType: TextInputType.text,
                                        containerwidth: w,
                                        containercolor: AppColors.transparent,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),
                                      TextInputField(
                                        hintText: AppText.emailid,
                                        hintStyle: juraTextStyle(
                                          fontSize: h * 0.024,
                                          color: AppColors.textGreyColor,
                                        ),
                                        errorText: controller().isSubmit == true
                                            ? validateEmail(
                                            controller().emailController.text)
                                            : null,
                                        errorStyle: juraTextStyle(
                                            color: AppColors.red,
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400),
                                        controller: controller().emailController,
                                        keyboardType: TextInputType.text,
                                        containerwidth: w,
                                        containercolor: AppColors.transparent,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),   TextInputField(
                                        hintText: AppText.phoneNo,
                                        hintStyle: juraTextStyle(
                                          fontSize: h * 0.024,
                                          color: AppColors.textGreyColor,
                                        ),
                                        errorText: controller().isSubmit == true
                                            ? validatePhone(
                                            controller().phoneController.text)
                                            : null,
                                        errorStyle: juraTextStyle(
                                            color: AppColors.red,
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400),
                                        controller: controller().phoneController,
                                        keyboardType: TextInputType.text,
                                        containerwidth: w,
                                        containercolor: AppColors.transparent,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),
                                      TextInputField(
                                        hintText: AppText.message,
                                        hintStyle: juraTextStyle(
                                          fontSize: h * 0.024,
                                          color: AppColors.textGreyColor,
                                        ),
                                        errorText: controller().isSubmit == true
                                            ? validate(
                                            controller().messageController.text)
                                            : null,
                                        errorStyle: juraTextStyle(
                                            color: AppColors.red,
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400),
                                        controller: controller().messageController,
                                        keyboardType: TextInputType.text,
                                        containerwidth: w,
                                        containercolor: AppColors.transparent,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),
                                      SizedBox(
                                        height: h * 0.03,
                                      ),
                                      CommonButton(
                                        containerwidth: w * 0.4,
                                        containerheight: h * 0.05,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.015),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.005),
                                          gradient: commonGradient(),
                                        ),
                                        text: AppText.send,
                                        textStyle: juraTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.024,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        onPressed: () {
                                          controller().onCreateEnquires(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
              return ContactShimmer();
            }
          }),
    );
  }
}
