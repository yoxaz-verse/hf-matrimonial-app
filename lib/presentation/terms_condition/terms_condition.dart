import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/home_page/home_page_screen.dart';
import 'package:heavenlymatrimony/presentation/terms_condition/terms_condition_controller.dart';
import 'package:heavenlymatrimony/utils/common_components/common_iconbutton.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_appbar.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../profile_page/profile_page.dart';
import '../shimmers/terms_condition_shimmer.dart';

class TermsAndConditions extends ConsumerStatefulWidget {
  const TermsAndConditions({super.key});

  @override
  ConsumerState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends ConsumerState<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(termsAndConditionScreenControllerProvider);
    controller() =>
        ref.read(termsAndConditionScreenControllerProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: Colors.white,
        suffixicon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: asyncState.when(
          data: (data) => SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all( h * 0.022),
                      child: Container(
                        // height: h,
                        child: Card(
                      shadowColor: AppColors.black,
                      elevation: 7,
                      child: Container(
                        padding: EdgeInsets.all(h * 0.007),
                        width: w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(h * 0.015),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(h * 0.007),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: h * 0.08,
                                  width: w * 0.3,
                                  child: Image.asset(
                                    AppImg.ring,
                                    fit: BoxFit.fill,
                                    opacity: const AlwaysStoppedAnimation(.1),
                                    color: Colors.white.withOpacity(0.05),
                                    colorBlendMode: BlendMode.lighten,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(h * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: CommonText(
                                      text: AppText.terms,
                                      style: juraTextStyle(
                                          fontSize: h * 0.028,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.07,
                                  ),
                                  CommonText(
                                    textAlign: TextAlign.center,
                                    text: AppText.privacy,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: h * 0.022),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  CommonText(
                                    text: AppText.privacycon,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: h * 0.017),
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  CommonText(
                                    textAlign: TextAlign.center,
                                    text: AppText.info,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: h * 0.022),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  CommonText(
                                    text: AppText.infocon,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: h * 0.017),
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  CommonText(
                                    textAlign: TextAlign.center,
                                    text: AppText.infopolicy,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: h * 0.022),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  CommonText(
                                    text: AppText.infopolicycon,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: h * 0.017),
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  CommonText(
                                    textAlign: TextAlign.center,
                                    text: AppText.SubPolicy,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: h * 0.022),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  CommonText(
                                    text: AppText.SubPolicycon,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: h * 0.017),
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  CommonText(
                                    textAlign: TextAlign.center,
                                    text: AppText.changepolicy,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: h * 0.022),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  CommonText(
                                    text: AppText.changepolicycon,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: h * 0.017),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(h * 0.01),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: h * 0.15,
                                  width: w * 0.55,
                                  child: Image.asset(
                                    AppImg.ring,
                                    fit: BoxFit.fill,
                                    opacity: const AlwaysStoppedAnimation(.1),
                                    color: Colors.white.withOpacity(0.02),
                                    colorBlendMode: BlendMode.lighten,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                                        ),
                                      ),
                    )),
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller().isLoading) {
              return TermsConditionShimmer();
            }
          }),
    );
  }
}
