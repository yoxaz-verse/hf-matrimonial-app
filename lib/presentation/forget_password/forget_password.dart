import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/presentation/forget_password/forget_password_controller.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/common_components/text_input_field.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../shimmers/registration_mobile_shimmer.dart';

class ForgetPassword extends ConsumerWidget {

  const ForgetPassword({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(forgetPasswordControllerProvider);
    controller() => ref.read(forgetPasswordControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: controller().isLoading == true
          ? RegistrationMobShimmer()
          : SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: h,
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
                      bottom: h * 0.1,
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
                      padding: EdgeInsets.only(left: h * 0.07, right: h * 0.07,top: h * 0.1),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: h * 0.15),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "${AppText.enteryour} ${AppText.mailid}",
                                  style: juraTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                CommonText(
                                  text: AppText.toResetPassword,
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
                            height: h * 0.08,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
