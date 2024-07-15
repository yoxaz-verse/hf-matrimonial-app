import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/images.dart';
import 'package:page_transition/page_transition.dart';

import '../../application/validate/validate.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_checkbox.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_radio.dart';
import '../../utils/common_components/text_input_field.dart';
import '../../utils/text.dart';
import '../br_detail/br_detail.dart';
import '../error/error_screen.dart';
import '../payment/razorpay_payment.dart';
import '../payment/razorpay_payment_controller.dart';
import '../shimmers/checkout_screen_shimmer.dart';
import '../subsription/subscription_screen_controller.dart';
import 'checkoutScreen_controller.dart';

class CheckOutScreen extends ConsumerWidget {
  Map<String, dynamic>? planData;
  CheckOutScreen({super.key, this.planData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final asyncState = ref.watch(
        checkoutScreenControllerProvider); //checkoutScreenControllerProvider
    controller() => ref.read(checkoutScreenControllerProvider
        .notifier); //checkoutScreenControllerProvider

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: asyncState.when(
          data: (data) => SafeArea(
                child: Center(
                  child: Container(
                    height: h * 0.9,
                    width: w * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(h * 0.024),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Positioned(
                            top: h * 0.01,
                            left: w * 0.6,
                            child: Image.asset(
                              AppImg.ringbg,
                              height: h * 0.1,
                              width: w * 0.380,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(h * 0.018),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.035,
                                  ),
                                  CommonText(
                                      text: AppText.cheakout,
                                      style: juraTextStyle(
                                        fontSize: h * 0.032,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  Center(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: w * 0.8,
                                          height: h * 0.55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                h * 0.024),
                                            image: DecorationImage(
                                              image: AssetImage(AppImg.goldbg),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                AppColors.black
                                                    .withOpacity(0.3),
                                                BlendMode.darken,
                                              ),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(h * 0.024),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: h * 0.07,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border(
                                                            bottom: BorderSide(
                                                              color: AppColors
                                                                  .white,
                                                              width: h * 0.001,
                                                            ),
                                                          ),
                                                        ),
                                                        child: CommonText(
                                                          text:
                                                              AppText.benefits,
                                                          style: juraTextStyle(
                                                            fontSize: h * 0.03,
                                                            color:
                                                                AppColors.white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          ImageIcon(
                                                            AssetImage(
                                                                AppImg.done),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          SizedBox(
                                                              width: w * 0.02),
                                                          CommonText(
                                                              text:
                                                                  "View ${planData?["view"] ?? 0} contact details",
                                                              style: juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.022,
                                                                  color: AppColors
                                                                      .white))
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          ImageIcon(
                                                            AssetImage(
                                                                AppImg.done),
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          SizedBox(
                                                              width: w * 0.02),
                                                          CommonText(
                                                            text:
                                                                "Send ${planData?["interest"] ?? 0} interest",
                                                            style: juraTextStyle(
                                                                fontSize:
                                                                    h * 0.022,
                                                                color: AppColors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.02,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            ImageIcon(
                                                              AssetImage(
                                                                  AppImg.done),
                                                              color:
                                                              AppColors.transparent,
                                                            ),
                                                            SizedBox(
                                                                width: w * 0.02),
                                                            Container(
                                                              height: h * 0.21,
                                                              width: w*0.6,
                                                              child: CommonText(

                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                text: planData?[
                                                                        "description"] ??
                                                                    "",
                                                                maxLines: 8,
                                                                style: juraTextStyle(
                                                                  fontSize: h * 0.016,
                                                                  color:
                                                                      AppColors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // SizedBox(height: h * 0.0),
                                                      //
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: h * 0,
                                                child: Container(
                                                  width: w * 0.8,
                                                  height: h * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.black
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                              h * 0.026),
                                                      bottomRight:
                                                          Radius.circular(
                                                              h * 0.024),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      // Container(
                                                      //   width: w * 0.33,
                                                      //   height: h * 0.06,
                                                      //
                                                      //   child: Stack(
                                                      //     children: [
                                                      //       Container(
                                                      //         height: h *0.06,
                                                      //         width: w * 0.4,
                                                      //         child:
                                                      //         Row(
                                                      //           mainAxisAlignment:
                                                      //           MainAxisAlignment.center,
                                                      //           crossAxisAlignment:
                                                      //           CrossAxisAlignment.center,
                                                      //           children: [
                                                      //             CommonText(
                                                      //                 text: AppText.rs,
                                                      //                 style: juraTextStyle(
                                                      //                   fontSize: h * 0.022,
                                                      //                   fontWeight: FontWeight.w700,
                                                      //                   color: AppColors.white.withOpacity(0.70),
                                                      //                 )),
                                                      //             CommonText(
                                                      //                 text: "6000",
                                                      //                 style: juraTextStyle(
                                                      //                   fontSize: h * 0.032,
                                                      //                   fontWeight: FontWeight.w700,
                                                      //                   color: AppColors.white.withOpacity(0.70),
                                                      //                 )),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //       Center(
                                                      //         child:
                                                      //         Container(
                                                      //           height: h *
                                                      //               0.04,
                                                      //           width: w *
                                                      //               0.6,
                                                      //           child: Image
                                                      //               .asset(
                                                      //             AppImg
                                                      //                 .cross,
                                                      //             fit: BoxFit
                                                      //                 .cover,
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        height: h * 0.06,
                                                        width: w * 0.4,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CommonText(
                                                                text:
                                                                    AppText.rs,
                                                                style:
                                                                    juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.024,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                )),
                                                            CommonText(
                                                                text:
                                                                    "${planData?["price"] ?? 0}",
                                                                style:
                                                                    juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.044,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: w * 0.25,
                                          child: Container(
                                            height: h * 0.075,
                                            width: w * 0.55,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(h * 0.024),
                                                topRight:
                                                    Radius.circular(h * 0.024),
                                              ),
                                              gradient: commonGradientForPlan(name: planData?["name"] ?? ""),
                                            ),
                                            child: Column(
                                              children: [
                                                CommonText(
                                                  text: planData?["name"] ?? "",
                                                  style: juraTextStyle(
                                                    fontSize: h * 0.024,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CommonText(
                                                      text: AppText.Validity,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.042,
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    CommonText(
                                                      text: (planData?[
                                                              "duration"] ??
                                                          "").toString(),
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.042,
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  // if (controller()
                                  //     .addOnViewData
                                  //     .isNotEmpty) Container(
                                  //   width: w * 0.75,
                                  //   // height: h * 0.5,
                                  //   decoration: BoxDecoration(
                                  //     color: AppColors.white,
                                  //     borderRadius:
                                  //         BorderRadius.circular(h * 0.024),
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //         color:
                                  //             AppColors.black.withOpacity(0.2),
                                  //         spreadRadius: 5,
                                  //         blurRadius: 15,
                                  //         offset: Offset(0, 3),
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.all(h * 0.016),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       children: [
                                  //         if (controller()
                                  //             .addOnViewData
                                  //             .isNotEmpty)CommonText(
                                  //           text: AppText.add_pack,
                                  //           textAlign: TextAlign.center,
                                  //           style: juraTextStyle(
                                  //             fontWeight: FontWeight.w700,
                                  //             fontSize: h * 0.028,
                                  //           ),
                                  //         ),
                                  //         if (controller()
                                  //             .addOnViewData
                                  //             .isNotEmpty)
                                  //           Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               SizedBox(
                                  //                 height: h * 0.02,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                     .addOnViewData["name"],
                                  //                 style: juraTextStyle(
                                  //                   color: AppColors.gradient2,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   fontSize: h * 0.022,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                         .addOnViewData[
                                  //                     "description"],
                                  //                 maxLines: 5,
                                  //                 style: juraTextStyle(
                                  //                   fontSize: h * 0.018,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceBetween,
                                  //                 children: [
                                  //                   CommonText(
                                  //                     text:
                                  //                         "${controller().addOnViewData["price"]}/- for ${controller().addOnViewData["view"]} views",
                                  //                     style: juraTextStyle(
                                  //                       fontSize: h * 0.016,
                                  //                     ),
                                  //                   ),
                                  //                   CustomCheckboxx(
                                  //                     value: controller()
                                  //                         .isAddViewChecked,
                                  //                     onChanged: (val) {
                                  //                       controller()
                                  //                           .toggleAddView(val);
                                  //                     },
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         if (controller()
                                  //             .addOnSlotData
                                  //             .isNotEmpty)
                                  //           Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               SizedBox(
                                  //                 height: h * 0.02,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                     .addOnSlotData["name"],
                                  //                 style: juraTextStyle(
                                  //                   color: AppColors.gradient2,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   fontSize: h * 0.022,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                         .addOnSlotData[
                                  //                     "description"],
                                  //                 maxLines: 5,
                                  //                 style: juraTextStyle(
                                  //                   fontSize: h * 0.018,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceBetween,
                                  //                 children: [
                                  //                   CommonText(
                                  //                     text:
                                  //                         "${controller().addOnSlotData["price"]}/- for ${controller().addOnSlotData["duration"]} months",
                                  //                     style: juraTextStyle(
                                  //                       fontSize: h * 0.016,
                                  //                     ),
                                  //                   ),
                                  //                   CustomCheckboxx(
                                  //                     value: controller()
                                  //                         .isAddSlotChecked,
                                  //                     onChanged: (val) {
                                  //                       controller()
                                  //                           .toggleAddSlot(val);
                                  //                     },
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         if (controller()
                                  //             .addOnInterestData
                                  //             .isNotEmpty)
                                  //           Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               SizedBox(
                                  //                 height: h * 0.02,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                         .addOnInterestData[
                                  //                     "name"],
                                  //                 style: juraTextStyle(
                                  //                   color: AppColors.gradient2,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   fontSize: h * 0.022,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               CommonText(
                                  //                 text: controller()
                                  //                         .addOnInterestData[
                                  //                     "description"],
                                  //                 maxLines: 5,
                                  //                 style: juraTextStyle(
                                  //                   fontSize: h * 0.018,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: h * 0.01,
                                  //               ),
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceBetween,
                                  //                 children: [
                                  //                   CommonText(
                                  //                     text:
                                  //                         "${controller().addOnInterestData["price"]}/- for ${controller().addOnInterestData["interest"]} Interests",
                                  //                     style: juraTextStyle(
                                  //                       fontSize: h * 0.016,
                                  //                     ),
                                  //                   ),
                                  //                   CustomCheckboxx(
                                  //                     value: controller()
                                  //                         .isAddInterestChecked,
                                  //                     onChanged: (val) {
                                  //                       controller()
                                  //                           .toggleAddInterest(
                                  //                               val);
                                  //                     },
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // if (controller()
                                  //     .addOnViewData
                                  //     .isNotEmpty) SizedBox(
                                  //   height: h * 0.03,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(h * 0.018),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                              text: AppText.sub_total,
                                              style: juraTextStyle(
                                                fontSize: h * 0.028,
                                                // color: AppColors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                CommonText(
                                                  text: AppText.rs,
                                                  style: juraTextStyle(
                                                    fontSize: h * 0.026,
                                                    // color: AppColors.white,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                CommonText(
                                                  text:
                                                  (((int.parse((planData?["price"]??"00").toString()) + (controller().isAddViewChecked ? controller().addOnViewData["price"] : 0) + (controller().isAddInterestChecked ? controller().addOnInterestData["price"] : 0) + (controller().isAddSlotChecked ? controller().addOnSlotData["price"] : 0)) ?? 0)).toStringAsFixed(2),

                                                  style: juraTextStyle(
                                                    fontSize: h * 0.026,
                                                    // color: AppColors.white,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        CommonText(
                                          text: AppText.tax,
                                          style: juraTextStyle(
                                            fontSize: h * 0.016,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                              text: AppText.amount,
                                              style: juraTextStyle(
                                                fontSize: h * 0.026,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppImg.rupee,
                                                  height: h * 0.04,
                                                  width: w * 0.05,
                                                ),
                                                CommonText(
                                                  text:
                                                      (((int.parse((planData?["price"]??"00").toString()) + (controller().isAddViewChecked ? controller().addOnViewData["price"] : 0) + (controller().isAddInterestChecked ? controller().addOnInterestData["price"] : 0) + (controller().isAddSlotChecked ? controller().addOnSlotData["price"] : 0)) ?? 0)).toStringAsFixed(2),
                                                  style: juraTextStyle(
                                                    fontSize: h * 0.026,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.024),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 15,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(h * 0.018),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: h * 0.015,
                                            ),
                                            CommonText(
                                                text: AppText.billing,
                                                style: juraTextStyle(
                                                  fontSize: h * 0.034,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            TextInputField(
                                              hintText: AppText.name,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              errorText: controller()
                                                          .isSubmit ==
                                                      true
                                                  ? validate(
                                                      controller().name.text)
                                                  : null,
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller().name,
                                              keyboardType: TextInputType.text,
                                              containerwidth: double.infinity,
                                              containercolor: AppColors.white,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              maxLines: 1,
                                              // borderColor: AppColors.gray,

                                              underline: true,
                                            ),
                                            // TextInputField(
                                            //   hintText: AppText.address,
                                            //   hintStyle: juraTextStyle(
                                            //       color: AppColors.gray,
                                            //       fontSize: h * 0.024,
                                            //       fontWeight: FontWeight.w400),
                                            //   textstyle: juraTextStyle(
                                            //       color: AppColors.black,
                                            //       fontSize: h * 0.024,
                                            //       fontWeight: FontWeight.w400),
                                            //
                                            //   titletextstyle: juraTextStyle(
                                            //       color: AppColors.grey,
                                            //       fontSize: h * 0.024,
                                            //       fontWeight: FontWeight.w400),
                                            //   errorText: controller()
                                            //               .isSubmit ==
                                            //           true
                                            //       ? validate(
                                            //           controller().address.text)
                                            //       : null,
                                            //   errorStyle: juraTextStyle(
                                            //       color: AppColors.red,
                                            //       fontSize: h * 0.024,
                                            //       fontWeight: FontWeight.w400),
                                            //   controller: controller().address,
                                            //   keyboardType: TextInputType.text,
                                            //   containerwidth: double.infinity,
                                            //   containercolor: AppColors.white,
                                            //   textCapitalization:
                                            //       TextCapitalization.none,
                                            //   obscureText: false,
                                            //   maxLines: 1,
                                            //   // borderColor: AppColors.gray,
                                            //
                                            //   underline: true,
                                            // ),
                                            TextInputField(
                                              hintText: AppText.contactnumber,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),

                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              errorText: controller()
                                                          .isSubmit ==
                                                      true
                                                  ? validatePhone(
                                                      controller().contact.text)
                                                  : null,
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller().contact,
                                              keyboardType:
                                                  TextInputType.number,
                                              containerwidth: double.infinity,
                                              containercolor: AppColors.white,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              maxLines: 1,
                                              // borderColor: AppColors.gray,

                                              underline: true,
                                            ),
                                            TextInputField(
                                              hintText: AppText.emailid,
                                              hintStyle: juraTextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              textstyle: juraTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),

                                              titletextstyle: juraTextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              errorText: controller()
                                                          .isSubmit ==
                                                      true
                                                  ? validateEmail(
                                                      controller().email.text)
                                                  : null,
                                              errorStyle: juraTextStyle(
                                                  color: AppColors.red,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller().email,
                                              keyboardType: TextInputType.text,
                                              containerwidth: double.infinity,
                                              containercolor: AppColors.white,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              maxLines: 1,
                                              // borderColor: AppColors.gray,

                                              underline: true,
                                            ),
                                            // SizedBox(
                                            //   height: h * 0.01,
                                            // ),
                                            // CommonText(
                                            //     text: AppText.method,
                                            //     style: juraTextStyle(
                                            //       fontSize: h * 0.024,
                                            //       fontWeight: FontWeight.w700,
                                            //     )),
                                            // ListTile(
                                            //   onTap: () {
                                            //     controller().onPaymentval(1);
                                            //   },
                                            //   title: CommonText(
                                            //     text: AppText.debit,
                                            //     style: juraTextStyle(
                                            //         fontSize: h * 0.022,
                                            //         color: AppColors.gray,
                                            //         fontWeight:
                                            //             FontWeight.w600),
                                            //   ),
                                            //   leading: CustomRadio(
                                            //     size: h * 0.03,
                                            //     value: 1,
                                            //     groupValue:
                                            //         controller().selectedmethod,
                                            //     onChanged: (value) {
                                            //       controller()
                                            //           .onPaymentval(value!);
                                            //     },
                                            //   ),
                                            // ),
                                            // ListTile(
                                            //   onTap: () {
                                            //     controller().onPaymentval(2);
                                            //   },
                                            //   title: CommonText(
                                            //     text: AppText.credit,
                                            //     style: juraTextStyle(
                                            //         fontSize: h * 0.024,
                                            //         color: AppColors.gray,
                                            //         fontWeight:
                                            //             FontWeight.w600),
                                            //   ),
                                            //   leading: CustomRadio(
                                            //     size: h * 0.03,
                                            //     value: 2,
                                            //     groupValue:
                                            //         controller().selectedmethod,
                                            //     onChanged: (value) {
                                            //       controller()
                                            //           .onPaymentval(value!);
                                            //     },
                                            //   ),
                                            // ),
                                            // ListTile(
                                            //   onTap: () {
                                            //     controller().onPaymentval(3);
                                            //   },
                                            //   title: CommonText(
                                            //     text: AppText.upi,
                                            //     style: juraTextStyle(
                                            //         fontSize: h * 0.024,
                                            //         color: AppColors.gray,
                                            //         fontWeight:
                                            //             FontWeight.w600),
                                            //   ),
                                            //   leading: CustomRadio(
                                            //     size: h * 0.03,
                                            //     value: 3,
                                            //     groupValue:
                                            //         controller().selectedmethod,
                                            //     onChanged: (value) {
                                            //       controller()
                                            //           .onPaymentval(value!);
                                            //     },
                                            //   ),
                                            //   //trailing: controller().selectedmethod == 3 ? Image.asset(AppImg.ring) : null,
                                            // ),
                                            // if (controller().isSubmit == true &&
                                            //     controller().selectedmethod ==
                                            //         0)
                                            //   CommonText(
                                            //       text: "required",
                                            //       style: juraTextStyle(
                                            //           color: AppColors.red,
                                            //           fontSize: h * 0.024,
                                            //           fontWeight:
                                            //               FontWeight.w400)),
                                            SizedBox(
                                              height: h * 0.05,
                                            ),
                                            Stack(
                                              children: [
                                                Positioned(
                                                  bottom: -h * 0.02,
                                                  left: w * 0.0,
                                                  child: Opacity(
                                                    opacity: 0.16,
                                                    child: Image.asset(
                                                      AppImg.ring,
                                                      height: h * 0.2,
                                                      width: w * 0.6,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: h * 0.2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        CommonButton(
                                                          containerwidth:
                                                              w * 0.4,
                                                          containerheight:
                                                              h * 0.06,
                                                          // backgroundColor:
                                                          //     AppColors.transparent,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(h *
                                                                        0.010),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(h *
                                                                        0.010),
                                                            gradient:
                                                                commonGradient(),
                                                          ),
                                                          text: AppText.pay,
                                                          textStyle:
                                                              juraTextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: h * 0.028,
                                                          ),
                                                          onPressed: () {
                                                            if (planData?[
                                                                        "_id"] !=
                                                                    null &&
                                                                planData?[
                                                                        "price"] !=
                                                                    null) {
                                                              controller().onMakePaymentTap(
                                                                  context:
                                                                      context,
                                                                  amount:
                                                                  (((int.parse((planData?["price"]??"00").toString()) + (controller().isAddViewChecked ? controller().addOnViewData["price"] : 0) + (controller().isAddInterestChecked ? controller().addOnInterestData["price"] : 0) + (controller().isAddSlotChecked ? controller().addOnSlotData["price"] : 0)) ?? 0)).toInt() ,
                                                                  subscriptionId:
                                                                      planData?[
                                                                          "_id"]);
                                                            }
                                                            // commonNavigator(
                                                            //     context:
                                                            //         context,
                                                            //     child:
                                                            //         RazorpayScreen(),
                                                            //     type:
                                                            //         PageTransitionType
                                                            //             .fade);
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.015,
                                                        ),
                                                        CommonButton(
                                                          containerwidth:
                                                              w * 0.4,
                                                          containerheight:
                                                              h * 0.06,
                                                          // backgroundColor: AppColors.transparent,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(h *
                                                                        0.010),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(h *
                                                                        0.010),
                                                            color:
                                                                AppColors.black,
                                                            gradient:
                                                                commonGradient(),
                                                          ),

                                                          text: AppText.cancel,
                                                          textStyle:
                                                              juraTextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: h * 0.028,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            // commonNavigator(
                                                            //     context:
                                                            //         context,
                                                            //     child:
                                                            //         BrDetailScreen(),
                                                            //     type:
                                                            //         PageTransitionType
                                                            //             .fade);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller().isLoading) {
              return CheckoutScreenShimmer();
            }
          }),
    );
  }
}
