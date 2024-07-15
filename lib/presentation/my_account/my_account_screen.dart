import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/profile_page/profile_page_controller.dart';
import 'package:heavenlymatrimony/utils/common_components/common_search_dropdown.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/common_components/common_radio.dart';
import '../../utils/import_utils.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';
import '../deleteAccount/delete_Account.dart';
import '../shimmers/personal_details_shimmer.dart';
import 'my_account_screen_controller.dart';

class MyAccountScreen extends ConsumerWidget {
  bool frromRegister;
  ProfilePageScreenController Function()? controller;
  MyAccountScreen({Key? key, this.frromRegister = false, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref
        .watch(myAccountScreenControllerProvider(fromRegister: frromRegister));
    controller() =>
        ref.read(myAccountScreenControllerProvider(fromRegister: frromRegister)
            .notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: controller().isLoading
          ? PersonalDetailsShimmer()
          : SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: h * 0.025),
                child: SizedBox(
                  height: h,
                  width: w,
                  child: Center(
                    child: Container(
                      height: h * 0.87,
                      width: w * 0.93,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24.5),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ///rings
                          Positioned(
                            top: h * 0.02,
                            right: -(w * 0.01),
                            child: Opacity(
                                opacity: 0.15,
                                child: Image.asset(
                                  AppImg.rings,
                                  height: h * 0.1,
                                  width: w * 0.380,
                                )),
                          ),

                          /// rings
                          Positioned(
                            bottom: h * 0.130,
                            right: -w * 0.09,
                            child: Opacity(
                              opacity: 0.15,
                              child: Image.asset(
                                AppImg.rings,
                                height: h * 0.20,
                                width: w * 0.90,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.03, vertical: h * 0.02),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //profile image section
                                  CommonText(
                                    text: controller().isEdit == true
                                        ? AppText.editAccount
                                        : AppText.myAccount,
                                    style: juraTextStyle(
                                        fontSize: h * 0.035,
                                        color: AppColors.textBlack,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller().onProfileImageTapped();
                                    },
                                    child: SizedBox(
                                      height: h * 0.25,
                                      width: h * 0.25,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Center(
                                              child: ClipOval(
                                                child: Container(
                                                  height: h * 0.23,
                                                  width: h * 0.23,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .bottomLeft,
                                                          end: Alignment
                                                              .topRight,
                                                          colors: [
                                                            AppColors.gradBlack
                                                                .withOpacity(
                                                                    0.7),
                                                            AppColors.gradWhite
                                                                .withOpacity(
                                                                    0.7),
                                                          ])),
                                                  child: Center(
                                                    child: Container(
                                                      height: h * 0.2,
                                                      width: h * 0.2,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .white,
                                                              width: 3)),
                                                      child: ClipOval(
                                                        child: controller()
                                                                    .imgUrl ==
                                                                ""
                                                            ? Image.asset(
                                                                AppImg
                                                                    .profilePic,
                                                                fit: BoxFit
                                                                    .cover,
                                                                height:
                                                                    h * 0.19,
                                                                width: h * 0.19,
                                                              )
                                                            : controller()
                                                                    .imgUrl
                                                                    .startsWith(
                                                                        "https")
                                                                ? CachedNetworkImage(
                                                                    cacheKey:
                                                                        controller()
                                                                            .imgName,
                                                                    imageUrl:
                                                                        controller().imgUrl ??
                                                                            "",
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorWidget:
                                                                        (context,
                                                                            error,
                                                                            stackTrace) {
                                                                      return Icon(
                                                                        Icons
                                                                            .broken_image_rounded,
                                                                        color: AppColors
                                                                            .black
                                                                            .withOpacity(0.4),
                                                                        size: w *
                                                                            0.1,
                                                                      );
                                                                    },
                                                                    placeholder:
                                                                        (context,
                                                                            url) {
                                                                      return Shimmer.fromColors(
                                                                          baseColor: AppColors.shimmerGrey,
                                                                          highlightColor: AppColors.white,
                                                                          enabled: true,
                                                                          child: Container(
                                                                            color:
                                                                                AppColors.grey,
                                                                          ));
                                                                    },
                                                                  )
                                                                : Image.file(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    File(controller()
                                                                        .imgUrl),
                                                                    height: h *
                                                                        0.19,
                                                                    width: h *
                                                                        0.19,
                                                                  ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: h * 0.035,
                                            right: w * 0.025,
                                            child: Container(
                                              height: h * 0.05,
                                              width: h * 0.05,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.white,
                                                  border: Border.all(
                                                      color: AppColors.grey,
                                                      width: 3)),
                                              child: Center(
                                                child: Image.asset(
                                                  AppImg.camera,
                                                  height: h * 0.025,
                                                  width: h * 0.025,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CommonText(
                                    text: "ID :- ${controller().userId}",
                                    style: juraTextStyle(
                                      fontSize: h * 0.027,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  CommonText(
                                    text: controller().userName,
                                    style: juraTextStyle(
                                      fontSize: h * 0.034,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  ///delete edit buttons row
                                  if (controller().isEdit == false &&
                                      controller().isNewAcc == false)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: h * 0.08,
                                          width: w * 0.15,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: h * 0.045,
                                                width: w * 0.15,
                                                child: IconButton(
                                                    onPressed: () {
                                                      commonNavigator(
                                                          context: context,
                                                          child:
                                                              DeleteAccountScreen(),
                                                          type:
                                                              PageTransitionType
                                                                  .fade);
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.delete,
                                                      color: AppColors
                                                          .colorPrimary,
                                                      size: h * 0.03,
                                                    )),
                                              ),
                                              CommonText(
                                                text: AppText.remove,
                                                style: juraTextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.gradient2,
                                                    fontSize: w * 0.03),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.08,
                                          width: w * 0.15,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: h * 0.045,
                                                width: w * 0.15,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller().toggleEdit();
                                                    },
                                                    icon: Image.asset(
                                                      AppImg.edit,
                                                      height: h * 0.043,
                                                    )),
                                              ),
                                              CommonText(
                                                text: AppText.edit,
                                                style: juraTextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.gradient2,
                                                    fontSize: w * 0.03),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.03),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.yellow)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///================================================================================Start Personal details

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: h * 0.08,
                                              width: w * 0.5,
                                              child: Stack(
                                                children: [
                                                  CommonText(
                                                    text: AppText.personal,
                                                    style: juraTextStyle(
                                                      color:
                                                          AppColors.textBlack,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: h * 0.004,
                                                    child: SizedBox(
                                                      height: h * 0.06,
                                                      child: CommonText(
                                                        text: AppText.details,
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .textBlack,
                                                            fontSize:
                                                                h * 0.034),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // if (controller().isEdit == true)
                                            //   SizedBox(
                                            //     height: h * 0.08,
                                            //     width: w * 0.15,
                                            //     child: Column(
                                            //       children: [
                                            //         SizedBox(
                                            //           height: h * 0.045,
                                            //           width: w * 0.15,
                                            //           child: IconButton(
                                            //               onPressed: () {
                                            //                 controller()
                                            //                     .togglePDEdit();
                                            //               },
                                            //               icon: Image.asset(
                                            //                 AppImg.edit,
                                            //                 height: h * 0.043,
                                            //               )),
                                            //         ),
                                            //         CommonText(
                                            //           text: AppText.edit,
                                            //           style: juraTextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w700,
                                            //               color: AppColors
                                            //                   .gradient2,
                                            //               fontSize: w * 0.04),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                          ],
                                        ),
                                        //name
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            hintText: AppText.name,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().name,
                                            keyboardType: TextInputType.text,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,
                                            underline: true,
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.symmetric(
                                        //       vertical: h * 0.005),
                                        //   child: CommonDropdown(
                                        //     alignment: Alignment.center,
                                        //     dropdownselecttitle:
                                        //         controller().getGenderStatus,
                                        //     onChangedsearch: (selectedValue) {
                                        //       controller().changeGender(
                                        //           val: selectedValue!);
                                        //
                                        //       controller().togglePDEditTrue();
                                        //     },
                                        //     selectedItem:
                                        //         controller().getGenderStatus,
                                        //     items: controller().getGenderList,
                                        //     borderRadius:
                                        //         BorderRadius.circular(6),
                                        //     containerwidth: w,
                                        //     containerheight: h * 0.06,
                                        //     dropdownDecoratorProps:
                                        //         DropDownDecoratorProps(
                                        //       dropdownSearchDecoration:
                                        //           const InputDecoration(
                                        //         focusedBorder:
                                        //             UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: AppColors
                                        //                         .borderColor,
                                        //                     width: 1)),
                                        //         disabledBorder:
                                        //             UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: AppColors
                                        //                         .borderColor,
                                        //                     width: 1)),
                                        //         border: UnderlineInputBorder(
                                        //             borderSide: BorderSide(
                                        //                 color: AppColors
                                        //                     .borderColor,
                                        //                 width: 1)),
                                        //         enabledBorder:
                                        //             UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: AppColors
                                        //                         .borderColor,
                                        //                     width: 1)),
                                        //       ),
                                        //       textAlignVertical:
                                        //           TextAlignVertical.center,
                                        //       baseStyle: juraTextStyle(
                                        //           fontSize: h * 0.02,
                                        //           color: AppColors.black),
                                        //     ),
                                        //     clearButtonProps:
                                        //         const ClearButtonProps(),
                                        //     padding: EdgeInsets.zero,
                                        //     dropdownButtonProps:
                                        //         DropdownButtonProps(
                                        //       padding: EdgeInsets.zero,
                                        //       icon: Icon(
                                        //         Icons
                                        //             .keyboard_arrow_down_outlined,
                                        //         size: h * 0.03,
                                        //         color: AppColors.black,
                                        //       ),
                                        //     ),
                                        //     enabled: true,
                                        //     elevation: 0,
                                        //     isExpanded: false,
                                        //     selectedTextstyle: juraTextStyle(
                                        //         fontWeight: FontWeight.w500,
                                        //         color: AppColors.textColor,
                                        //         fontSize: h * 0.02),
                                        //     containercolor: Colors.transparent,
                                        //   ),
                                        // ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().gender,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.gender,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .togglePDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode:
                                                controller().getFocusGenderNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onGenderSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeGender(
                                                  val: value['name']);
                                              controller().togglePDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.005),
                                            child: TextInputField(
                                              enabled: true,
                                              readonly: true,
                                              onChanged: (str) {
                                                controller().togglePDEditTrue();
                                              },
                                              hintText: AppText.dob,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller().dob,
                                              keyboardType: TextInputType.text,
                                              containerwidth: double.infinity,
                                              containercolor:
                                                  AppColors.transparent,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              onTap: () async {
                                                controller().pickDate();
                                              },
                                              maxLines: 1,
                                              suffixonTap: () async {
                                                controller().pickDate();
                                              },
                                              suffixicon: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppImg.calender,
                                                    height: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                ],
                                              ),
                                              underline: true,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: false,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.age,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().age,
                                            keyboardType: TextInputType.text,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,
                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.height,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().height,
                                            keyboardType: TextInputType.number,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.weight,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().weight,
                                            keyboardType: TextInputType.number,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,
                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().martialStatus,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.maritalStatus1,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .togglePDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusmartialStatusNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onMartialStatusSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeMartialStatus(
                                                  val: value['name']);
                                              controller().togglePDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,

                                            ///
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().physicalStatus,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.physical,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .togglePDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusphysicalStatusNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onPhysicalStatusSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changePhysicalStatus(
                                                  val: value['name']);
                                              controller().togglePDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,

                                            ///
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.about,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller:
                                                controller().aboutController,
                                            keyboardType: TextInputType.text,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,
                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.address,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().address,
                                            keyboardType: TextInputType.text,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().togglePDEditTrue();
                                            },
                                            hintText: AppText.district,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().district,
                                            keyboardType: TextInputType.text,
                                            containerwidth: double.infinity,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller()
                                                .personalDetailCountry,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.country,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .togglePDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocuspersonalDetailCountryNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onCountrySearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeCountry(
                                                  val: value['name']);
                                              controller().togglePDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonSearchDropdown(
                                                emptyBuilder: (context) {
                                                  return Container();
                                                },
                                                controller: controller()
                                                    .personalDetailState,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                containerwidth: w * 0.8,
                                                builder: (context, controller1,
                                                    focusNode) {
                                                  return TextInputField(
                                                      focusNode: focusNode,
                                                      hintText: AppText.state,
                                                      controller: controller1,
                                                      underline: true,
                                                      onTap: () {
                                                        if (controller()
                                                                .isPDEdit ==
                                                            true) {
                                                          if (controller()
                                                                  .isCountrySelected ==
                                                              false) {
                                                            DialogServiceV1().showSnackBar(
                                                                content:
                                                                    "Please select Country",
                                                                color: AppColors
                                                                    .black,
                                                                textclr:
                                                                    AppColors
                                                                        .white);
                                                          } else if (controller()
                                                                  .isStateLoaded ==
                                                              false)
                                                            DialogServiceV1().showSnackBar(
                                                                content:
                                                                    "loading..",
                                                                color: AppColors
                                                                    .black,
                                                                textclr:
                                                                    AppColors
                                                                        .white);
                                                        }
                                                      },
                                                      suffixicon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: h * 0.03,
                                                        color: AppColors.black,
                                                      ),
                                                      hintStyle: juraTextStyle(
                                                          color: AppColors.gray,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textstyle: juraTextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      containerheight: h * 0.05,
                                                      enabled: controller()
                                                              .isStateLoaded &&
                                                          controller()
                                                              .isCountrySelected &&
                                                          controller().isPDEdit ==
                                                              true,
                                                      onChanged: (str) {
                                                        controller()
                                                            .togglePDEditTrue();
                                                      },
                                                      titletextstyle: juraTextStyle(
                                                          color: AppColors.grey,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      errorStyle: juraTextStyle(
                                                          color: AppColors.red,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      lableStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      counterStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      keyboardType: TextInputType.text,
                                                      containerwidth: w * 0.8,
                                                      containercolor: AppColors.transparent,
                                                      textCapitalization: TextCapitalization.none);
                                                },
                                                containerheight: h * 0.06,
                                                focusNode: controller()
                                                    .getFocuspersonalDetailStateNode,
                                                containercolor:
                                                    Colors.transparent,
                                                suggestionsCallback:
                                                    (search) async {
                                                  return controller()
                                                      .onStateSearchChanged(
                                                          search);
                                                },
                                                itemBuilder: (context, value) {
                                                  if (value != {}) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: w * 0.02),
                                                      child: Text(
                                                        value['name'],
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: h * 0.02),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 0,
                                                      width: 10,
                                                      color: AppColors.white,
                                                    );
                                                  }
                                                },
                                                onSelected: (value) {
                                                  print("valuevalue gs $value");
                                                  controller()
                                                      .changePersonalDetailState(
                                                          val: value['name']);
                                                  controller()
                                                      .togglePDEditTrue();
                                                },
                                                loadingBuilder: (context) {
                                                  return Container(
                                                    height: h * 0.05,
                                                    color: AppColors.white,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                hideOnEmpty: true,
                                                hideOnLoading: true,
                                                hideKeyboardOnDrag: true,
                                                hideOnSelect: true,
                                                showOnFocus: true,

                                                ///
                                              ),
                                            ],
                                          ),
                                        ),

                                        //// multiple images
                                        // CommonGridView(
                                        //     itemCount: controller()
                                        //             .personalDetailImageList
                                        //             .length +
                                        //         1,
                                        //     scrollDirection: Axis.vertical,
                                        //     shrinkWrap: false,
                                        //     padding: EdgeInsets.symmetric(
                                        //         horizontal: w * 0.01),
                                        //     childAspectRatio: 0.5,
                                        //     crossAxisSpacing: w * 0.05,
                                        //     mainAxisSpacing: h * 0.02,
                                        //     crossAxisCount: 2,
                                        //     maxCrossAxisExtent: w * 0.5,
                                        //     mainAxisExtent: h * 0.12,
                                        //     width: w,
                                        //     height: (h * 0.14) *
                                        //         ((controller()
                                        //                         .personalDetailImageList
                                        //                         .length +
                                        //                     1) /
                                        //                 2)
                                        //             .ceil(),
                                        //     physics:
                                        //         NeverScrollableScrollPhysics(),
                                        //     itemBuilder: (context, index) {
                                        //       return GestureDetector(
                                        //         onTap: () {
                                        //           ref
                                        //               .read(
                                        //                   dialogServiceProvider)
                                        //               .commonImagePicker(
                                        //                 picker: controller()
                                        //                     .imagePicker,
                                        //                 pickedImage: (file) {
                                        //                   controller()
                                        //                       .onPersonalDetailImgSelect(
                                        //                           val: file,
                                        //                           index: index);
                                        //                 },
                                        //               );
                                        //         },
                                        //         child: Container(
                                        //           padding: EdgeInsets.symmetric(
                                        //               horizontal: w * 0.05,
                                        //               vertical: h * 0.014),
                                        //           decoration: BoxDecoration(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       4),
                                        //               color: AppColors.white,
                                        //               border: Border.all(
                                        //                   color: AppColors.black
                                        //                       .withOpacity(0.4),
                                        //                   width: 2)),
                                        //           child: index ==
                                        //                   controller()
                                        //                       .personalDetailImageList
                                        //                       .length
                                        //               ? Column(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment
                                        //                           .spaceEvenly,
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .center,
                                        //                   children: [
                                        //                     Icon(
                                        //                       Icons.add_a_photo,
                                        //                       color: AppColors
                                        //                           .black
                                        //                           .withOpacity(
                                        //                               0.4),
                                        //                       size: h * 0.04,
                                        //                     ),
                                        //                     CommonText(
                                        //                         text: AppText
                                        //                             .addPhoto,
                                        //                         textAlign:
                                        //                             TextAlign
                                        //                                 .center,
                                        //                         style:
                                        //                             juraTextStyle(
                                        //                           color: AppColors
                                        //                               .black
                                        //                               .withOpacity(
                                        //                                   0.4),
                                        //                           fontSize:
                                        //                               h * 0.015,
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           fontWeight:
                                        //                               FontWeight
                                        //                                   .w600,
                                        //                         )),
                                        //                   ],
                                        //                 )
                                        //               : Image.network(
                                        //                   controller().personalDetailImageList?[
                                        //                           index] ??
                                        //                       "",
                                        //                   errorBuilder:
                                        //                       (context, error,
                                        //                           stackTrace) {
                                        //                     return Image.file(
                                        //                         File(controller()
                                        //                                     .personalDetailImageList?[
                                        //                                 index] ??
                                        //                             ""));
                                        //                   },
                                        //                 ),
                                        //         ),
                                        //       );
                                        //     }),
                                        if ((controller().isEdit == true &&
                                                controller().isPDEdit ==
                                                    true) ||
                                            controller().isNewAcc == true)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.005),
                                            child: Center(
                                              child: CommonButton(
                                                  containerwidth: w * 0.4,
                                                  containerheight: h * 0.05,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient: commonGradient(),
                                                  ),
                                                  text: AppText.save,
                                                  textStyle: juraTextStyle(
                                                    color: AppColors.white,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  onPressed: () {
                                                    controller()
                                                        .onCreatePersonalDetail();
                                                  }),
                                            ),
                                          ),
                                        if (controller().isEdit == true)
                                          Divider(
                                            color: AppColors.colorPrimary
                                                .withOpacity(0.5),
                                            thickness: 0.5,
                                          ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        // const ReligiousEducationScreen(),

                                        ///================================================================================End Personal details
                                        ///================================================================================Start REC

                                        Container(
                                          width: w * 0.9,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: w * 0.6,
                                                    child: CommonText(
                                                      text: AppText
                                                          .religiosscreentitle,
                                                      style: juraTextStyle(
                                                        color:
                                                            AppColors.textBlack,
                                                        fontSize: h * 0.019,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  CommonText(
                                                    text: AppText.information,
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontSize: h * 0.034),
                                                  ),
                                                ],
                                              ),
                                              // if (controller().isEdit == true)
                                              //   SizedBox(
                                              //     height: h * 0.08,
                                              //     width: w * 0.15,
                                              //     child: Column(
                                              //       children: [
                                              //         SizedBox(
                                              //           height: h * 0.045,
                                              //           width: w * 0.15,
                                              //           child: IconButton(
                                              //               onPressed: () {
                                              //                 controller()
                                              //                     .toggleRECEdit();
                                              //               },
                                              //               icon: Image.asset(
                                              //                 AppImg.edit,
                                              //                 height: h * 0.043,
                                              //               )),
                                              //         ),
                                              //         CommonText(
                                              //           text: AppText.edit,
                                              //           style: juraTextStyle(
                                              //               fontWeight:
                                              //                   FontWeight.w700,
                                              //               color: AppColors
                                              //                   .gradient2,
                                              //               fontSize: w * 0.04),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().religion,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.previousReligion,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusreligionNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onReligionSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeReligion(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().denomination,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.denomination,
                                                  onTap: () {
                                                    if (controller()
                                                            .isDenominationLoaded ==
                                                        false) {
                                                      DialogServiceV1()
                                                          .showSnackBar(
                                                              content:
                                                                  "loading..",
                                                              color: AppColors
                                                                  .black,
                                                              textclr: AppColors
                                                                  .white);
                                                    }
                                                    if (controller()
                                                            .isReligionSelected ==
                                                        false) {
                                                      DialogServiceV1()
                                                          .showSnackBar(
                                                              content:
                                                                  "Please select Religion",
                                                              color: AppColors
                                                                  .black,
                                                              textclr: AppColors
                                                                  .white);
                                                    }
                                                  },
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: controller()
                                                      .isDenominationLoaded,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusdenominationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onDenominationSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeDenomination(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        ////this condition will be used to shown church only when christian is selected
                                        // if(controller().getreligion == "Christian")
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().church,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.church,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode:
                                                controller().getFocuschurchNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onChurchSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeChurch(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,

                                            ///
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().education,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.education,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocuseducationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onEducSearchChanged(search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller()
                                                  .changeHighestEducation(
                                                      val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,

                                            ///
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().occupation,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText.occupation,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusoccupationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onOccupationsSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeOccupation(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().workLocation,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.workLocation,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusworkLocationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onWorkLocationSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeWorkLocation(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller: controller().college,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText: AppText
                                                      .collegeInstitution,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleRECEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocuscollegeNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onCollegeSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller().changeCollege(
                                                  val: value['name']);
                                              controller().toggleRECEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02,
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            hintText: AppText.occupationDetails,
                                            onChanged: (str) {
                                              controller().toggleRECEditTrue();
                                            },
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller:
                                                controller().occupationdetails,
                                            keyboardType: TextInputType.text,
                                            containerwidth: w,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02,
                                              vertical: h * 0.005),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                text: AppText.employedIn,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.030,
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: controller()
                                                      .employedInList
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              height: h * 0.03,
                                                              width: w * 0.65,
                                                              child: CommonText(
                                                                text: controller()
                                                                    .employedInList[
                                                                        index]
                                                                        ["name"]
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: juraTextStyle(
                                                                    fontSize: h *
                                                                        0.02,
                                                                    color:
                                                                        AppColors
                                                                            .gray,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                            CustomRadio(
                                                              size: h * 0.025,
                                                              value: index + 1,
                                                              groupValue:
                                                                  controller()
                                                                      .selectEmployedInRadio,
                                                              onChanged:
                                                                  (value) {
                                                                if (controller()
                                                                    .isRECDEdit) {
                                                                  controller()
                                                                      .onSelectEmployedInStatus(
                                                                          value!);
                                                                }
                                                                controller()
                                                                    .toggleRECEditTrue();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.015,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),

                                        ///================================================================================End REC
                                        if ((controller().isEdit == true &&
                                                controller().isRECDEdit) ||
                                            controller().isNewAcc == true)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.005),
                                            child: Center(
                                              child: CommonButton(
                                                  containerwidth: w * 0.4,
                                                  containerheight: h * 0.05,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient: commonGradient(),
                                                  ),
                                                  text: AppText.save,
                                                  textStyle: juraTextStyle(
                                                    color: AppColors.white,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  onPressed: () {
                                                    controller()
                                                        .onCreateRecdetails();
                                                  }),
                                            ),
                                          ),
                                        if (controller().isEdit == true)
                                          Divider(
                                            color: AppColors.colorPrimary
                                                .withOpacity(0.5),
                                            thickness: 0.5,
                                          ),

                                        ///================================================= Start Family Details

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: AppText.familydetails,
                                                  style: juraTextStyle(
                                                    color: AppColors.textBlack,
                                                    fontSize: h * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  height: h * 0.06,
                                                  child: CommonText(
                                                    text: AppText.information,
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontSize: h * 0.034),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // if (controller().isEdit == true)
                                            //   SizedBox(
                                            //     height: h * 0.08,
                                            //     width: w * 0.15,
                                            //     child: Column(
                                            //       children: [
                                            //         SizedBox(
                                            //           height: h * 0.045,
                                            //           width: w * 0.15,
                                            //           child: IconButton(
                                            //               onPressed: () {
                                            //                 controller()
                                            //                     .toggleFDEdit();
                                            //               },
                                            //               icon: Image.asset(
                                            //                 AppImg.edit,
                                            //                 height: h * 0.043,
                                            //               )),
                                            //         ),
                                            //         CommonText(
                                            //           text: AppText.edit,
                                            //           style: juraTextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w700,
                                            //               color: AppColors
                                            //                   .gradient2,
                                            //               fontSize: w * 0.04),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().toggleFDEditTrue();
                                            },
                                            hintText: AppText.fatherName,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().fatherName,
                                            keyboardType: TextInputType.text,
                                            containerwidth: w,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().fatherOccupation,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.fatherOccupation,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleFDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusfatherOccupationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onFOccuSearchChanged(search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller()
                                                  .changeFatherOccupation(
                                                      val: value['name']);
                                              controller().toggleFDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller().toggleFDEditTrue();
                                            },
                                            hintText: AppText.motherName,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),

                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller().motherName,
                                            keyboardType: TextInputType.text,
                                            containerwidth: w,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,

                                            underline: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonSearchDropdown(
                                            emptyBuilder: (context) {
                                              return Container();
                                            },
                                            controller:
                                                controller().motherOccupation,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            containerwidth: w * 0.9,
                                            builder: (context, controller1,
                                                focusNode) {
                                              return TextInputField(
                                                  focusNode: focusNode,
                                                  hintText:
                                                      AppText.motherOccupation,
                                                  controller: controller1,
                                                  underline: true,
                                                  suffixicon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: h * 0.03,
                                                    color: AppColors.black,
                                                  ),
                                                  hintStyle: juraTextStyle(
                                                      color: AppColors.gray,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textstyle: juraTextStyle(
                                                      color: AppColors.black,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  containerheight: h * 0.05,
                                                  enabled: true,
                                                  onChanged: (str) {
                                                    controller()
                                                        .toggleFDEditTrue();
                                                  },
                                                  titletextstyle: juraTextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  errorStyle: juraTextStyle(
                                                      color: AppColors.red,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  lableStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  counterStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  containerwidth: w * 0.8,
                                                  containercolor:
                                                      AppColors.transparent,
                                                  textCapitalization:
                                                      TextCapitalization.none);
                                            },
                                            containerheight: h * 0.06,
                                            focusNode: controller()
                                                .getFocusmotherOccupationNode,
                                            containercolor: Colors.transparent,
                                            suggestionsCallback:
                                                (search) async {
                                              return controller()
                                                  .onMoccupationSearchChanged(
                                                      search);
                                            },
                                            itemBuilder: (context, value) {
                                              if (value != {}) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w * 0.02),
                                                  child: Text(
                                                    value['name'],
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: h * 0.02),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 10,
                                                  color: AppColors.white,
                                                );
                                              }
                                            },
                                            onSelected: (value) {
                                              print("valuevalue gs $value");
                                              controller()
                                                  .changeMotherOccupation(
                                                      val: value['name']);
                                              controller().toggleFDEditTrue();
                                            },
                                            loadingBuilder: (context) {
                                              return Container(
                                                height: h * 0.05,
                                                color: AppColors.white,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                ),
                                              );
                                            },
                                            hideOnEmpty: true,
                                            hideOnLoading: true,
                                            hideKeyboardOnDrag: true,
                                            hideOnSelect: true,
                                            showOnFocus: true,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          children: [
                                            CommonText(
                                                text: AppText.noOfBroSis,
                                                style: juraTextStyle(
                                                    fontSize: w * 0.045,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.030,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                                text: AppText.brother,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.022,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            CommonDropdown(
                                              dropdownselecttitle: controller()
                                                  .getNumberOfBrothers,
                                              onChangedsearch: (selectedValue) {
                                                controller().changeNoOfBrother(
                                                    val: selectedValue!);
                                                controller().toggleFDEditTrue();
                                              },
                                              itemWidth: w * 0.05,
                                              selectedItem: controller()
                                                  .getNumberOfBrothers,
                                              items: controller()
                                                  .numberOfBrothersCat,
                                              dropdownDecoratorProps:
                                                  DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                  disabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .borderColor,
                                                          width: 1)),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                ),
                                                baseStyle: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.black),
                                              ),
                                              clearButtonProps:
                                                  const ClearButtonProps(),
                                              dropdownButtonProps:
                                                  DropdownButtonProps(
                                                icon: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: h * 0.03,
                                                      color:
                                                          controller().isFDEdit
                                                              ? AppColors.black
                                                              : AppColors
                                                                  .transparent,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              enabled: true,
                                              elevation: 0,
                                              isExpanded: true,
                                              selectedTextstyle: juraTextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textColor,
                                                  fontSize: h * 0.017),
                                              containercolor: AppColors.grey,
                                              containerwidth: w * 0.17,
                                              containerheight: h * 0.056,
                                            ),
                                            CommonText(
                                                text: AppText.sisters,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.022,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            CommonDropdown(
                                              dropdownselecttitle: controller()
                                                  .getNumberOfSisters,
                                              onChangedsearch: (selectedValue) {
                                                controller().changeNoOfSisters(
                                                    val: selectedValue!);
                                                controller().toggleFDEditTrue();
                                              },
                                              itemWidth: w * 0.05,
                                              selectedItem: controller()
                                                  .getNumberOfSisters,
                                              items: controller()
                                                  .numberOfSistersCat,
                                              dropdownDecoratorProps:
                                                  DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                  disabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .borderColor,
                                                          width: 1)),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .borderColor,
                                                              width: 1)),
                                                ),
                                                baseStyle: juraTextStyle(
                                                    fontSize: h * 0.017,
                                                    color: AppColors.black),
                                              ),
                                              selectedTextstyle: juraTextStyle(
                                                  fontSize: h * 0.017,
                                                  color: AppColors.black),
                                              clearButtonProps:
                                                  const ClearButtonProps(),
                                              dropdownButtonProps:
                                                  DropdownButtonProps(
                                                icon: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: h * 0.03,
                                                      color:
                                                          controller().isFDEdit
                                                              ? AppColors.black
                                                              : AppColors
                                                                  .transparent,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              enabled: true,
                                              elevation: 0,
                                              isExpanded: true,
                                              // selectedTextstyle: juraTextStyle(fontWeight: FontWeight.w500,
                                              //     color: AppColors.textColor, fontSize: h * 0.02),
                                              containercolor: AppColors.grey,
                                              containerwidth: w * 0.17,
                                              containerheight: h * 0.056,
                                            ),
                                          ],
                                        ),
                                        if ((controller().isEdit == true &&
                                                controller().isFDEdit) ||
                                            controller().isNewAcc == true)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.005),
                                            child: Center(
                                              child: CommonButton(
                                                  containerwidth: w * 0.4,
                                                  containerheight: h * 0.05,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient: commonGradient(),
                                                  ),
                                                  text: AppText.save,
                                                  textStyle: juraTextStyle(
                                                    color: AppColors.white,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  onPressed: () {
                                                    controller()
                                                        .onCreateFamilyDetail();
                                                    controller()
                                                        .toggleFDEditFalse();
                                                  }),
                                            ),
                                          ),

                                        ///================================================= End Family Details
                                        if (controller().isEdit == true)
                                          Divider(
                                            color: AppColors.colorPrimary
                                                .withOpacity(0.5),
                                            thickness: 0.5,
                                          ),
                                        // const PartnerPreferenceScreen(),

                                        ///=============================================== Start Partner Preference

                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: AppText.partner,
                                                  style: juraTextStyle(
                                                    color: AppColors.textBlack,
                                                    fontSize: h * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  height: h * 0.06,
                                                  child: CommonText(
                                                    text: AppText.preference,
                                                    style: juraTextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontSize: h * 0.034),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // if (controller().isEdit == true)
                                            //   SizedBox(
                                            //     height: h * 0.08,
                                            //     width: w * 0.15,
                                            //     child: Column(
                                            //       children: [
                                            //         SizedBox(
                                            //           height: h * 0.045,
                                            //           width: w * 0.15,
                                            //           child: IconButton(
                                            //               onPressed: () {
                                            //                 controller()
                                            //                     .togglePPrefEdit();
                                            //               },
                                            //               icon: Image.asset(
                                            //                 AppImg.edit,
                                            //                 height: h * 0.043,
                                            //               )),
                                            //         ),
                                            //         CommonText(
                                            //           text: AppText.edit,
                                            //           style: juraTextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w700,
                                            //               color: AppColors
                                            //                   .gradient2,
                                            //               fontSize: w * 0.04),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                          ],
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              CommonText(
                                                  text: AppText.preferredAge,
                                                  style: juraTextStyle(
                                                      fontSize: h * 0.024,
                                                      color: AppColors.gray,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                                text: AppText.from,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            TextInputField(
                                              enabled: true,
                                              onChanged: (str) {
                                                controller()
                                                    .togglePPrefEditTrue();
                                              },
                                              hintText: AppText.age,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller()
                                                  .preferredAgeFromController,
                                              keyboardType:
                                                  TextInputType.number,
                                              containerwidth: w * 0.2,
                                              containercolor:
                                                  AppColors.transparent,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              maxLines: 1,
                                              // borderColor: AppColors.gray,
                                              underline: true,
                                            ),
                                            CommonText(
                                                text: AppText.to,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            TextInputField(
                                              enabled: true,
                                              onChanged: (str) {
                                                controller()
                                                    .togglePPrefEditTrue();
                                              },
                                              hintText: AppText.age,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller()
                                                  .preferredAgeToController,
                                              keyboardType:
                                                  TextInputType.number,
                                              containerwidth: w * 0.2,
                                              containercolor:
                                                  AppColors.transparent,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              maxLines: 1,
                                              // borderColor: AppColors.gray,
                                              underline: true,
                                            ),
                                            // CommonDropdown(
                                            //   dropdownselecttitle: '28',
                                            //   onChangedsearch: (selectedValue) {
                                            //
                                            //   },
                                            //   items: const [],
                                            //   dropdownDecoratorProps: DropDownDecoratorProps(
                                            //     dropdownSearchDecoration: const InputDecoration(
                                            //       focusedBorder: UnderlineInputBorder(
                                            //           borderSide:
                                            //               BorderSide(color: AppColors.borderColor, width: 1)),
                                            //       disabledBorder: UnderlineInputBorder(
                                            //           borderSide:
                                            //               BorderSide(color: AppColors.borderColor, width: 1)),
                                            //       border: UnderlineInputBorder(
                                            //           borderSide:
                                            //               BorderSide(color: AppColors.borderColor, width: 1)),
                                            //       enabledBorder: UnderlineInputBorder(
                                            //           borderSide:
                                            //               BorderSide(color: AppColors.borderColor, width: 1)),
                                            //     ),
                                            //     baseStyle: juraTextStyle(
                                            //         fontSize: h * 0.015, color: AppColors.black),
                                            //   ),
                                            //   clearButtonProps: const ClearButtonProps(),
                                            //   dropdownButtonProps: DropdownButtonProps(
                                            //     icon: Column(
                                            //       mainAxisAlignment: MainAxisAlignment.end,
                                            //       children: [
                                            //         Icon(
                                            //           Icons.keyboard_arrow_down_outlined,
                                            //           size: h * 0.03,
                                            //           color: AppColors.black,
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            //   enabled: true,
                                            //   elevation: 0,
                                            //   isExpanded: true,
                                            //   textstyle: juraTextStyle(
                                            //       color: AppColors.textColor, fontSize: h * 0.024),
                                            //   containercolor: AppColors.grey,
                                            //   containerwidth: w * 0.22,
                                            //   containerheight: h * 0.056,
                                            // ),
                                          ],
                                        ),
                                        if (validateMaxAge(
                                                    maxAge: int.tryParse(
                                                            controller()
                                                                .preferredAgeToController
                                                                .text) ??
                                                        0,
                                                    minAge: int.tryParse(
                                                            controller()
                                                                .preferredAgeFromController
                                                                .text) ??
                                                        0) !=
                                                null &&
                                            controller().isPPrefEdit == true)
                                          Container(
                                            width: w * 0.6,
                                            child: CommonText(
                                                text: validateMaxAge(
                                                        maxAge: int.tryParse(
                                                                controller()
                                                                    .preferredAgeToController
                                                                    .text) ??
                                                            0,
                                                        minAge: int.tryParse(
                                                                controller()
                                                                    .preferredAgeFromController
                                                                    .text) ??
                                                            0) ??
                                                    "",
                                                style: juraTextStyle(
                                                    color: AppColors.red)),
                                          ),
                                        SizedBox(height: h * 0.03),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              CommonText(
                                                  text: AppText.preferredHeight,
                                                  style: juraTextStyle(
                                                      fontSize: h * 0.024,
                                                      color: AppColors.gray,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            children: [
                                              CommonText(
                                                text: AppText.from,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: w * 0.06,
                                              ),
                                              TextInputField(
                                                enabled: true,
                                                onChanged: (str) {
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                hintText: AppText.height
                                                    .split("*")[0],
                                                hintStyle: juraTextStyle(
                                                    color: AppColors.gray,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textstyle: juraTextStyle(
                                                    color: AppColors.black,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                titletextstyle: juraTextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                errorStyle: juraTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: controller()
                                                    .preferredHeightFromController,
                                                keyboardType:
                                                    TextInputType.number,
                                                containerwidth: w * 0.4,
                                                containercolor:
                                                    AppColors.transparent,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                obscureText: false,
                                                maxLines: 1,

                                                // borderColor: AppColors.gray,
                                                underline: true,
                                              ),
                                              // CommonDropdown(
                                              //   dropdownselecttitle: AppText.select,
                                              //   onChangedsearch: (selectedValue) {
                                              //
                                              //   },
                                              //   items: const [],
                                              //   dropdownDecoratorProps: DropDownDecoratorProps(
                                              //     dropdownSearchDecoration: const InputDecoration(
                                              //       focusedBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       disabledBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       border: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       enabledBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //     ),
                                              //     baseStyle: juraTextStyle(
                                              //         fontSize: h * 0.015, color: AppColors.black),
                                              //   ),
                                              //   clearButtonProps: const ClearButtonProps(),
                                              //   dropdownButtonProps: DropdownButtonProps(
                                              //     icon: Column(
                                              //       mainAxisAlignment: MainAxisAlignment.end,
                                              //       children: [
                                              //         Icon(
                                              //           Icons.keyboard_arrow_down_outlined,
                                              //           size: h * 0.03,
                                              //           color: AppColors.black,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                              //   enabled: true,
                                              //   elevation: 0,
                                              //   isExpanded: true,
                                              //   textstyle: juraTextStyle(
                                              //       color: AppColors.textColor, fontSize: h * 0.024),
                                              //   containercolor: AppColors.grey,
                                              //   containerwidth: w * 0.35,
                                              //   containerheight: h * 0.056,
                                              // ),
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            children: [
                                              CommonText(
                                                text: AppText.to,
                                                style: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.gray,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: w * 0.12,
                                              ),
                                              TextInputField(
                                                enabled: true,
                                                onChanged: (str) {
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                hintText: AppText.height
                                                    .split("*")[0],
                                                hintStyle: juraTextStyle(
                                                    color: AppColors.gray,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textstyle: juraTextStyle(
                                                    color: AppColors.black,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                titletextstyle: juraTextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                errorStyle: juraTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: controller()
                                                    .preferredHeightToController,
                                                keyboardType:
                                                    TextInputType.number,
                                                containerwidth: w * 0.4,
                                                containercolor:
                                                    AppColors.transparent,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                obscureText: false,
                                                maxLines: 1,
                                                // borderColor: AppColors.gray,
                                                underline: true,
                                              ),
                                              // CommonDropdown(
                                              //   dropdownselecttitle: AppText.select,
                                              //   onChangedsearch: (selectedValue) {
                                              //
                                              //   },
                                              //   items: [],
                                              //   dropdownDecoratorProps: DropDownDecoratorProps(
                                              //     dropdownSearchDecoration: const InputDecoration(
                                              //       focusedBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       disabledBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       border: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //       enabledBorder: UnderlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(color: AppColors.borderColor, width: 1)),
                                              //     ),
                                              //     baseStyle: juraTextStyle(
                                              //         fontSize: h * 0.024, color: AppColors.black),
                                              //   ),
                                              //   clearButtonProps: const ClearButtonProps(),
                                              //   dropdownButtonProps: DropdownButtonProps(
                                              //     icon: Column(
                                              //       mainAxisAlignment: MainAxisAlignment.end,
                                              //       children: [
                                              //         Icon(
                                              //           Icons.keyboard_arrow_down_outlined,
                                              //           size: h * 0.03,
                                              //           color: AppColors.black,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                              //   enabled: true,
                                              //   elevation: 0,
                                              //   isExpanded: true,
                                              //   textstyle: juraTextStyle(
                                              //       color: AppColors.textColor, fontSize: h * 0.024),
                                              //   containercolor: AppColors.grey,
                                              //   containerwidth: w * 0.35,
                                              //   containerheight: h * 0.056,
                                              // ),
                                            ],
                                          ),
                                        ),
                                        if (validateMaxHeight(
                                                    maxHeight: int.tryParse(
                                                            controller()
                                                                .preferredHeightToController
                                                                .text) ??
                                                        0,
                                                    minHeight: int.tryParse(
                                                            controller()
                                                                .preferredHeightFromController
                                                                .text) ??
                                                        0) !=
                                                null &&
                                            controller().isPPrefEdit == true)
                                          Container(
                                            width: w * 0.6,
                                            child: CommonText(
                                                text: validateMaxHeight(
                                                        maxHeight: int.tryParse(
                                                                controller()
                                                                    .preferredHeightToController
                                                                    .text) ??
                                                            0,
                                                        minHeight: int.tryParse(
                                                                controller()
                                                                    .preferredHeightFromController
                                                                    .text) ??
                                                            0) ??
                                                    "",
                                                style: juraTextStyle(
                                                    color: AppColors.red)),
                                          ),

                                        SizedBox(height: h * 0.03),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              CommonText(
                                                  text: AppText.maritalStatus1,
                                                  style: juraTextStyle(
                                                      fontSize: h * 0.024,
                                                      color: AppColors.gray,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller()
                                                .getMarStatusList
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: h * 0.005,
                                                            horizontal:
                                                                w * 0.035),
                                                    child: Row(
                                                      children: [
                                                        CustomRadio(
                                                            size: h * 0.023,
                                                            value: index + 1,
                                                            groupValue: controller()
                                                                .selectMartialStatusRadio,
                                                            onChanged: (value) {
                                                              controller()
                                                                  .onSelectMartialStatus(
                                                                      value!);
                                                              controller()
                                                                  .togglePPrefEditTrue();
                                                            }),
                                                        SizedBox(
                                                            width: w * 0.03),
                                                        CommonText(
                                                          text: controller()
                                                                  .getMarStatusList[
                                                              index],
                                                          style: juraTextStyle(
                                                              fontSize:
                                                                  w * 0.045,
                                                              color: AppColors
                                                                  .gray,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: h * 0.03),

                                                  // Row(
                                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //   children: [
                                                  //     Container(
                                                  //       height: h * 0.03,
                                                  //       width: w * 0.65,
                                                  //       child: CommonText(
                                                  //         text: controller()
                                                  //             .employedInList[index]["name"]
                                                  //             .toString(),
                                                  //         overflow: TextOverflow.ellipsis,
                                                  //         style: juraTextStyle(
                                                  //             fontSize: h * 0.02,
                                                  //             color: AppColors.gray,
                                                  //             fontWeight: FontWeight.w400),
                                                  //       ),
                                                  //     ),
                                                  //     CustomRadio(
                                                  //       size: h * 0.025,
                                                  //       value: index + 1,
                                                  //       groupValue: controller().selectEmployedInRadio,
                                                  //       onChanged: (value) {
                                                  //         controller().onSelectEmployedInStatus(value!);
                                                  //       },
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // SizedBox(
                                                  //   height: h * 0.015,
                                                  // ),
                                                ],
                                              );
                                            }),
                                        if (controller()
                                                .isOtherPartPrefMartialStatus ==
                                            true)
                                          TextInputField(
                                            enabled: true,
                                            onChanged: (str) {
                                              controller()
                                                  .togglePPrefEditTrue();
                                            },
                                            hintText: AppText.others,
                                            hintStyle: juraTextStyle(
                                                color: AppColors.gray,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            textstyle: juraTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            titletextstyle: juraTextStyle(
                                                color: AppColors.grey,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            errorStyle: juraTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w400),
                                            controller: controller()
                                                .preferredOtherMartialStatusController,
                                            keyboardType: TextInputType.text,
                                            containerwidth: w * 0.6,
                                            containerheight: h * 0.04,
                                            containercolor:
                                                AppColors.transparent,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            maxLines: 1,
                                            // borderColor: AppColors.gray,
                                            underline: true,
                                          ),
                                        SizedBox(height: h * 0.01),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonText(
                                              text: AppText.preferredgender,
                                              style: juraTextStyle(
                                                  fontSize: h * 0.024,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonSearchDropdown(
                                                emptyBuilder: (context) {
                                                  return Container();
                                                },
                                                controller:
                                                    controller().partPrefGender,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                containerwidth: w * 0.8,
                                                builder: (context, controller1,
                                                    focusNode) {
                                                  return TextInputField(
                                                      focusNode: focusNode,
                                                      hintText: AppText
                                                          .preferredgender,
                                                      controller: controller1,
                                                      underline: true,
                                                      suffixicon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: h * 0.03,
                                                        color: AppColors.black,
                                                      ),
                                                      hintStyle: juraTextStyle(
                                                          color: AppColors.gray,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textstyle: juraTextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      containerheight: h * 0.05,
                                                      enabled: true,
                                                      onChanged: (str) {
                                                        controller()
                                                            .togglePDEditTrue();
                                                      },
                                                      titletextstyle:
                                                          juraTextStyle(
                                                              color: AppColors
                                                                  .grey,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      errorStyle: juraTextStyle(
                                                          color: AppColors.red,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      lableStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      counterStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      containerwidth: w * 0.8,
                                                      containercolor:
                                                          AppColors.transparent,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none);
                                                },
                                                containerheight: h * 0.06,
                                                focusNode: controller()
                                                    .getFocuspartPrefGenderNode,
                                                containercolor:
                                                    Colors.transparent,
                                                suggestionsCallback:
                                                    (search) async {
                                                  return controller()
                                                      .onPartnerPrefGenderSearchChanged(
                                                          search);
                                                },
                                                itemBuilder: (context, value) {
                                                  if (value != {}) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: w * 0.02),
                                                      child: Text(
                                                        value['name'],
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: h * 0.02),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 0,
                                                      width: 10,
                                                      color: AppColors.white,
                                                    );
                                                  }
                                                },
                                                onSelected: (value) {
                                                  print("valuevalue gs $value");
                                                  controller()
                                                      .changePartnerPrefGender(
                                                          val: value['name']);
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                loadingBuilder: (context) {
                                                  return Container(
                                                    height: h * 0.05,
                                                    color: AppColors.white,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                hideOnEmpty: true,
                                                hideOnLoading: true,
                                                hideKeyboardOnDrag: true,
                                                hideOnSelect: true,
                                                showOnFocus: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonText(
                                              text: AppText.preferredreligion,
                                              style: juraTextStyle(
                                                  fontSize: h * 0.024,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonSearchDropdown(
                                                emptyBuilder: (context) {
                                                  return Container();
                                                },
                                                controller: controller()
                                                    .partPrefReligion,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                containerwidth: w * 0.8,
                                                builder: (context, controller1,
                                                    focusNode) {
                                                  return TextInputField(
                                                      focusNode: focusNode,
                                                      hintText: AppText
                                                          .preferredreligion,
                                                      controller: controller1,
                                                      underline: true,
                                                      suffixicon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: h * 0.03,
                                                        color: AppColors.black,
                                                      ),
                                                      hintStyle: juraTextStyle(
                                                          color: AppColors.gray,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textstyle: juraTextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      containerheight: h * 0.05,
                                                      enabled: true,
                                                      onChanged: (str) {
                                                        controller()
                                                            .togglePDEditTrue();
                                                      },
                                                      titletextstyle:
                                                          juraTextStyle(
                                                              color: AppColors
                                                                  .grey,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      errorStyle: juraTextStyle(
                                                          color: AppColors.red,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      lableStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      counterStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      containerwidth: w * 0.8,
                                                      containercolor:
                                                          AppColors.transparent,
                                                      textCapitalization:
                                                          TextCapitalization.none);
                                                },
                                                containerheight: h * 0.06,
                                                focusNode: controller()
                                                    .getFocuspartPrefReligionNode,
                                                containercolor:
                                                    Colors.transparent,
                                                suggestionsCallback:
                                                    (search) async {
                                                  return controller()
                                                      .onPartnerPrefReligionSearchChanged(
                                                          search);
                                                },
                                                itemBuilder: (context, value) {
                                                  if (value != {}) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: w * 0.02),
                                                      child: Text(
                                                        value['name'],
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: h * 0.02),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 0,
                                                      width: 10,
                                                      color: AppColors.white,
                                                    );
                                                  }
                                                },
                                                onSelected: (value) {
                                                  print("valuevalue gs $value");
                                                  controller()
                                                      .changePartnerPrefReligion(
                                                          val: value['name']);
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                loadingBuilder: (context) {
                                                  return Container(
                                                    height: h * 0.05,
                                                    color: AppColors.white,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                hideOnEmpty: true,
                                                hideOnLoading: true,
                                                hideKeyboardOnDrag: true,
                                                hideOnSelect: true,
                                                showOnFocus: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: h * 0.03),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: CommonText(
                                              text:
                                                  AppText.preferredProfessional,
                                              style: juraTextStyle(
                                                  fontSize: h * 0.026,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonSearchDropdown(
                                                emptyBuilder: (context) {
                                                  return Container();
                                                },
                                                controller: controller()
                                                    .partPrefEducation,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                containerwidth: w * 0.8,
                                                builder: (context, controller1,
                                                    focusNode) {
                                                  return TextInputField(
                                                      focusNode: focusNode,
                                                      hintText:
                                                          AppText.education,
                                                      controller: controller1,
                                                      underline: true,
                                                      suffixicon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: h * 0.03,
                                                        color: AppColors.black,
                                                      ),
                                                      hintStyle: juraTextStyle(
                                                          color: AppColors.gray,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textstyle: juraTextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      containerheight: h * 0.05,
                                                      enabled: true,
                                                      onChanged: (str) {
                                                        controller()
                                                            .togglePDEditTrue();
                                                      },
                                                      titletextstyle:
                                                          juraTextStyle(
                                                              color: AppColors
                                                                  .grey,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      errorStyle: juraTextStyle(
                                                          color: AppColors.red,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      lableStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      counterStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      containerwidth: w * 0.8,
                                                      containercolor:
                                                          AppColors.transparent,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none);
                                                },
                                                containerheight: h * 0.06,
                                                focusNode: controller()
                                                    .getFocuspartPrefEducationNode,
                                                containercolor:
                                                    Colors.transparent,
                                                suggestionsCallback:
                                                    (search) async {
                                                  return controller()
                                                      .onPartnerPrefEducationSearchChanged(
                                                          search);
                                                },
                                                itemBuilder: (context, value) {
                                                  if (value != {}) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: w * 0.02),
                                                      child: Text(
                                                        value['name'],
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: h * 0.02),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 0,
                                                      width: 10,
                                                      color: AppColors.white,
                                                    );
                                                  }
                                                },
                                                onSelected: (value) {
                                                  print("valuevalue gs $value");
                                                  controller()
                                                      .changePartnerPrefEducation(
                                                          val: value['name']);
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                loadingBuilder: (context) {
                                                  return Container(
                                                    height: h * 0.05,
                                                    color: AppColors.white,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                hideOnEmpty: true,
                                                hideOnLoading: true,
                                                hideKeyboardOnDrag: true,
                                                hideOnSelect: true,
                                                showOnFocus: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonSearchDropdown(
                                                emptyBuilder: (context) {
                                                  return Container();
                                                },
                                                controller: controller()
                                                    .partPrefOccupation,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                containerwidth: w * 0.8,
                                                builder: (context, controller1,
                                                    focusNode) {
                                                  return TextInputField(
                                                      focusNode: focusNode,
                                                      hintText:
                                                          AppText.occupation,
                                                      controller: controller1,
                                                      underline: true,
                                                      suffixicon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: h * 0.03,
                                                        color: AppColors.black,
                                                      ),
                                                      hintStyle: juraTextStyle(
                                                          color: AppColors.gray,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textstyle: juraTextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      containerheight: h * 0.05,
                                                      enabled: true,
                                                      onChanged: (str) {
                                                        controller()
                                                            .togglePDEditTrue();
                                                      },
                                                      titletextstyle:
                                                          juraTextStyle(
                                                              color: AppColors
                                                                  .grey,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      errorStyle: juraTextStyle(
                                                          color: AppColors.red,
                                                          fontSize: h * 0.025,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      lableStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      counterStyle: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      containerwidth: w * 0.8,
                                                      containercolor:
                                                          AppColors.transparent,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none);
                                                },
                                                containerheight: h * 0.06,
                                                focusNode: controller()
                                                    .getFocuspartPrefOccupationNode,
                                                containercolor:
                                                    Colors.transparent,
                                                suggestionsCallback:
                                                    (search) async {
                                                  return controller()
                                                      .onPartnerPrefOccupationSearchChanged(
                                                          search);
                                                },
                                                itemBuilder: (context, value) {
                                                  if (value != {}) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: w * 0.02),
                                                      child: Text(
                                                        value['name'],
                                                        style: juraTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: h * 0.02),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 0,
                                                      width: 10,
                                                      color: AppColors.white,
                                                    );
                                                  }
                                                },
                                                onSelected: (value) {
                                                  print("valuevalue gs $value");
                                                  controller()
                                                      .onSelectPartnerPrefOccupationStatus(
                                                          val: value['name']);
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                loadingBuilder: (context) {
                                                  return Container(
                                                    height: h * 0.05,
                                                    color: AppColors.white,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                hideOnEmpty: true,
                                                hideOnLoading: true,
                                                hideKeyboardOnDrag: true,
                                                hideOnSelect: true,
                                                showOnFocus: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextInputField(
                                                enabled: true,
                                                onChanged: (str) {
                                                  controller()
                                                      .togglePPrefEditTrue();
                                                },
                                                hintText: AppText.others,
                                                hintStyle: juraTextStyle(
                                                    color: AppColors.gray,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textstyle: juraTextStyle(
                                                    color: AppColors.black,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),

                                                titletextstyle: juraTextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),

                                                errorStyle: juraTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.025,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: controller().others,
                                                keyboardType:
                                                    TextInputType.text,
                                                containerwidth: w * 0.8,
                                                containercolor:
                                                    AppColors.transparent,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                obscureText: false,
                                                maxLines: 1,
                                                // borderColor: AppColors.gray,

                                                underline: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: h * 0.03),
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.005),
                                              child: CommonText(
                                                  text:
                                                      AppText.preferredLocation,
                                                  style: juraTextStyle(
                                                      fontSize: h * 0.026,
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.005),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CommonSearchDropdown(
                                                    emptyBuilder: (context) {
                                                      return Container();
                                                    },
                                                    controller: controller()
                                                        .partPrefCountry,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    containerwidth: w * 0.8,
                                                    builder: (context,
                                                        controller1,
                                                        focusNode) {
                                                      return TextInputField(
                                                          focusNode: focusNode,
                                                          hintText:
                                                              AppText.country,
                                                          controller:
                                                              controller1,
                                                          underline: true,
                                                          suffixicon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                            size: h * 0.03,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                          hintStyle: juraTextStyle(
                                                              color: AppColors
                                                                  .gray,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          textstyle: juraTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          containerheight:
                                                              h * 0.05,
                                                          enabled: true,
                                                          onChanged: (str) {
                                                            controller()
                                                                .togglePDEditTrue();
                                                          },
                                                          titletextstyle: juraTextStyle(
                                                              color: AppColors
                                                                  .grey,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          errorStyle: juraTextStyle(
                                                              color:
                                                                  AppColors.red,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          lableStyle: TextStyle(
                                                              color: AppColors
                                                                  .textColor,
                                                              fontSize:
                                                                  h * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          counterStyle: TextStyle(
                                                              color: AppColors
                                                                  .textColor,
                                                              fontSize: h * 0.02,
                                                              fontWeight: FontWeight.w400),
                                                          keyboardType: TextInputType.text,
                                                          containerwidth: w * 0.8,
                                                          containercolor: AppColors.transparent,
                                                          textCapitalization: TextCapitalization.none);
                                                    },
                                                    containerheight: h * 0.06,
                                                    focusNode: controller()
                                                        .getFocuspartPrefCountryNode,
                                                    containercolor:
                                                        Colors.transparent,
                                                    suggestionsCallback:
                                                        (search) async {
                                                      return controller()
                                                          .onCountrySearchChanged(
                                                              search);
                                                    },
                                                    itemBuilder:
                                                        (context, value) {
                                                      if (value != {}) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left:
                                                                      w * 0.02),
                                                          child: Text(
                                                            value['name'],
                                                            style: juraTextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .textColor,
                                                                fontSize:
                                                                    h * 0.02),
                                                          ),
                                                        );
                                                      } else {
                                                        return Container(
                                                          height: 0,
                                                          width: 10,
                                                          color:
                                                              AppColors.white,
                                                        );
                                                      }
                                                    },
                                                    onSelected: (value) {
                                                      print(
                                                          "valuevalue gs $value");
                                                      controller()
                                                          .changePartnerCountry(
                                                              val: value[
                                                                  'name']);
                                                      controller()
                                                          .togglePPrefEditTrue();
                                                    },
                                                    loadingBuilder: (context) {
                                                      return Container(
                                                        height: h * 0.05,
                                                        color: AppColors.white,
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: AppColors
                                                                .colorPrimary,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    hideOnEmpty: true,
                                                    hideOnLoading: true,
                                                    hideKeyboardOnDrag: true,
                                                    hideOnSelect: true,
                                                    showOnFocus: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.005),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CommonSearchDropdown(
                                                    emptyBuilder: (context) {
                                                      return Container();
                                                    },
                                                    controller: controller()
                                                        .partPrefState,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    containerwidth: w * 0.8,
                                                    builder: (context,
                                                        controller1,
                                                        focusNode) {
                                                      return TextInputField(
                                                          onTap: () {
                                                            if (controller()
                                                                    .isPartPrefCountrySelected ==
                                                                false) {
                                                              DialogServiceV1().showSnackBar(
                                                                  content:
                                                                      "Please select Country",
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  textclr:
                                                                      AppColors
                                                                          .white);
                                                            } else if (controller()
                                                                    .isPartPrefStateLoaded ==
                                                                false)
                                                              DialogServiceV1().showSnackBar(
                                                                  content:
                                                                      "loading..",
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  textclr:
                                                                      AppColors
                                                                          .white);
                                                          },
                                                          focusNode: focusNode,
                                                          hintText:
                                                              AppText.state,
                                                          controller:
                                                              controller1,
                                                          underline: true,
                                                          suffixicon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                            size: h * 0.03,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                          hintStyle:
                                                              juraTextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .gray,
                                                                  fontSize:
                                                                      h * 0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                          textstyle: juraTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          containerheight:
                                                              h * 0.05,
                                                          enabled: controller()
                                                                  .isPartPrefStateLoaded &&
                                                              controller()
                                                                  .isPartPrefCountrySelected &&
                                                              controller()
                                                                  .isPPrefEdit,
                                                          onChanged: (str) {
                                                            controller()
                                                                .togglePDEditTrue();
                                                          },
                                                          titletextstyle:
                                                              juraTextStyle(
                                                                  color: AppColors
                                                                      .grey,
                                                                  fontSize:
                                                                      h * 0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                          errorStyle: juraTextStyle(
                                                              color:
                                                                  AppColors.red,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          lableStyle: TextStyle(
                                                              color: AppColors.textColor,
                                                              fontSize: h * 0.02,
                                                              fontWeight: FontWeight.w400),
                                                          counterStyle: TextStyle(color: AppColors.textColor, fontSize: h * 0.02, fontWeight: FontWeight.w400),
                                                          keyboardType: TextInputType.text,
                                                          containerwidth: w * 0.8,
                                                          containercolor: AppColors.transparent,
                                                          textCapitalization: TextCapitalization.none);
                                                    },
                                                    containerheight: h * 0.06,
                                                    focusNode: controller()
                                                        .getFocuspartPrefStateNode,
                                                    containercolor:
                                                        Colors.transparent,
                                                    suggestionsCallback:
                                                        (search) async {
                                                      return controller()
                                                          .onPartnerPrefsStateSearchChanged(
                                                              search);
                                                    },
                                                    itemBuilder:
                                                        (context, value) {
                                                      if (value != {}) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left:
                                                                      w * 0.02),
                                                          child: Text(
                                                            value['name'],
                                                            style: juraTextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .textColor,
                                                                fontSize:
                                                                    h * 0.02),
                                                          ),
                                                        );
                                                      } else {
                                                        return Container(
                                                          height: 0,
                                                          width: 10,
                                                          color:
                                                              AppColors.white,
                                                        );
                                                      }
                                                    },
                                                    onSelected: (value) {
                                                      print(
                                                          "valuevalue gs $value");
                                                      controller()
                                                          .changePartnerPrefState(
                                                              val: value[
                                                                  'name']);
                                                      controller()
                                                          .togglePPrefEditTrue();
                                                    },
                                                    loadingBuilder: (context) {
                                                      return Container(
                                                        height: h * 0.05,
                                                        color: AppColors.white,
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: AppColors
                                                                .colorPrimary,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    hideOnEmpty: true,
                                                    hideOnLoading: true,
                                                    hideKeyboardOnDrag: true,
                                                    hideOnSelect: true,
                                                    showOnFocus: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        ///=============================================== End Partner Preference
                                        if ((controller().isEdit == true &&
                                                controller().isPPrefEdit) ||
                                            controller().isNewAcc == true)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.005),
                                            child: Center(
                                              child: CommonButton(
                                                  containerwidth: w * 0.4,
                                                  containerheight: h * 0.05,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient: commonGradient(),
                                                  ),
                                                  text: AppText.save,
                                                  textStyle: juraTextStyle(
                                                    color: AppColors.white,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  onPressed: () {
                                                    controller()
                                                        .onCreatePartnerPreference();
                                                    controller()
                                                        .togglePPrefEditFalse();

                                                    // commonNavigator(
                                                    //     context: context,
                                                    //     child:
                                                    //         MyAccountScreen(),
                                                    //     type: PageTransitionType
                                                    //         .fade);
                                                  }),
                                            ),
                                          ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!(controller().partPrefsDetailCompleted &&
                                      controller().RECDetailCompleted &&
                                      controller().familyDetailCompleted &&
                                      controller().personalDetailCompleted))
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: CommonText(
                                        text: AppText
                                            .conditionForApplyForVerificationText,
                                        style: juraTextStyle(
                                          color: AppColors.textBlack,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  if (controller().partPrefsDetailCompleted &&
                                      controller().RECDetailCompleted &&
                                      controller().familyDetailCompleted &&
                                      controller().personalDetailCompleted)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: CommonText(
                                        text: AppText.applyForVerificationText,
                                        style: juraTextStyle(
                                          color: AppColors.textBlack,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  if (controller().partPrefsDetailCompleted &&
                                      controller().RECDetailCompleted &&
                                      controller().familyDetailCompleted &&
                                      controller().personalDetailCompleted)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.005),
                                      child: Center(
                                        child: CommonButton(
                                            containerwidth: w * 0.8,
                                            containerheight: h * 0.05,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              gradient: commonGradient(),
                                            ),
                                            text: AppText.applyForVerification,
                                            textStyle: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            onPressed: () {
                                              controller()
                                                  .applyForVerification();

                                              // commonNavigator(
                                              //     context: context,
                                              //     child:
                                              //         MyAccountScreen(),
                                              //     type: PageTransitionType
                                              //         .fade);
                                            }),
                                      ),
                                    ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ///back button
                          Positioned(
                            right: w * 0.02,
                            top: h * 0.02,
                            child: IconButton(
                              onPressed: () async {
                                if (frromRegister == true) {
                                  DialogServiceV1().areYouSureDialogue(
                                      noText: "Edit",
                                      yesText: "Save",
                                      subtitleText:
                                          "This details are mendetory and it will displayed on your pofile and make sure to fill all details correctly.",
                                      onNoPressed: () {
                                        Navigator.pop(context);
                                      },
                                      onYesPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            Globals
                                                .navigatorKey.currentContext!,
                                            PageTransition(
                                                child: AfterBottomBar(),
                                                type: PageTransitionType.fade,
                                                duration: const Duration(
                                                    milliseconds: 400)),
                                            (Route<dynamic> route) => false);
                                      },
                                      titleText: 'Are you sure?');
                                } else {
                                  if (this.controller != null) {
                                    await this.controller!().build();
                                  }
                                  Navigator.pop(context);
                                }
                                // commonNavigator(
                                //     context: context,
                                //     child: ProfilePageScreen(),
                                //     type: PageTransitionType.fade);
                              },
                              icon: Icon(
                                frromRegister == true
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios_new,
                                size: h * 0.03,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
