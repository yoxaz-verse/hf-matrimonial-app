import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/utils/common_components/common_listview.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../shimmers/br_detail_shimmer.dart';
import 'br_detail_controller.dart';

class BrDetailScreen extends ConsumerStatefulWidget {
  const BrDetailScreen({super.key});

  @override
  ConsumerState createState() => _BrDetailScreenState();
}

class _BrDetailScreenState extends ConsumerState<BrDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(brDetailControllerProvider);
    controller() => ref.read(brDetailControllerProvider.notifier);

    return Scaffold(
      body: controller().isLoading
          ? BrDetailShimmer()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: h * 0.02, left: w * 0.03, right: w * 0.03),
                child: SafeArea(
                  child: Card(
                    color: AppColors.white,
                    shadowColor: AppColors.black,
                    surfaceTintColor: AppColors.white,
                    elevation: 10,
                    child: Stack(
                      children: [
                        Positioned(
                          top: h * 0,
                          right: 0,
                          child: Container(
                            height: h * 0.1,
                            width: w * 0.32,
                            child: Opacity(
                              opacity: 0.16,
                              child: Image.asset(
                                AppImg.rings,
                                fit: BoxFit.fill,
                                color: AppColors.white.withOpacity(0.02),
                                colorBlendMode: BlendMode.lighten,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: h * 0.02,
                          right: h * 0.015,
                          child: controller().isSearchOn
                              ? InkWell(
                                  onTap: () {
                                    controller().toggleSearch();
                                  },
                                  child: Container(
                                    height: h * 0.04,
                                    width: w * 0.12,
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Icon(Icons.close_sharp),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            color: AppColors.black
                                                .withOpacity(0.3))),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    ref
                                        .read(dialogServiceProvider)
                                        .searchPartner(controller: controller);
                                  },
                                  child: Container(
                                    height: h * 0.04,
                                    width: w * 0.12,
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Icon(Icons.search_sharp),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            color: AppColors.black
                                                .withOpacity(0.3))),
                                  ),
                                ),
                        ),
                        // Positioned(
                        //   top: h * 0.02,
                        //   left: h * 0.015,
                        //   child:
                        //   InkWell(
                        //           onTap: () {
                        //             ref
                        //                 .read(dialogServiceProvider)
                        //                 .searchPartner(controller: controller);
                        //           },
                        //           child: Container(
                        //             height: h * 0.04,
                        //             width: w * 0.3,
                        //             alignment: Alignment.center,
                        //             child: Opacity(
                        //               opacity: 0.6,
                        //               child: CommonText(text: "Views left : 0", style: juraTextStyle()),
                        //             ),
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 border: Border.all(
                        //                     color: AppColors.black
                        //                         .withOpacity(0.0))),
                        //           ),
                        //         ),
                        // ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: h * 0.07,
                                  left: w * 0.02,
                                  right: w * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  controller().isNewMatchesOn
                                      ? InkWell(
                                          onTap: () {
                                            controller().toggleNewMatches();
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: h * 0.03,
                                                width: w * 0.07,
                                                child: Opacity(
                                                  opacity: 0.6,
                                                  child: Icon(
                                                    Icons.close_sharp,
                                                    color: AppColors.amber,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    border: Border.all(
                                                        color: AppColors.amber
                                                            .withOpacity(0.3))),
                                              ),
                                              Container(
                                                child: CommonText(
                                                  text: AppText.newmatches,
                                                  style: juraTextStyle(
                                                      color: AppColors.amber
                                                          .withOpacity(1),
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            controller().toggleNewMatches();
                                          },
                                          child: Container(
                                            child: CommonText(
                                              text: AppText.newmatches,
                                              style: juraTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                  controller().isMatchingMembersOn
                                      ? InkWell(
                                          onTap: () {
                                            controller()
                                                .toggleMatchingMembers();
                                          },
                                          child: Row(
                                            children: [
                                              // Container(
                                              //   height: h * 0.03,
                                              //   width: w * 0.07,
                                              //   child: Opacity(
                                              //     opacity: 0.6,
                                              //     child: Icon(
                                              //       Icons.close_sharp,
                                              //       color: AppColors.amber,
                                              //     ),
                                              //   ),
                                              //   decoration: BoxDecoration(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               3),
                                              //       border: Border.all(
                                              //           color: AppColors.amber
                                              //               .withOpacity(0.3))),
                                              // ),
                                              Container(
                                                  child: CommonText(
                                                text: AppText.matchingmembers,
                                                style: juraTextStyle(
                                                    color: AppColors.amber
                                                        .withOpacity(0.8),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            controller()
                                                .toggleMatchingMembers();
                                          },
                                          child: Container(
                                            child: CommonText(
                                              text: AppText.matchingmembers,
                                              style: juraTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            controller().userCardsList.length == 0 ||
                                    controller().userCardsList == []
                                ? Container(
                                    height: h * 0.7,
                                    child: Center(
                                      child: noDataCommonText(
                                          data: "No Acounts Found",
                                          style: juraTextStyle(
                                              fontSize: h * 0.025,
                                              overflow: TextOverflow.ellipsis,
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: <Color>[
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        105, 0, 280, 10)),
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  )
                                : CommonListView(
                                    itemCount:
                                        controller().userCardsList.length + 1,
                                    scrollDirection: Axis.vertical,
                                    controller: controller().scrollController,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(top: h * 0.02),
                                    width: w,
                                    // height: h * 0.4,
                                    height: h * 0.733,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          controller().userCardsList.length)
                                        return SizedBox(
                                            height: controller().pageEnd == true
                                                ? 0
                                                : h * 0.1,
                                            child: controller()
                                                        .isNewDataLoading ==
                                                    true
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: AppColors
                                                                .gradient1))
                                                : Container());
                                      return Center(
                                        child: InkWell(
                                          onTap: () {
                                            controller().onCardTap(
                                                context: context, index: index);
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                h * 0.015),
                                            child: Container(
                                              height: h * 0.37,
                                              width: w * 0.7,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        h * 0.015),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.black
                                                        .withOpacity(0.09),
                                                    spreadRadius: 3,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 5),
                                                  ),
                                                ],
                                              ),
                                              margin: EdgeInsets.only(
                                                  bottom: h * 0.02),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: h * 0.37,
                                                    width: w * 0.7,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              h * 0.015),
                                                      child: ((controller()
                                                                              .userCardsList[
                                                                          index]
                                                                      [
                                                                      "profileImage"] !=
                                                                  '') &&
                                                              (controller()
                                                                      .userCardsList[
                                                                          index]
                                                                          [
                                                                          "profileImage"]
                                                                      ?.startsWith(
                                                                          "http") ==
                                                                  true))
                                                          ? CachedNetworkImage(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              cacheKey: controller()
                                                                              .userCardsList[
                                                                          index]
                                                                      [
                                                                      "profileImageName"] ??
                                                                  "homePage${index}${controller().isMatchingMembersOn}${controller().isNewMatchesOn}${controller().isSearchOn}",
                                                              imageUrl:
                                                                  "${controller().userCardsList[index]["profileImage"] ?? ""}",
                                                              fit: BoxFit.cover,
                                                              errorWidget:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return Icon(
                                                                  Icons
                                                                      .broken_image_rounded,
                                                                  color: AppColors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.4),
                                                                  size: w * 0.1,
                                                                );
                                                              },
                                                              placeholder:
                                                                  (context,
                                                                      url) {
                                                                return Shimmer
                                                                    .fromColors(
                                                                        baseColor:
                                                                            AppColors
                                                                                .shimmerGrey,
                                                                        highlightColor:
                                                                            AppColors
                                                                                .white,
                                                                        enabled:
                                                                            true,
                                                                        child:
                                                                            Container(
                                                                          color:
                                                                              AppColors.grey,
                                                                        ));
                                                              },
                                                            )
                                                          : Image.asset(
                                                              AppImg.profilePic,
                                                              fit: BoxFit.cover,
                                                              height: h * 0.37,
                                                              width: w),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: h * 0.055,
                                                            width: w * 0.42,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(h *
                                                                        0.015),
                                                              ),
                                                              color: AppColors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: w *
                                                                          0.04,
                                                                      top: h *
                                                                          0.015),
                                                              child: CommonText(
                                                                text: controller()
                                                                    .userCardsList[
                                                                        index][
                                                                        "accountCustomId"]
                                                                    .toString(),
                                                                style: juraTextStyle(
                                                                    fontSize: h *
                                                                        0.022,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (controller().userCardsList[
                                                                    index][
                                                                "subscriptionPlan"] !=
                                                            null)
                                                          Container(
                                                            height: h * 0.055,
                                                            width: w * 0.28,
                                                            decoration:
                                                                BoxDecoration(
                                                              // color: AppColors.amber,
                                                              gradient: commonGradientForPlan(
                                                                  name: controller()
                                                                              .userCardsList[index]
                                                                          ?[
                                                                          "subscriptionPlan"] ??
                                                                      "No plan"),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(h *
                                                                        0.015),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      h * 0.055,
                                                                  width:
                                                                      w * 0.26,
                                                                  // color: AppColors.red,
                                                                  alignment:
                                                                      AlignmentDirectional
                                                                          .center,
                                                                  child:
                                                                      CommonText(
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    text: (controller().userCardsList[index]["subscriptionPlan"] !=
                                                                                ""
                                                                            ? controller().userCardsList[index][
                                                                                "subscriptionPlan"]
                                                                            : null ??
                                                                                "No plan")
                                                                        .toString(),
                                                                    style:
                                                                        juraTextStyle(
                                                                      fontSize: h *
                                                                          0.017,
                                                                      color: AppColors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                                // CommonText(
                                                                //   text: AppText.package,
                                                                //   style: juraTextStyle(
                                                                //     fontSize: h * 0.017,
                                                                //     color:
                                                                //         AppColors.white,
                                                                //     fontWeight:
                                                                //         FontWeight.w500,
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: h * 0,
                                                    child: Container(
                                                      width: w * 0.7,
                                                      height: h * 0.08,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  h * 0.015),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  h * 0.015),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        w * 0.05),
                                                            child: CommonText(
                                                              text:
                                                                  "Age: ${controller().userCardsList[index]["age"]}${controller().userCardsList[index]["education"] != null ? ", " + controller().userCardsList[index]["education"] : ""}",
                                                              style: juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.024,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: AppColors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        w * 0.05),
                                                            child: CommonText(
                                                              text: controller()
                                                                  .userCardsList[
                                                                      index][
                                                                      "Address"]
                                                                  .toString(),
                                                              style: juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.022,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.8,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      // bottomNavigationBar: const AfterBottomBar(),
    );
  }
}
