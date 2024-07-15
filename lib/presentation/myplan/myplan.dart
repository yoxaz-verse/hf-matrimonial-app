import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/checkout/checkoutScreen.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/common_components/common_checkbox.dart';
import '../../utils/import_utils.dart';
import '../error/error_screen.dart';
import '../shimmers/myplan_subscription_shimmer.dart';
import 'myplan_controller.dart';

class MyPlanScreen extends ConsumerStatefulWidget {
  const MyPlanScreen({super.key});

  @override
  ConsumerState createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends ConsumerState<MyPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(myPlanScreenControllerProvider);
    controller() => ref.read(myPlanScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.zero,
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // commonNavigator(
              //     context: context,
              //     child: const ProfilePageScreen(),
              //     type: PageTransitionType.fade);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: controller().isLoading ?  MyPlanSubscriptionShimmer():Stack(
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
                        color: AppColors.black.withOpacity(0.019),
                        fontSize: h * 0.032,
                        fontWeight: FontWeight.w500))),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: h * 0.13,
              width: w * 0.40,
              child: Image.asset(
                AppImg.topRing,
                fit: BoxFit.fill,
                color: AppColors.white.withOpacity(0.02),
                colorBlendMode: BlendMode.lighten,
              ),
            ),
          ),
          Positioned(
            bottom: h * 0.07,
            left: -w * 0.01,
            child: Column(
              children: [
                Image.asset(
                  AppImg.bottomRing,
                  fit: BoxFit.fill,
                  height: h * 0.17,
                  width: w * 0.5,
                  color: AppColors.white.withOpacity(0.02),
                  colorBlendMode: BlendMode.lighten,
                ),
              ],
            ),
          ),
          controller().myPlanData?["data"]?["accountId"]?
          ["isSubscribed"] ==
              true
              ? SingleChildScrollView(
            child: Column(
              children: [
                CommonText(
                  text: AppText.myplan,
                  textAlign: TextAlign.center,
                  style: juraTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: h * 0.036,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.01),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Image.asset(
                  //       AppImg.invoice,
                  //       fit: BoxFit.fill,
                  //       color: AppColors.yellow,
                  //       height: h * 0.028,
                  //     ),
                  //     CommonText(
                  //       text: AppText.invoice,
                  //       textAlign: TextAlign.center,
                  //       style: juraTextStyle(
                  //         color: AppColors.yellow,
                  //         fontWeight: FontWeight.w800,
                  //         fontSize: h * 0.022,
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.download_outlined,
                  //       color:
                  //           AppColors.textColor.withOpacity(0.5),
                  //       size: h * 0.02,
                  //     )
                  //   ],
                  // ),
                ),
                Card(
                  elevation: 5,
                  color: AppColors.white,
                  margin:
                  EdgeInsets.symmetric(horizontal: w * 0.04),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(h * 0.01)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.03, vertical: h * 0.01),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                        BorderRadius.circular(h * 0.010)),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            CommonText(
                              text: AppText.subscription,
                              textAlign: TextAlign.center,
                              style: juraTextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: h * 0.03,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            Card(
                                elevation: 5,
                                // shadowColor: AppColors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        h * 0.01)),
                                child: Container(
                                  // height: h * 0.35,
                                  width: w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02,
                                      vertical: h * 0.015),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                      BorderRadius.circular(
                                          h * 0.01)),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      CommonText(
                                        text: AppText
                                            .subscriptionDetail,
                                        textAlign:
                                        TextAlign.start,
                                        style: juraTextStyle(
                                          color: AppColors.black
                                              .withOpacity(0.8),
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: h * 0.024,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      if (controller()
                                          .planDetails
                                          .length !=
                                          0)
                                        ListView.builder(
                                          itemCount: controller()
                                              .planDetails
                                              .length,
                                          scrollDirection:
                                          Axis.vertical,
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          padding:
                                          const EdgeInsets
                                              .all(0),
                                          // width: w,
                                          // height: h * 0.06 * controller().familyDetails.length,
                                          itemBuilder:
                                              (context, index) {
                                            return Padding(
                                              padding:
                                              EdgeInsets.all(
                                                  h * 0.01),
                                              child: DecoratedBox(
                                                decoration:
                                                BoxDecoration(
                                                  border: Border(
                                                    bottom:
                                                    BorderSide(
                                                      color:
                                                      AppColors
                                                          .grey,
                                                      width: h *
                                                          0.001,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    CommonText(
                                                      text: controller()
                                                          .planDetails[
                                                      index]
                                                          .keys
                                                          .first,
                                                      style: juraTextStyle(
                                                          fontSize:
                                                          h * 0.02),
                                                    ),
                                                    CommonText(
                                                      text: controller()
                                                          .planDetails[
                                                      index]
                                                          .values
                                                          .first,
                                                      style:
                                                      juraTextStyle(
                                                        fontSize:
                                                        h * 0.02,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                        color: AppColors
                                                            .black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment
                                      //           .spaceBetween,
                                      //   children: [
                                      //     CommonText(
                                      //       text: AppText
                                      //           .currentPlan,
                                      //       style: juraTextStyle(
                                      //         color: AppColors
                                      //             .black
                                      //             .withOpacity(
                                      //                 0.5),
                                      //         fontWeight:
                                      //             FontWeight.w600,
                                      //         fontSize: h * 0.02,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       width: w * 0.4,
                                      //       child: CommonText(
                                      //         text: AppText
                                      //             .goldenpackage,
                                      //         style:
                                      //             juraTextStyle(
                                      //           fontWeight:
                                      //               FontWeight
                                      //                   .w600,
                                      //           color:
                                      //               AppColors
                                      //                   .black,
                                      //           fontSize:
                                      //               h * 0.02,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment
                                      //           .spaceBetween,
                                      //   children: [
                                      //     CommonText(
                                      //       text:
                                      //           AppText.Validity,
                                      //       style: juraTextStyle(
                                      //         color: AppColors
                                      //             .black
                                      //             .withOpacity(
                                      //                 0.5),
                                      //         fontWeight:
                                      //             FontWeight.w600,
                                      //         fontSize: h * 0.02,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       width: w * 0.4,
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment
                                      //                 .start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: "3 month",
                                      //             textAlign:
                                      //                 TextAlign
                                      //                     .center,
                                      //             style:
                                      //                 juraTextStyle(
                                      //               fontWeight:
                                      //                   FontWeight
                                      //                       .w600,
                                      //               color:
                                      //                   AppColors
                                      //                       .black,
                                      //               fontSize:
                                      //                   h * 0.02,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment
                                      //           .spaceBetween,
                                      //   children: [
                                      //     CommonText(
                                      //       text: AppText
                                      //           .monthlyQuota,
                                      //       textAlign:
                                      //           TextAlign.center,
                                      //       style: juraTextStyle(
                                      //         color: AppColors
                                      //             .black
                                      //             .withOpacity(
                                      //                 0.5),
                                      //         fontWeight:
                                      //             FontWeight.w600,
                                      //         fontSize: h * 0.02,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       width: w * 0.4,
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment
                                      //                 .start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: "2000/-",
                                      //             textAlign:
                                      //                 TextAlign
                                      //                     .center,
                                      //             style:
                                      //                 juraTextStyle(
                                      //               fontWeight:
                                      //                   FontWeight
                                      //                       .w600,
                                      //               color:
                                      //                   AppColors
                                      //                       .black,
                                      //               fontSize:
                                      //                   h * 0.02,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment
                                      //           .spaceBetween,
                                      //   children: [
                                      //     CommonText(
                                      //       text: AppText
                                      //           .remainingQuota,
                                      //       style: juraTextStyle(
                                      //         color: AppColors
                                      //             .black
                                      //             .withOpacity(
                                      //                 0.5),
                                      //         fontWeight:
                                      //             FontWeight.w600,
                                      //         fontSize: h * 0.02,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       width: w * 0.3,
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment
                                      //                 .start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: "4000",
                                      //             textAlign:
                                      //                 TextAlign
                                      //                     .start,
                                      //             style:
                                      //                 juraTextStyle(
                                      //               fontWeight:
                                      //                   FontWeight
                                      //                       .w600,
                                      //               color:
                                      //                   AppColors
                                      //                       .black,
                                      //               fontSize:
                                      //                   h * 0.02,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Row(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment
                                      //           .start,
                                      //   children: [
                                      //     CommonText(
                                      //       text:
                                      //           AppText.addOnpack,
                                      //       style: juraTextStyle(
                                      //         color: AppColors
                                      //             .black
                                      //             .withOpacity(
                                      //                 0.5),
                                      //         fontWeight:
                                      //             FontWeight.w600,
                                      //         fontSize: h * 0.02,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       width: w * 0.375,
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment
                                      //                 .start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: AppText
                                      //                 .highlighter,
                                      //             style:
                                      //                 juraTextStyle(
                                      //               fontWeight:
                                      //                   FontWeight
                                      //                       .w600,
                                      //               color:
                                      //                   AppColors
                                      //                       .black,
                                      //               fontSize:
                                      //                   h * 0.017,
                                      //             ),
                                      //           ),
                                      //           CommonText(
                                      //             text:
                                      //                 "1000/- (for 15 days) ",
                                      //             textAlign:
                                      //                 TextAlign
                                      //                     .center,
                                      //             style:
                                      //                 juraTextStyle(
                                      //               fontWeight:
                                      //                   FontWeight
                                      //                       .w600,
                                      //               color:
                                      //                   AppColors
                                      //                       .black,
                                      //               fontSize:
                                      //                   h * 0.015,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        if (controller()
                            .addOnViewData
                            .isNotEmpty || controller()
                            .addOnSlotData
                            .isNotEmpty || controller()
                            .addOnInterestData
                            .isNotEmpty) Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.1),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              CommonText(
                                text: AppText.add_pack,
                                textAlign: TextAlign.center,
                                style: juraTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: h * 0.028,
                                ),
                              ),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  if (controller()
                                      .addOnViewData
                                      .isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnViewData["name"],
                                          style: juraTextStyle(
                                            color: AppColors.gradient2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: h * 0.022,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnViewData[
                                          "description"],
                                          maxLines: 5,
                                          style: juraTextStyle(
                                            fontSize: h * 0.018,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            CommonText(
                                              text:
                                              "${controller().addOnViewData["price"]}/- for ${controller().addOnViewData["view"]} views",
                                              style: juraTextStyle(
                                                fontSize: h * 0.016,
                                              ),
                                            ),
                                            // CustomCheckboxx(
                                            //   value: controller()
                                            //       .isAddViewChecked,
                                            //   onChanged: (val) {
                                            //     controller()
                                            //         .toggleAddView(val);
                                            //   },
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),

                                        CommonButton(
                                            containerwidth: w * 0.4,
                                            containerheight: h * 0.05,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    h * 0.015)),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  h * 0.005),
                                              gradient: commonGradient(),
                                            ),
                                            text: AppText.buy,
                                            textStyle: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            onPressed: () {
                                              controller().onMakePaymentTap(index: 0,amount: int.parse(controller().addOnViewData["price"].toString()));
                                            }),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                      ],
                                    ),
                                  if (controller()
                                      .addOnSlotData
                                      .isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnSlotData["name"],
                                          style: juraTextStyle(
                                            color: AppColors.gradient2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: h * 0.022,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnSlotData[
                                          "description"],
                                          maxLines: 5,
                                          style: juraTextStyle(
                                            fontSize: h * 0.018,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            CommonText(
                                              text:
                                              "${controller().addOnSlotData["price"]}/- for ${controller().addOnSlotData["duration"]} months",
                                              style: juraTextStyle(
                                                fontSize: h * 0.016,
                                              ),
                                            ),
                                            // CustomCheckboxx(
                                            //   value: controller()
                                            //       .isAddSlotChecked,
                                            //   onChanged: (val) {
                                            //     controller()
                                            //         .toggleAddSlot(val);
                                            //   },
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),

                                        CommonButton(
                                            containerwidth: w * 0.4,
                                            containerheight: h * 0.05,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    h * 0.015)),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  h * 0.005),
                                              gradient: commonGradient(),
                                            ),
                                            text: AppText.buy,
                                            textStyle: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            onPressed: () {
                                              controller().onMakePaymentTap(index: 1,amount: int.parse(controller().addOnSlotData["price"].toString()));

                                            }),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                      ],
                                    ),
                                  if (controller()
                                      .addOnInterestData
                                      .isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnInterestData[
                                          "name"],
                                          style: juraTextStyle(
                                            color: AppColors.gradient2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: h * 0.022,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        CommonText(
                                          text: controller()
                                              .addOnInterestData[
                                          "description"],
                                          maxLines: 5,
                                          style: juraTextStyle(
                                            fontSize: h * 0.018,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            CommonText(
                                              text:
                                              "${controller().addOnInterestData["price"]}/- for ${controller().addOnInterestData["interest"]} Interests",
                                              style: juraTextStyle(
                                                fontSize: h * 0.016,
                                              ),
                                            ),
                                            // CustomCheckboxx(
                                            //   value: controller()
                                            //       .isAddInterestChecked,
                                            //   onChanged: (val) {
                                            //     controller()
                                            //         .toggleAddInterest(
                                            //         val);
                                            //   },
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),

                                        CommonButton(
                                            containerwidth: w * 0.4,
                                            containerheight: h * 0.05,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    h * 0.015)),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  h * 0.005),
                                              gradient: commonGradient(),
                                            ),
                                            text: AppText.buy,
                                            textStyle: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            onPressed: () {
                                              controller().onMakePaymentTap(index: 2,amount: int.parse(controller().addOnInterestData["price"].toString()));

                                            }),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),

                                      ],
                                    ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                )
              ],
            ),
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: AppText.myplan,
                  textAlign: TextAlign.center,
                  style: juraTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: h * 0.036,
                  ),
                ),
                SizedBox(height: h * 0.1),
                Column(
                  children: [
                    Container(
                      width: w * 0.4,
                      child: CommonText(
                        text: "Oops!",
                        style: juraTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.06,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: w * 0.45,
                      child: CommonText(
                        text: AppText.currentNoPlan,
                        style: juraTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
