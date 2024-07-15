import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/send_interest_page/send_interest_screen_controller.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../bride/b_fullDetails/bride_Full_Details.dart';
import '../error/error_screen.dart';
import '../shimmers/send_interest_screen_shimmer.dart';

class SendInterestScreen extends ConsumerWidget {
  const SendInterestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(sendInterestScreenControllerProvider);
    controller() => ref.read(sendInterestScreenControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: asyncState.when(
          data: (data) => Center(
                child: controller().isLoading
                    ? SendInterestScreenShimmer()
                    : Stack(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: h * 0.16, left: w * 0.05),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ImageIcon(
                                        AssetImage(AppImg.send),
                                        color: AppColors.gradient2,
                                        size: h * 0.055,
                                      ),
                                      SizedBox(width: w * 0.01),
                                      CommonText(
                                        text: AppText.sendint,
                                        style: juraTextStyle(
                                          fontSize: h * 0.030,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                controller().inboxDataList.isNotEmpty
                                    ? CommonListView(
                                        itemCount:
                                            controller().inboxDataList.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: false,
                                        padding: EdgeInsets.all(w * 0.05),
                                        width: w,
                                        height: h * 0.78,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () {
                                                print(
                                                    "aseeoijfihr :: ${controller().inboxDataList[index]["profile"]["accountId"]["_id"]}");
                                                commonNavigator(
                                                    context: context,
                                                    child: BrideDetails(
                                                      accountId: controller()
                                                                  .inboxDataList[
                                                              index]["profile"]
                                                          ["accountId"]["_id"],
                                                    ),
                                                    type: PageTransitionType
                                                        .fade);
                                              },
                                              child: Container(
                                                color: AppColors.transparent,
                                                height: h * 0.14,
                                                width: w,
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: h * 0.06,
                                                        width: w * 0.85,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    w * 0.20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    w * 0.20),
                                                          ),
                                                          color: AppColors
                                                              .backgroundField,
                                                          border: Border.all(
                                                            color:
                                                                AppColors.white,
                                                            width: w * 0.01,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: AppColors
                                                                  .gray
                                                                  .withOpacity(
                                                                      0.07),
                                                              spreadRadius: 5,
                                                              blurRadius: 2,
                                                              offset:
                                                                  Offset(0, 5),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SizedBox(
                                                              width: w * 0.23,
                                                            ),
                                                            if (controller().inboxDataList[index]
                                                                            [
                                                                            "receiverId"]
                                                                        [
                                                                        "name"] !=
                                                                    null &&
                                                                controller().inboxDataList[index]
                                                                            [
                                                                            "receiverId"]
                                                                        [
                                                                        "name"] !=
                                                                    "")
                                                              Container(
                                                                width: w * 0.35,
                                                                // color: Colors.red,
                                                                child:
                                                                    CommonText(
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  text:
                                                                      "${controller().inboxDataList[index]["receiverId"]["name"]}",
                                                                  //AppText.b_name
                                                                  style:
                                                                      juraTextStyle(
                                                                    fontSize:
                                                                        h * 0.02,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            // SizedBox(
                                                            //     width:
                                                            //         w * 0.02),
                                                            if (controller().inboxDataList[index]
                                                                            [
                                                                            "receiverId"]
                                                                        [
                                                                        "acc_Id"] !=
                                                                    null &&
                                                                controller()
                                                                        .inboxDataList[
                                                                            index]
                                                                            [
                                                                            "receiverId"]
                                                                            [
                                                                            "acc_Id"]
                                                                        .toString() !=
                                                                    "")
                                                              Container(
                                                                // color: Colors.red,
                                                                width: w * 0.25,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    CommonText(
                                                                  text:
                                                                      "ID :- ${controller().inboxDataList[index]["receiverId"]["acc_Id"]}",
                                                                  style:
                                                                      juraTextStyle(
                                                                    fontSize: h *
                                                                        0.016,
                                                                    color: AppColors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: h * 0.015,
                                                      left: w * 0.015,
                                                      child: Container(
                                                        height: h * 0.11,
                                                        width: w * 0.229,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      w * 0.14),
                                                          border: Border.all(
                                                            color:
                                                                AppColors.white,
                                                            width: w * 0.01,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: AppColors
                                                                  .gray
                                                                  .withOpacity(
                                                                      0.07),
                                                              spreadRadius: 5,
                                                              blurRadius: 2,
                                                              offset:
                                                                  Offset(0, 5),
                                                            ),
                                                          ],
                                                        ),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(w *
                                                                        0.14),
                                                            child:
                                                                CachedNetworkImage(
                                                              cacheKey:
                                                                  "${(controller().inboxDataList[index]["profile"]["profileImage"]["imageName"] != "") ? (controller().inboxDataList[index]["profile"]["profileImage"]["imageName"]) : null ?? "sentInterest${index}"}",
                                                              imageUrl:
                                                                  "${controller().inboxDataList[index]["profile"]["profileImage"]["path"]}",
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
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        },
                                      )
                                    : Container(
                                        height: h * 0.6,
                                        child: Center(
                                          child: noDataCommonText(
                                            style: juraTextStyle(
                                                fontSize: h * 0.032,
                                                color: AppColors.gray,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: h * 0.01,
                            left: w * 0.29,
                            child: Image.asset(
                              AppImg.ringbg,
                              height: h * 0.2,
                              width: w * 0.95,
                            ),
                          ),
                          Positioned(
                            top: h * 0.06,
                            left: w * 0.42,
                            child: Image.asset(
                              AppImg.ringbg,
                              height: h * 0.12,
                              width: w * 0.6,
                            ),
                          ),
                          Positioned(
                            top: h * 0.06,
                            left: w * 0.85,
                            child: CommonIconButton(
                                containerwidth: w * 0.1,
                                containerheight: h * 0.05,
                                backgroundColor: AppColors.transparent,
                                shape: LinearBorder.none,
                                centericon: Icon(
                                  Icons.arrow_back_ios,
                                  size: w * 0.07,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
              ),
          error: (error, stackTrace) {
            return ErrorScreen(
                text: error.toString(),
                backgroundColor: AppColors.white,
                color: AppColors.red);
          },
          loading: () {
            if (controller().isLoading) {
              return SendInterestScreenShimmer();
            }
          }),
    );
  }
}
