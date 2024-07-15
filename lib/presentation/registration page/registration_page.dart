import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/presentation/registration%20moblie/registration_moblie.dart';
import 'package:heavenlymatrimony/presentation/registration%20page/registration_page_controller.dart';
// import 'package:heavenlymatrimony/presentation/Registration%20Page/registration_page_controller.dart';
import 'package:heavenlymatrimony/presentation/shimmers/registration_page_shimmer.dart';
import 'package:heavenlymatrimony/presentation/terms_condition/terms_condition.dart';
import 'package:heavenlymatrimony/utils/common_components/common_checkbox.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/account/account_service.dart';
import '../../application/dialog/dialog_service.dart';
import '../../data/shared_pref/shared_pref.dart';
import '../../utils/import_utils.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar.dart';

class RegistrationPage extends ConsumerWidget {
  RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(registrationPageControllerProvider);
    controller() => ref.read(registrationPageControllerProvider.notifier);

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
            },
          ),
        ),
        body: controller().isLoading
            ? RegistrationPageShimmer()
            : SingleChildScrollView(
                child: Column(children: [
                  Column(
                    children: [
                      Container(
                        height: h * 0.05,
                        width: w * 0.60,
                        decoration: BoxDecoration(),
                        child: Center(
                          child: CommonText(
                            text: AppText.RegisterNow,
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
                          height: h * 0.15,
                        )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.1, right: w * 0.11),
                    child: Column(
                      children: [
                        TextInputField(
                          hintText: AppText.name,
                          controller: controller().nameController,
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.75,
                          containercolor: AppColors.white,
                          underline: false,
                          underlinecolor: AppColors.textColor,
                          textCapitalization: TextCapitalization.none,
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
                          errorText: controller().isSubmit == true
                              ? validate(controller().nameController.text)
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
                          height: h * 0.01,
                        ),
                        TextInputField(
                          borderRadius: BorderRadius.zero,
                          hintText: AppText.emailid,
                          controller: controller().emailidController,
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.75,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none,
                          underline: false,
                          containerheight: h * 0.04,
                          containerborder: Border(
                              right: BorderSide.none,
                              left: BorderSide.none,
                              top: BorderSide.none,
                              bottom: BorderSide(
                                color: AppColors.textColor.withOpacity(0.5),
                                width: 1,
                              )),
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
                            child: Image.asset(AppImg.mail,
                                height: h * 0.03, width: h * 0.03),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextInputField(
                            hintText: AppText.moblienumber,
                            controller: controller().phoneController,
                            keyboardType: TextInputType.number,
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
                            errorText: controller().isSubmit == true
                                ? validatePhone(
                                    controller().phoneController.text)
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
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: Image.asset(AppImg.smartphone,
                                  color: AppColors.textColor,
                                  height: h * 0.03,
                                  width: h * 0.03),
                            )),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextInputField(
                            borderRadius: BorderRadius.zero,
                            hintText: AppText.createpassword,
                            controller: controller().passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            maxLines: 1,
                            containerwidth: w * 0.75,
                            containercolor: AppColors.white,
                            textCapitalization: TextCapitalization.none,
                            underline: false,
                            containerheight: h * 0.04,
                            containerborder: Border(
                                right: BorderSide.none,
                                left: BorderSide.none,
                                top: BorderSide.none,
                                bottom: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.5),
                                  width: 1,
                                )),
                            errorText: controller().isSubmit == true
                                ? validatePassword(
                                    controller().passwordController.text)
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
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: Image.asset(AppImg.padlock,
                                  height: h * 0.03, width: h * 0.03),
                            )),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextInputField(
                            borderRadius: BorderRadius.zero,
                            hintText: AppText.reenterpassword,
                            controller: controller().confirmPasswordController,
                            keyboardType: TextInputType.text,
                            containerwidth: w * 0.75,
                            containercolor: AppColors.white,
                            obscureText: true,
                            maxLines: 1,
                            textCapitalization: TextCapitalization.none,
                            underline: false,
                            containerheight: h * 0.04,
                            containerborder: Border(
                                right: BorderSide.none,
                                left: BorderSide.none,
                                top: BorderSide.none,
                                bottom: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.5),
                                  width: 1,
                                )),
                            errorText: controller().isSubmit == true
                                ? validateConfirmPassword(
                                    controller().confirmPasswordController.text,
                                    controller().passwordController.text)
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
                                color: AppColors.textColor,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400),
                            prefix: Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: Image.asset(AppImg.padlock,
                                  height: h * 0.03, width: h * 0.03),
                            )),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.005, horizontal: w * 0.02),
                          child: CommonDropdown(
                            prefix: Icon(
                              Icons.info,
                              size: 10,
                            ),
                            alignment: Alignment.center,
                            dropdownselecttitle: controller().getGenderStatus,
                            onChangedsearch: (selectedValue) {
                              controller().changeGender(val: selectedValue!);
                            },
                            selectedItem: controller().getGenderStatus,
                            items: controller().getGenderList,
                            borderRadius: BorderRadius.circular(6),
                            containerwidth: w,
                            containerheight: h * 0.06,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlign: TextAlign.center,
                              dropdownSearchDecoration: InputDecoration(
                                // prefix: Icon(Icons.info_outline,color: Colors.black26,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.black, width: 1)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.black, width: 1)),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.black, width: 1)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.black.withOpacity(0.3),
                                        width: 1)),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              baseStyle: juraTextStyle(
                                  fontSize: h * 0.02, color: AppColors.black),
                            ),
                            clearButtonProps: const ClearButtonProps(),
                            padding: EdgeInsets.zero,
                            dropdownButtonProps: DropdownButtonProps(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: h * 0.03,
                                color: AppColors.black,
                              ),
                            ),
                            enabled: true,
                            elevation: 0,
                            isExpanded: false,
                            selectedTextstyle: juraTextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor,
                                fontSize: h * 0.02),
                            containercolor: Colors.transparent,
                          ),
                          // CommonDropdown(
                          //   containerwidth: w,
                          //   containercolor: AppColors.white,
                          //   containerheight: h * 0.065,
                          //   dropdownselecttitle:
                          //       controller().getGenderStatus,
                          //   selectedItem:
                          //       controller().getGenderStatus,
                          //   onChangedsearch: (selectedValue) {
                          //     controller().changeGender(
                          //         val: selectedValue!);
                          //
                          //   },
                          //   items: controller().getGenderList,
                          //   dropdownDecoratorProps:
                          //       DropDownDecoratorProps(
                          //     dropdownSearchDecoration:
                          //         const InputDecoration(
                          //       focusedBorder:
                          //           UnderlineInputBorder(
                          //         borderSide: BorderSide(
                          //             color:
                          //                 AppColors.borderColor,
                          //             width: 1),
                          //       ),
                          //       disabledBorder:
                          //           UnderlineInputBorder(
                          //               borderSide: BorderSide(
                          //                   color: AppColors
                          //                       .borderColor,
                          //                   width: 1)),
                          //       border: UnderlineInputBorder(
                          //           borderSide: BorderSide(
                          //               color: AppColors
                          //                   .borderColor,
                          //               width: 1)),
                          //       enabledBorder:
                          //           UnderlineInputBorder(
                          //               borderSide: BorderSide(
                          //                   color: AppColors
                          //                       .borderColor,
                          //                   width: 1)),
                          //     ),
                          //     baseStyle: juraTextStyle(
                          //         fontSize: h * 0.015,
                          //         color: AppColors.black),
                          //   ),
                          //   clearButtonProps:
                          //       const ClearButtonProps(),
                          //   dropdownButtonProps:
                          //       DropdownButtonProps(
                          //     icon: Icon(
                          //       Icons
                          //           .keyboard_arrow_down_outlined,
                          //       size: h * 0.03,
                          //       color: AppColors.black,
                          //     ),
                          //   ),
                          //   enabled: true,
                          //   elevation: 0,
                          //   isExpanded: true,
                          //   selectedTextstyle: juraTextStyle(
                          //       fontWeight: FontWeight.w500,
                          //       color: AppColors.textColor,
                          //       fontSize: h * 0.02),
                          //   border: null,
                          // ),
                        ),
                        ListTile(
                          onTap: () {
                            controller().toggle(controller().isChecked);
                          },
                          title: Text.rich(
                            TextSpan(text: AppText.Iagree, children: [
                              TextSpan(
                                  text: AppText.termCon,
                                  style: juraTextStyle(
                                    color: AppColors.gradient1,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.gradient1,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      commonNavigator(
                                          context: context,
                                          child: TermsAndConditions(),
                                          type: PageTransitionType.fade);
                                    })
                            ]),
                          ),
                          // CommonText(
                          //   text: AppText.termCon,
                          //   style: juraTextStyle(
                          //       fontSize: h * 0.018,
                          //       color: AppColors.gray,
                          //       fontWeight: FontWeight.w600),
                          // ),

                          leading: CustomCheckbox(
                            value: controller().isChecked,
                            onChanged: (val) {
                              controller().toggle(val);
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.01, bottom: h * 0.03),
                          child: CommonButton(
                            containerwidth: w * 0.4,
                            containerheight: h * 0.05,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.01)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.01),
                              gradient: commonGradient(),
                            ),
                            text: AppText.Register,
                            textStyle: juraTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              controller().onSignUpTap(context);
                              // commonNavigator(
                              //     context: context,
                              //     child: RegistrationMobile(),
                              //     type: PageTransitionType.fade);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.01,
                              left: w * 0.1,
                              right: w * 0.11,
                              bottom: h * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (Platform.isAndroid)
                                CommonIconButton(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.stepColor
                                                .withOpacity(0.3),
                                            offset: Offset(2, 2),
                                            blurRadius: 5),
                                        BoxShadow(
                                            color: AppColors.stepColor
                                                .withOpacity(0.3),
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
                                      await DialogServiceV1()
                                          .selectGenderDialog(
                                              onSubmit: (selectedId) {
                                                controller().genderID =
                                                    selectedId;
                                              },
                                              controller: controller);
                                      FocusScope.of(Globals
                                              .navigatorKey.currentContext!)
                                          .requestFocus(FocusNode());
                                      User? userCreds = await ref
                                          .read(accountServiceProvider)
                                          .loginWithGoogle();
                                      Map<String, dynamic>? signupResponse =
                                          await ref
                                              .read(accountServiceProvider)
                                              .registerWithSocial(
                                                  email: userCreds?.email ?? "",
                                                  isFacebook: false,
                                                  isGoogle: true,
                                                  phoneNo:
                                                      userCreds?.phoneNumber ??
                                                          "0000000000",
                                                  name:
                                                      userCreds?.displayName ??
                                                          "",
                                                  gender:
                                                      controller().genderID);

                                      if (signupResponse?["error"] != null) {
                                        ref
                                            .read(dialogServiceProvider)
                                            .showSnackBar(
                                                content:
                                                    "${signupResponse?["error"]}",
                                                color: AppColors.colorPrimary
                                                  ..withOpacity(0.7),
                                                textclr: AppColors.white);
                                        Map<String, dynamic>? loginResponse =
                                            await ref
                                                .read(accountServiceProvider)
                                                .loginWithSocial(
                                                    email:
                                                        userCreds?.email ?? "");
                                        if (loginResponse?["error"] != null) {
                                          ref
                                              .read(dialogServiceProvider)
                                              .showSnackBar(
                                                  content:
                                                      "${loginResponse?["error"]}",
                                                  color: AppColors.colorPrimary
                                                    ..withOpacity(0.7),
                                                  textclr: AppColors.white);
                                        } else if (loginResponse?["data"]
                                                ?["token"] !=
                                            null) {
                                          PreferenceManagerUtils.setIsLogin(
                                              true);
                                          PreferenceManagerUtils.setToken(
                                              loginResponse?["data"]["token"]);

                                          PreferenceManagerUtils.setUserId(
                                              loginResponse?["data"]["Account"]
                                                          ["userId"]
                                                      .toString() ??
                                                  "");
                                          PreferenceManagerUtils.setProfileId(
                                              (loginResponse?["data"]["Account"]
                                                              ["acc_Id"]
                                                          .toString() ??
                                                      loginResponse?["data"]
                                                                  ["Account"]
                                                              ["acc_id"]
                                                          .toString() ??
                                                      "")
                                                  .toString());

                                          PreferenceManagerUtils.setUserName(
                                              loginResponse?["data"]["Account"]
                                                  ["name"]);
                                          PreferenceManagerUtils.setProfEmail(
                                              loginResponse?["data"]["Account"]
                                                  ["email"]);

                                          Navigator.pushAndRemoveUntil(
                                              Globals
                                                  .navigatorKey.currentContext!,
                                              PageTransition(
                                                  child: AfterBottomBar(),
                                                  type: PageTransitionType
                                                      .rightToLeftWithFade,
                                                  duration: const Duration(
                                                      milliseconds: 400)),
                                              (Route<dynamic> route) => false);
                                        }
                                      } else if (signupResponse?["data"]
                                              ?["token"] !=
                                          null) {
                                        // PreferenceManagerUtils.setUserEmail(loginResponse!['existingAdmin']["email"]!= null  ? loginResponse['existingAdmin']["email"] : "");
                                        // PreferenceManagerUtils.setUserPhoneNo(loginResponse!['existingAdmin']["phoneNo"] != null ? loginResponse['existingAdmin']["phoneNo"] : "");

                                        PreferenceManagerUtils.setIsLogin(true);
                                        PreferenceManagerUtils.setToken(
                                            signupResponse?["data"]["token"]);
                                        PreferenceManagerUtils.setUserId(
                                            signupResponse?["data"]["Account"]
                                                ["userId"]);
                                        PreferenceManagerUtils.setProfileId(
                                            (signupResponse?["data"]["Account"]
                                                        ["acc_Id"] ??
                                                    signupResponse?["data"]
                                                        ["Account"]["acc_id"] ??
                                                    "")
                                                .toString());
                                        PreferenceManagerUtils.setUserName(
                                            signupResponse?["data"]["Account"]
                                                ["name"]);
                                        PreferenceManagerUtils.setProfEmail(
                                            signupResponse?["data"]["Account"]
                                                ["email"]);
                                        Navigator.pushAndRemoveUntil(
                                            Globals
                                                .navigatorKey.currentContext!,
                                            PageTransition(
                                                child: RegistrationMobile(
                                                  email: userCreds?.email ?? "",
                                                  phoneNo:
                                                      userCreds?.phoneNumber ??
                                                          "",
                                                  fromRegister: true,
                                                ),
                                                type: PageTransitionType
                                                    .rightToLeftWithFade,
                                                duration: const Duration(
                                                    milliseconds: 400)),
                                            (Route<dynamic> route) => false);
                                      }
                                      // else {
                                      //   ref
                                      //       .read(dialogServiceProvider)
                                      //       .showSnackBar(
                                      //           content:
                                      //               "Some Server Error Occured",
                                      //           color: AppColors.colorPrimary
                                      //             ..withOpacity(0.7),
                                      //           textclr: AppColors.white);
                                      // }
                                    }),
                              CommonIconButton(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.stepColor
                                              .withOpacity(0.3),
                                          offset: Offset(2, 2),
                                          blurRadius: 5),
                                      BoxShadow(
                                          color: AppColors.stepColor
                                              .withOpacity(0.3),
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
                                    await DialogServiceV1().selectGenderDialog(
                                        onSubmit: (selectedId) {
                                          controller().genderID = selectedId;
                                        },
                                        controller: controller);
                                    FocusScope.of(Globals
                                            .navigatorKey.currentContext!)
                                        .requestFocus(FocusNode());
                                    UserCredential? userCreds = await ref
                                        .read(accountServiceProvider)
                                        .signInWithFacebook();
                                    if (userCreds != null &&
                                        userCreds!.user!.email != null) {
                                      Map<String,
                                              dynamic>? signupResponse =
                                          await ref
                                              .read(accountServiceProvider)
                                              .registerWithSocial(
                                                  email:
                                                      userCreds
                                                              ?.user?.email ??
                                                          "",
                                                  isFacebook: true,
                                                  isGoogle: false,
                                                  phoneNo:
                                                      userCreds?.user
                                                              ?.phoneNumber ??
                                                          "1234567890",
                                                  name: userCreds
                                                          ?.user?.displayName ??
                                                      "",
                                                  gender:
                                                      controller().genderID);

                                      if (signupResponse?["error"] != null) {
                                        ref
                                            .read(dialogServiceProvider)
                                            .showSnackBar(
                                                content:
                                                    "${signupResponse?["error"]}",
                                                color: AppColors.colorPrimary
                                                  ..withOpacity(0.7),
                                                textclr: AppColors.white);
                                        Map<String, dynamic>? loginResponse =
                                            await ref
                                                .read(accountServiceProvider)
                                                .loginWithSocial(
                                                    email: userCreds
                                                            ?.user?.email ??
                                                        "");
                                        if (loginResponse?["error"] != null) {
                                          ref
                                              .read(dialogServiceProvider)
                                              .showSnackBar(
                                                  content:
                                                      "${loginResponse?["data"]["error"]}",
                                                  color: AppColors.colorPrimary
                                                    ..withOpacity(0.7),
                                                  textclr: AppColors.white);
                                        } else if (loginResponse?["data"]
                                                ?["token"] !=
                                            null) {
                                          PreferenceManagerUtils.setToken(
                                              loginResponse?["data"]['token']);
                                          PreferenceManagerUtils.setUserId(
                                              loginResponse?["data"]['Account']
                                                  ['_id']);
                                          PreferenceManagerUtils.setIsLogin(
                                              true);

                                          Navigator.pushAndRemoveUntil(
                                              Globals
                                                  .navigatorKey.currentContext!,
                                              PageTransition(
                                                  child: AfterBottomBar(),
                                                  type: PageTransitionType
                                                      .rightToLeftWithFade,
                                                  duration: const Duration(
                                                      milliseconds: 400)),
                                              (Route<dynamic> route) => false);
                                        }
                                      } else if (signupResponse?["data"]
                                              ?["token"] !=
                                          null) {
                                        PreferenceManagerUtils.setToken(
                                            signupResponse?["data"]['token']);
                                        // PreferenceManagerUtils.setUserEmail(loginResponse!['existingAdmin']["email"]!= null  ? loginResponse['existingAdmin']["email"] : "");
                                        // PreferenceManagerUtils.setUserPhoneNo(loginResponse!['existingAdmin']["phoneNo"] != null ? loginResponse['existingAdmin']["phoneNo"] : "");

                                        PreferenceManagerUtils.setUserId(
                                            signupResponse?["data"]["Account"]
                                                ['userId']);
                                        PreferenceManagerUtils.setIsLogin(true);

                                        Navigator.pushAndRemoveUntil(
                                            Globals
                                                .navigatorKey.currentContext!,
                                            PageTransition(
                                                child: AfterBottomBar(),
                                                type: PageTransitionType
                                                    .rightToLeftWithFade,
                                                duration: const Duration(
                                                    milliseconds: 400)),
                                            (Route<dynamic> route) => false);
                                      }
                                      ref
                                          .read(dialogServiceProvider)
                                          .showSnackBar(
                                              content:
                                                  "User Logged-in Successfully!!",
                                              color: AppColors.colorPrimary
                                                ..withOpacity(0.7),
                                              textclr: AppColors.white);
                                      PreferenceManagerUtils.setIsLogin(true);
                                      Navigator.pushAndRemoveUntil(
                                          Globals.navigatorKey.currentContext!,
                                          PageTransition(
                                              child: AfterBottomBar(),
                                              type: PageTransitionType
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 400)),
                                          (Route<dynamic> route) => false);
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
                      ],
                    ),
                  ),
                ]),
              ));
  }
}
