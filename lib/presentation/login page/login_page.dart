import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/forget_password/forget_password.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/dialog/dialog_service.dart';
import '../../data/shared_pref/shared_pref.dart';
import '../error/error_screen.dart';
import '../shimmers/login_page_shimmer.dart';
import 'login_page_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(loginPageControllerProvider);
    controller() => ref.read(loginPageControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
            // commonNavigator(
            //     context: context,
            //     child: befor(),
            //     type: PageTransitionType.fade);
          },
        ),
      ),
      body: asyncState.when(
          data: (data) => SingleChildScrollView(
                child: Column(children: [
                  Column(
                    children: [
                      Container(
                        height: h * 0.05,
                        width: w * 0.60,
                        decoration: BoxDecoration(),
                        child: Center(
                          child: CommonText(
                            text: AppText.letsstart,
                            style: juraTextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: h * 0.029),
                          ),
                        ),
                      ),
                      if (controller()
                              .carouselResponse?["data"]?["carousels"]
                              ?.isNotEmpty ??
                          false)
                        CommonCarousel(
                          enlargeFactor: 0.4,
                          dotindicator: true,
                          gradient: true,
                          containerheight: h * 0.2,
                          containerwidth: w,
                          viewportFraction: w / (w * 1),
                          scrollDirection: Axis.horizontal,
                          autoPlayCurve: Curves.bounceIn,
                          onPageChanged: (index, reason) {
                            controller().onPageChanged(index);
                          },
                          aspectRatio: 1 / 1,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          reverse: false,
                          getcurrentPageIndex: controller().getcurrentPageIndex,
                          padding:
                              EdgeInsets.only(right: w * 0.04, left: w * 0.04),
                          carouselHeight: h * 0.30,
                          carouselController: controller().carouselController,
                          disableGesture: false,
                          itemCount: controller()
                                  .carouselResponse?["data"]?["carousels"]
                                  ?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index,
                                  int pageViewIndex) =>
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(h * 0.01),
                                          child: Container(
                                            height: h * 0.25,
                                            width: w * 0.75,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.02),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.black
                                                      .withOpacity(0.19),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(2, 1),
                                                ),
                                                BoxShadow(
                                                  color: AppColors.black
                                                      .withOpacity(0.19),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(-2, -1),
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.02),
                                              child: CachedNetworkImage(
                                                cacheKey:
                                                    controller().carouselResponse?[
                                                                        "data"]?[
                                                                    "carousels"]
                                                                ?[index]?["images"]
                                                            ?["imageName"] ??
                                                        "carousel${index}",
                                                imageUrl:
                                                    "${controller().carouselResponse?["data"]?["carousels"]?[index]?["images"]?["path"] ?? ""}",
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                    stackTrace) {
                                                  return Icon(
                                                    Icons.broken_image_rounded,
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    size: w * 0.1,
                                                  );
                                                },
                                                placeholder: (context, url) {
                                                  return Shimmer.fromColors(
                                                      baseColor:
                                                          AppColors.shimmerGrey,
                                                      highlightColor:
                                                          AppColors.white,
                                                      enabled: true,
                                                      child: Container(
                                                        color: AppColors.grey,
                                                      ));
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: h * 0.01,
                                      left: 0,
                                      right: 0,
                                      child: appNameText(
                                        heavenly:
                                            AppText.heavenly.toUpperCase(),
                                        matrimony:
                                            AppText.appName.toUpperCase(),
                                        containerHeight: h * 0.078,
                                        containerWidth: w,
                                        heavenlyStyle: juraTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.04,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        matrimonyStyle: juraTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.02,
                                          letterSpacing: h * 0.007,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Center(
                              //   child: Image.asset(controller().catList[1],
                              //      height: h * 0.3, width: w * 0.8, fit: BoxFit.cover),
                              // ),
                            ],
                          ),
                        ),
                      if (!(controller()
                              .carouselResponse?["data"]?["carousels"]
                              ?.isNotEmpty ??
                          false))
                        Container(
                          height: h * 0.2,
                        )
                    ],
                  ),
                  /* Padding(
        padding: EdgeInsets.only(left: w * 0.09, right: w * 0.09),
        child: Container(
          color: AppColors.red,
          height: h * 0.3,
          width: w,
          child: Image.asset(
            AppImg.nightwedceremony,
            fit: BoxFit.cover,
            color: AppColors.black.withOpacity(0.0),
            colorBlendMode: BlendMode.lighten,
          ),
        ),
      ),*/

                  Padding(
                    padding: EdgeInsets.only(left: w * 0.1, right: w * 0.11),
                    child: Column(
                      children: [
                        TextInputField(
                          hintText: AppText.usernameid,
                          controller: controller().emailidController,
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.75,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none,
                          underline: false,
                          containerheight: h * 0.04,
                          borderRadius: BorderRadius.zero,
                          containerborder: Border(
                              right: BorderSide.none,
                              left: BorderSide.none,
                              top: BorderSide.none,
                              bottom: BorderSide(
                                color: AppColors.textColor.withOpacity(0.5),
                                width: 1,
                              )),
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
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          prefix: Padding(
                            padding: EdgeInsets.only(right: w * 0.02),
                            child: Image.asset(AppImg.user,
                                height: h * 0.028, width: h * 0.028),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.025,
                        ),
                        TextInputField(
                            hintText: AppText.enterPassword,
                            controller: controller().passwordController,
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.75,
                            containercolor: AppColors.white,
                            textCapitalization: TextCapitalization.none,
                            underline: false,
                            obscureText: true,
                            maxLines: 1,
                            containerheight: h * 0.04,
                            borderRadius: BorderRadius.zero,
                            containerborder: Border(
                                right: BorderSide.none,
                                left: BorderSide.none,
                                top: BorderSide.none,
                                bottom: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.5),
                                  width: 1,
                                )),
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
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: Image.asset(AppImg.padlock,
                                  height: h * 0.03, width: h * 0.03),
                            )),
                        SizedBox(
                          height: h * 0.008,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                commonNavigator(
                                    context: context,
                                    child: ForgetPassword(),
                                    type: PageTransitionType.fade);
                              },
                              child: Container(
                                width: w * 0.75,
                                child: CommonText(
                                    text: AppText.forgotPassword,
                                    style: juraTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.018,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.06),
                          child: CommonButton(
                              containerwidth: w * 0.4,
                              containerheight: h * 0.05,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: commonGradient(),
                              ),
                              text: AppText.Login,
                              textStyle: juraTextStyle(
                                color: AppColors.white,
                                fontSize: h * 0.022,
                                fontWeight: FontWeight.w600,
                              ),
                              onPressed: () {
                                controller().onLoginTap(context);

                                // commonNavigator(
                                //     context: context,
                                //     child: AfterBottomBar(),
                                //     type: PageTransitionType.fade);
                              }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.05, left: w * 0.1, right: w * 0.11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (Platform.isAndroid)
                          CommonIconButton(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.stepColor.withOpacity(0.3),
                                      offset: Offset(2, 2),
                                      blurRadius: 5),
                                  BoxShadow(
                                      color:
                                          AppColors.stepColor.withOpacity(0.3),
                                      offset: Offset(-2, -2),
                                      blurRadius: 5),
                                ],
                              ),
                              containerwidth: h * 0.07,
                              containerheight: h * 0.07,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              centericon: Image.asset(
                                AppImg.google,
                                // color: AppColors.white,
                                height: h * 0.03,
                              ),
                              onPressed: () async {
                                FocusScope.of(
                                        Globals.navigatorKey.currentContext!)
                                    .requestFocus(FocusNode());
                                User? userCreds = await ref
                                    .read(accountServiceProvider)
                                    .loginWithGoogle();
                                Map<String, dynamic>? loginResponse = await ref
                                    .read(accountServiceProvider)
                                    .loginWithSocial(
                                        email: userCreds?.email ?? "");

                                if (loginResponse?["error"] != null) {
                                  ref.read(dialogServiceProvider).showSnackBar(
                                      content: "${loginResponse?["error"]}",
                                      color: AppColors.colorPrimary
                                        ..withOpacity(0.7),
                                      textclr: AppColors.white);
                                } else if (loginResponse?["data"]?["token"] !=
                                    null) {
                                  PreferenceManagerUtils.setToken(
                                      loginResponse?["data"]?['token']);
                                  // PreferenceManagerUtils.setUserEmail(loginResponse!['existingAdmin']["email"]!= null  ? loginResponse['existingAdmin']["email"] : "");
                                  // PreferenceManagerUtils.setUserPhoneNo(loginResponse!['existingAdmin']["phoneNo"] != null ? loginResponse['existingAdmin']["phoneNo"] : "");

                                  PreferenceManagerUtils.setUserId(
                                      loginResponse?["data"]?['Account']
                                          ["_id"]);
                                  PreferenceManagerUtils.setIsLogin(true);

                                  PreferenceManagerUtils.setProfileId(
                                      (loginResponse?["data"]["Account"]
                                                      ["acc_Id"]
                                                  .toString() ??
                                              loginResponse?["data"]["Account"]
                                                      ["acc_id"]
                                                  .toString() ??
                                              "")
                                          .toString());
                                  PreferenceManagerUtils.setProfMobileNo(
                                      loginResponse?["data"]["Account"]
                                          ["userId"]["phoneNumber"]);
                                  PreferenceManagerUtils.setUserName(
                                      loginResponse?["data"]["Account"]
                                          ["name"]);
                                  PreferenceManagerUtils.setProfEmail(
                                      loginResponse?["data"]["Account"]
                                          ["email"]);

                                  // PreferenceManagerUtils.setAsGuest(false);
                                  //
                                  // PreferenceManagerUtils.setIsIndividual(
                                  //     controller().tabController.index == 0 ? 1 : 2);

                                  Navigator.pushAndRemoveUntil(
                                      Globals.navigatorKey.currentContext!,
                                      PageTransition(
                                          child: AfterBottomBar(),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 400)),
                                      (Route<dynamic> route) => false);
                                } else {
                                  ref.read(dialogServiceProvider).showSnackBar(
                                      content: "Server Error Occured",
                                      color: AppColors.colorPrimary
                                        ..withOpacity(0.7),
                                      textclr: AppColors.white);
                                }
                              }),
                        CommonIconButton(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.stepColor.withOpacity(0.3),
                                    offset: Offset(2, 2),
                                    blurRadius: 5),
                                BoxShadow(
                                    color: AppColors.stepColor.withOpacity(0.3),
                                    offset: Offset(-2, -2),
                                    blurRadius: 5),
                              ],
                            ),
                            containerwidth: h * 0.07,
                            containerheight: h * 0.07,
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            centericon: Image.asset(
                              AppImg.fb,
                              height: h * 0.03,
                            ),
                            onPressed: () async {
                              FocusScope.of(
                                      Globals.navigatorKey.currentContext!)
                                  .requestFocus(FocusNode());
                              UserCredential? userCreds = await ref
                                  .read(accountServiceProvider)
                                  .signInWithFacebook();
                              if (userCreds != null &&
                                  userCreds!.user!.email != null) {
                                Map<String, dynamic>? loginResponse = await ref
                                    .read(accountServiceProvider)
                                    .loginWithSocial(
                                        email: userCreds?.user?.email ?? "");

                                if (loginResponse?["error"] != null) {
                                  ref.read(dialogServiceProvider).showSnackBar(
                                      content: "${loginResponse?["error"]}",
                                      color: AppColors.colorPrimary
                                        ..withOpacity(0.7),
                                      textclr: AppColors.white);
                                } else if (loginResponse?["data"]?["token"] !=
                                    null) {
                                  PreferenceManagerUtils.setToken(
                                      loginResponse?["data"]?['token']);
                                  // PreferenceManagerUtils.setUserEmail(loginResponse!['existingAdmin']["email"]!= null  ? loginResponse['existingAdmin']["email"] : "");
                                  // PreferenceManagerUtils.setUserPhoneNo(loginResponse!['existingAdmin']["phoneNo"] != null ? loginResponse['existingAdmin']["phoneNo"] : "");

                                  PreferenceManagerUtils.setUserId(
                                      loginResponse?["data"]?['Account']
                                          ["_id"]);
                                  PreferenceManagerUtils.setIsLogin(true);
                                  // PreferenceManagerUtils.setAsGuest(false);
                                  //
                                  // PreferenceManagerUtils.setIsIndividual(
                                  //     controller().tabController.index == 0 ? 1 : 2);

                                  Navigator.pushAndRemoveUntil(
                                      Globals.navigatorKey.currentContext!,
                                      PageTransition(
                                          child: AfterBottomBar(),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 400)),
                                      (Route<dynamic> route) => false);
                                } else {
                                  ref.read(dialogServiceProvider).showSnackBar(
                                      content: "Server Error Occured",
                                      color: AppColors.colorPrimary
                                        ..withOpacity(0.7),
                                      textclr: AppColors.white);
                                }
                              }
                              //
                              // commonNavigator(
                              //     type: PageTransitionType.rightToLeftWithFade,
                              //     context: context,
                              //     child: controller().tabController.index == 0
                              //         ? LoginFB(
                              //             loginType: controller().tabController.index,
                              //           )
                              //         : BusinessLoginFB(
                              //             loginType: controller().tabController.index,
                              //           ));
                            }),
                      ],
                    ),
                  ),
                ]),
              ),
          error: (error, stackTrace) {
            return ErrorScreen(
                text: error.toString(),
                backgroundColor: AppColors.white,
                color: AppColors.red);
          },
          loading: () {
            if (controller().isLoading) {
              return LoginPageShimmer();
            }
          }),
    );
  }
}
