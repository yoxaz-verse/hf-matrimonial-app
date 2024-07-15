import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bride/bride.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../error/error_screen.dart';
import '../../shimmers/bride_full_details_shimmer.dart';
import '../b_contact/bride_contact_detail.dart';
import '../b_family/bride_family_detail.dart';
import '../b_reglion/bride_reglion_screenDetail.dart';
import 'bride_Full_Details_controller.dart';

class BrideDetails extends ConsumerWidget {
  final String accountId;
  BrideDetails({Key? key, required this.accountId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState =
        ref.watch(brideFullDetailsControllerProvider(accountId: accountId));
    controller() => ref.read(
        brideFullDetailsControllerProvider(accountId: accountId).notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    CarouselController _controller = CarouselController();

    return Scaffold(
      body: asyncState.when(
          data: (data) => SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: h * 0.025,
                      right: h * 0.025,
                      top: h * 0.04,
                      bottom: h * 0.04),
                  child: Stack(
                    children: [
                      Card(
                        surfaceTintColor: AppColors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(h * 0.025),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: -w * 0.055,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Image.asset(
                                      AppImg.Leaf,
                                      height: h * 0.28,
                                      width: w * 0.8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(h * 0.025),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(h * 0.028),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Container(
                                          width: w,
                                          child: Container(
                                            width: w,
                                            child: Stack(
                                              children: [
                                                // Leaf image
                                                Positioned(
                                                  top: -h * 0.01,
                                                  left: -w * 0.03,
                                                  child: Image.asset(
                                                    AppImg.leaf,
                                                    height: h * 0.400,
                                                    width: w * 0.580,
                                                  ),
                                                ),
                                                // Content
                                                Center(
                                                  child: Container(
                                                    width: w,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      w * 0.03),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                icon: Icon(Icons
                                                                    .arrow_back_ios),
                                                                color: AppColors
                                                                    .black,
                                                              )),
                                                        ),
                                                        Container(
                                                          height: h * 0.3,
                                                          child: Stack(
                                                            children: [
                                                              Card(
                                                                elevation: 5,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(h *
                                                                              0.03),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      h * 0.28,
                                                                  width:
                                                                      w * 0.530,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: AppColors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(h *
                                                                            0.03),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: w *
                                                                            0.025),
                                                                    child:
                                                                        CommonCarousel(
                                                                      enlargeFactor:
                                                                          1,
                                                                      ispageIndicatorInside:
                                                                          false,
                                                                      containerheight:
                                                                          h * 0.333,
                                                                      containerwidth:
                                                                          w,
                                                                      viewportFraction:
                                                                          1,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      autoPlayCurve:
                                                                          Curves
                                                                              .easeInOut,
                                                                      aspectRatio:
                                                                          16 /
                                                                              9,
                                                                      itemBuilder: (BuildContext
                                                                              context,
                                                                          int index,
                                                                          int realIndex) {
                                                                        //
                                                                        return Container(
                                                                          height:
                                                                              h * 0.25,
                                                                          width:
                                                                              w * 0.45,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Container(
                                                                                height: h * 0.25,
                                                                                width: w * 0.45,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(h * 0.02),
                                                                                  child: ((controller().image.isNotEmpty && controller().image[index].isNotEmpty) && (controller().image[index]?.startsWith("http") == true)) && controller().image.length != 0
                                                                                      ? CachedNetworkImage(
                                                                                          alignment: Alignment.center,
                                                                                          cacheKey: "${(controller().imageName[index] != "") ? controller().imageName[index] : null ?? "userImage"}",
                                                                                          imageUrl: "${controller().image[index] ?? ""}",
                                                                                          fit: BoxFit.cover,
                                                                                          errorWidget: (context, error, stackTrace) {
                                                                                            return Icon(
                                                                                              Icons.broken_image_rounded,
                                                                                              color: AppColors.black.withOpacity(0.4),
                                                                                              size: w * 0.1,
                                                                                            );
                                                                                          },
                                                                                          placeholder: (context, url) {
                                                                                            return Shimmer.fromColors(
                                                                                                baseColor: AppColors.shimmerGrey,
                                                                                                highlightColor: AppColors.white,
                                                                                                enabled: true,
                                                                                                child: Container(
                                                                                                  color: AppColors.grey,
                                                                                                ));
                                                                                          },
                                                                                        )
                                                                                      : Image.asset(AppImg.profilePic, fit: BoxFit.cover, height: h * 0.37, width: w),
                                                                                ),
                                                                              ),
                                                                              // Positioned(
                                                                              //   top: h * 0.02,
                                                                              //   left: w * 0.02,
                                                                              //   child: Row(
                                                                              //     children: [
                                                                              //       Container(
                                                                              //         decoration: BoxDecoration(
                                                                              //           shape: BoxShape.circle,
                                                                              //           border: Border.all(
                                                                              //             color: AppColors.white,
                                                                              //             // Define the border color
                                                                              //             width: h * 0.001,
                                                                              //           ),
                                                                              //         ),
                                                                              //         child: Icon(
                                                                              //           Icons.circle,
                                                                              //           color: AppColors.green,
                                                                              //           size: h * 0.01,
                                                                              //         ),
                                                                              //       ),
                                                                              //       SizedBox(width: w * 0.01),
                                                                              //       CommonText(
                                                                              //         text: AppText.online,
                                                                              //         style: juraTextStyle(
                                                                              //           color: AppColors.white,
                                                                              //           fontWeight: FontWeight.w700,
                                                                              //           fontSize: h * 0.012,
                                                                              //         ),
                                                                              //       ),
                                                                              //     ],
                                                                              //   ),
                                                                              // ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                      enableInfiniteScroll:
                                                                          false,
                                                                      autoPlay:
                                                                          false,
                                                                      reverse:
                                                                          false,
                                                                      itemCount: controller().image.length !=
                                                                              0
                                                                          ? controller()
                                                                              .image
                                                                              .length
                                                                          : 1,
                                                                      carouselHeight:
                                                                          h * 0.26,
                                                                      dotindicator:
                                                                          true,
                                                                      carouselController:
                                                                          _controller,
                                                                      disableGesture:
                                                                          true,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0),
                                                                      gradient:
                                                                          true,
                                                                      getcurrentPageIndex:
                                                                          controller()
                                                                              .getcurrentPageIndex,
                                                                      onPageChanged:
                                                                          (index,
                                                                              reason) {
                                                                        controller()
                                                                            .onPageChanged(index);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: w * 0.19,
                                                                top: h * 0.27,
                                                                child: Card(
                                                                  elevation: 5,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height: h *
                                                                        0.022,
                                                                    width: w *
                                                                        0.17,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              32),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        // Text and Button
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CommonText(
                                                              text: controller()
                                                                  .brideName,
                                                              style:
                                                                  juraTextStyle(
                                                                fontSize:
                                                                    h * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                            if (controller().brideDetails?[
                                                                        "age"] !=
                                                                    null ||
                                                                controller().brideDetails?[
                                                                        "occupationDetail"] !=
                                                                    null)
                                                              CommonText(
                                                                text:
                                                                    "${controller().brideDetails?["age"] != null ? "Age: ${controller().brideDetails?["age"]}, " : ""}${controller().brideDetails?["occupationDetail"] != null ? "${controller().brideDetails?["occupationDetail"]}" : ""}",
                                                                style: juraTextStyle(
                                                                    fontSize: h *
                                                                        0.019),
                                                              ),
                                                            if (controller().brideDetails?["Address"] != null ||
                                                                controller().brideDetails?[
                                                                        "Distict"] !=
                                                                    null ||
                                                                controller().brideDetails?[
                                                                        "State"] !=
                                                                    null ||
                                                                controller().brideDetails?[
                                                                        "Country"] !=
                                                                    null)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .symmetric(horizontal:w *
                                                                            0.05),
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      w * 0.7,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      CommonText(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text:
                                                                        "${controller().brideDetails?["Address"]["Address"] != null ? "${controller().brideDetails?["Address"]["Address"]} " : ""}${controller().brideDetails?["Address"]["Distict"] != null ? "${controller().brideDetails?["Address"]["Distict"]} " : ""}${controller().brideDetails?["Address"]["State"] != null ? "${controller().brideDetails?["Address"]["State"]} " : ""}${controller().brideDetails?["Address"]["Country"] != null ? "${controller().brideDetails?["Address"]["Country"]}" : ""}",
                                                                    style: juraTextStyle(
                                                                        fontSize:
                                                                            h * 0.019),
                                                                  ),
                                                                ),
                                                              ),
                                                            SizedBox(
                                                                height:
                                                                    h * 0.01),
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
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                gradient:
                                                                    commonGradient(),
                                                              ),
                                                              text: AppText
                                                                  .sendint,
                                                              textStyle:
                                                                  TextStyle(
                                                                color: AppColors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    h * 0.018,
                                                              ),
                                                              onPressed: () {
                                                                controller()
                                                                    .onInterestTapped(
                                                                        context:
                                                                            context);
                                                              },
                                                            ),
                                                            CommonText(
                                                                text:
                                                                    "Interest left : ${controller().interest}",
                                                                style:
                                                                    juraTextStyle())
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // child:  brideInfo(accountId: accountId),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(h * 0.01),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (controller()
                                                              .brideDetails?[
                                                          "about"] !=
                                                      null)
                                                    CommonText(
                                                      text: AppText.about,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.024,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  if (controller()
                                                              .brideDetails?[
                                                          "about"] !=
                                                      null)
                                                    SizedBox(height: h * 0.01),
                                                  if (controller()
                                                              .brideDetails?[
                                                          "about"] !=
                                                      null)
                                                    CommonText(
                                                      text: controller()
                                                              .brideDetails?[
                                                          "about"],
                                                      maxLines: 6,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.016,
                                                      ),
                                                    ),
                                                  if (controller()
                                                          .personalInfo
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.02),
                                                  if (controller()
                                                          .personalInfo
                                                          .length !=
                                                      0)
                                                    ListView.builder(
                                                      itemCount: controller()
                                                          .personalInfo
                                                          .length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      // width: w,
                                                      // height:  h * 0.05 * controller().personalInfo.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  h * 0.009),
                                                          child: DecoratedBox(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom:
                                                                    BorderSide(
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                  width:
                                                                      h * 0.001,
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
                                                                      .personalInfo[
                                                                          index]
                                                                      .keys
                                                                      .first,
                                                                  style: juraTextStyle(
                                                                      fontSize: h *
                                                                          0.018),
                                                                ),
                                                          Container(
                                                            width:
                                                            w * 0.3,
                                                            alignment:
                                                            Alignment
                                                                .centerRight,
                                                            child: CommonText(
                                                                  text: controller()
                                                                      .personalInfo[
                                                                          index]
                                                                      .values
                                                                      .first,overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      juraTextStyle(
                                                                    fontSize: h *
                                                                        0.018,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: AppColors
                                                                        .black,
                                                                  ),
                                                                ),),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (controller()
                                                          .religiousInfo
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.03),
                                                  if (controller()
                                                          .religiousInfo
                                                          .length !=
                                                      0)
                                                    CommonText(
                                                      text:
                                                          AppText.religious_inf,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.024,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  if (controller()
                                                          .religiousInfo
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.02),
                                                  if (controller()
                                                          .religiousInfo
                                                          .length !=
                                                      0)
                                                    ListView.builder(
                                                      itemCount: controller()
                                                          .religiousInfo
                                                          .length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      // width: w,
                                                      // height: h * 0.065 * controller().religiousInfo.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  h * 0.009),
                                                          child: DecoratedBox(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom:
                                                                    BorderSide(
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                  width:
                                                                      h * 0.001,
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
                                                                      .religiousInfo[
                                                                          index]
                                                                      .keys
                                                                      .first,
                                                                  style: juraTextStyle(
                                                                      fontSize: h *
                                                                          0.02),
                                                                ),
                                                          Container(
                                                            width:
                                                            w * 0.3,
                                                            alignment:
                                                            Alignment
                                                                .centerRight,
                                                            child: CommonText(
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 2,
                                                                  text: controller()
                                                                      .religiousInfo[
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
                                                                ),),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (controller()
                                                          .eduAndCarrier
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.03),
                                                  if (controller()
                                                          .eduAndCarrier
                                                          .length !=
                                                      0)
                                                    CommonText(
                                                      text: AppText.edu,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.024,
                                                        // decoration: TextDecoration.underline,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  if (controller()
                                                          .eduAndCarrier
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.02),
                                                  if (controller()
                                                          .eduAndCarrier
                                                          .length !=
                                                      0)
                                                    ListView.builder(
                                                      itemCount: controller()
                                                          .eduAndCarrier
                                                          .length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      // width: w,
                                                      // height: h * 0.07 * controller().eduAndCarrier.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  h * 0.009),
                                                          child: DecoratedBox(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom:
                                                                    BorderSide(
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                  width:
                                                                      h * 0.001,
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
                                                                      .eduAndCarrier[
                                                                          index]
                                                                      .keys
                                                                      .first,
                                                                  style: juraTextStyle(
                                                                      fontSize: h *
                                                                          0.02),
                                                                ),
                                                                Container(
                                                                  width:
                                                                      w * 0.3,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child:
                                                                      CommonText(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    text: controller()
                                                                        .eduAndCarrier[
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (controller()
                                                          .familyDetails
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.03),
                                                  if (controller()
                                                          .familyDetails
                                                          .length !=
                                                      0)
                                                    CommonText(
                                                      text: AppText.b_family,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.024,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  if (controller()
                                                          .familyDetails
                                                          .length !=
                                                      0)
                                                    SizedBox(height: h * 0.02),
                                                  if (controller()
                                                          .familyDetails
                                                          .length !=
                                                      0)
                                                    ListView.builder(
                                                      itemCount: controller()
                                                          .familyDetails
                                                          .length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
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
                                                                  width:
                                                                      h * 0.001,
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
                                                                      .familyDetails[
                                                                          index]
                                                                      .keys
                                                                      .first,
                                                                  style: juraTextStyle(
                                                                      fontSize: h *
                                                                          0.02),
                                                                ),
                                                          Container(
                                                            width:
                                                            w * 0.3,
                                                            alignment:
                                                            Alignment
                                                                .centerRight,
                                                            child:CommonText(
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 2,
                                                                  text: controller()
                                                                      .familyDetails[
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
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (controller()
                                                              .contactDetails
                                                              .length !=
                                                          0 &&
                                                      controller().showContact)
                                                    SizedBox(height: h * 0.03),
                                                  if (controller()
                                                              .contactDetails
                                                              .length !=
                                                          0 &&
                                                      controller().showContact)
                                                    CommonText(
                                                      text: AppText.contact,
                                                      style: juraTextStyle(
                                                        fontSize: h * 0.024,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  if (controller()
                                                              .contactDetails
                                                              .length !=
                                                          0 &&
                                                      controller().showContact)
                                                    SizedBox(height: h * 0.02),
                                                  if (controller()
                                                              .contactDetails
                                                              .length !=
                                                          0 &&
                                                      controller().showContact)
                                                    ListView.builder(
                                                      itemCount: controller()
                                                          .contactDetails
                                                          .length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      // width: w,
                                                      // height: h * 0.2,
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
                                                                  width:
                                                                      h * 0.001,
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
                                                                      .contactDetails[
                                                                          index]
                                                                      .keys
                                                                      .first,
                                                                  style: juraTextStyle(
                                                                      fontSize: h *
                                                                          0.02),
                                                                ),
                                                                Container(
                                                                  width:
                                                                      w * 0.3,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child:
                                                                      CommonText(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    text: controller()
                                                                        .contactDetails[
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller().isLoading) {
              return BrideFullDetailsShimmer();
            }
          }),
    );
  }
}
