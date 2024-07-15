import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/common_components/common_listview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_iconbutton.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../bride/b_fullDetails/bride_Full_Details.dart';
import '../error/error_screen.dart';
import '../shimmers/index_page_shimmer.dart';
import 'inbox_page_controller.dart';

class InboxPage extends ConsumerWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(inboxPageControllerProvider);
    controller() => ref.read(inboxPageControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;

    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: asyncState.when(
          data: (data) => SafeArea(
                child: controller().isLoading
                    ? IndexPageShimmer()
                    : Stack(
                        children: [
                          Positioned(
                            top: h * 0.06,
                            left: w * 0.42,
                            child: Image.asset(
                              AppImg.ringbg,
                              height: h * 0.12,
                              width: w * 0.6,
                            ),
                          ),
                          Container(
                              child: Column(
                            children: [
                              SizedBox(height: h * 0.1),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.028,
                                    left: w * 0.05,
                                    bottom: h * 0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ImageIcon(
                                      AssetImage(AppImg.mail1),
                                      color: AppColors.gradient2,
                                      size: h * 0.055,
                                    ),
                                    SizedBox(width: w * 0.02),
                                    CommonText(
                                      text: AppText.inbox,
                                      style: juraTextStyle(
                                        fontSize: h * 0.036,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: h * 0.04),
                              controller().inboxDataList.isNotEmpty
                                  ? CommonListView(
                                      itemCount:
                                          controller().inboxDataList.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: false,
                                      padding: EdgeInsets.all(w * 0.03),
                                      width: w,
                                      height: h * 0.71,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              commonNavigator(
                                                  context: context,
                                                  child: BrideDetails(
                                                    accountId: controller()
                                                                    .inboxDataList[
                                                                index]?["profile"]
                                                            ?[
                                                            "accountId"]?["_id"] ??
                                                        "",
                                                  ),
                                                  type:
                                                      PageTransitionType.fade);
                                            },
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(w * 0.016),
                                              child: Container(
                                                  height: h * 0.15,
                                                  width: w * 0.9,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .backgroundField
                                                        .withOpacity(1),
                                                    // borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(
                                                        color: AppColors.white,
                                                        width: w * 0.01),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.gray
                                                            .withOpacity(0.07),
                                                        spreadRadius: w * 0.005,
                                                        blurRadius: w * 0.015,
                                                        offset: Offset(0, 5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: h * 0.09,
                                                        width: w * 0.19,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      w * 0.3),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .bottomLeft,
                                                              end: Alignment
                                                                  .topRight,
                                                              colors: [
                                                                AppColors
                                                                    .gradBlack
                                                                    .withOpacity(
                                                                        0.7),
                                                                AppColors
                                                                    .gradWhite
                                                                    .withOpacity(
                                                                        0.7),
                                                              ]),
                                                        ),
                                                        child: Center(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        w * 0.3),
                                                            child: Container(
                                                              color:
                                                                  AppColors.white,
                                                              height: h * 0.076,
                                                              width: w * 0.16,
                                                              child:CachedNetworkImage(
                                                                cacheKey: "${(controller().inboxDataList[index]?["profile"]?["profileImage"]?["imageName"]!="")? (controller().inboxDataList[index]?["profile"]?["profileImage"]?["imageName"]):null ?? "inbox${index}"}",
                                                                imageUrl: "${controller().inboxDataList[index]?["profile"]?["profileImage"]?["path"] ?? ""}",
                                                                fit: BoxFit.cover,
                                                                errorWidget: (context, error,
                                                                    stackTrace) {
                                                                  return Icon(
                                                                    Icons.broken_image_rounded,color: AppColors.black.withOpacity(0.4),size: w*0.1,
                                                                  );
                                                                },

                                                                placeholder: (context, url) {
                                                                  return Shimmer.fromColors(  baseColor: AppColors.shimmerGrey,
                                                                      highlightColor: AppColors.white,
                                                                      enabled: true,child: Container(color: AppColors.grey,));
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: h * 0.02),
                                                        child: Container(
                                                          width: w * 0.5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  if (controller().inboxDataList[index]?["senderId"]
                                                                              ?[
                                                                              "name"] !=
                                                                          null &&
                                                                      controller().inboxDataList[index]?["senderId"]
                                                                              ?[
                                                                              "name"] !=
                                                                          "")
                                                                    Container(
                                                                      width: w *
                                                                          0.2,
                                                                      // color: Colors.red,
                                                                      child:
                                                                          CommonText(
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        text:
                                                                            "${controller().inboxDataList[index]?["senderId"]?["name"] ?? ""}",
                                                                        //AppText.b_name
                                                                        style:
                                                                            juraTextStyle(
                                                                          fontSize:
                                                                              h * 0.022,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  // SizedBox(
                                                                  //     width:
                                                                  //         w * 0.02),
                                                                  if (controller().inboxDataList[index]?["senderId"]
                                                                              ?[
                                                                              "acc_Id"] !=
                                                                          null &&
                                                                      controller()
                                                                              .inboxDataList[index]?["senderId"]?["acc_Id"]
                                                                              .toString() !=
                                                                          "")
                                                                    Container(
                                                                      // color: Colors.red,
                                                                      width: w *
                                                                          0.25,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          CommonText(
                                                                        text:
                                                                            "ID :- ${controller().inboxDataList[index]?["senderId"]?["acc_Id"]}",
                                                                        style:
                                                                            juraTextStyle(
                                                                          fontSize:
                                                                              h * 0.016,
                                                                          color:
                                                                              AppColors.black,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              CommonText(
                                                                text:
                                                                    "${(controller().inboxDataList[index]?["profile"]?["age"] != null && controller().inboxDataList[index]?["profile"]?["age"].toString() != "") ? "Age : ${controller().inboxDataList[index]?["profile"]?["age"]}" : ""}",
                                                                style: juraTextStyle(
                                                                    fontSize: h *
                                                                        0.016,
                                                                    color:
                                                                        AppColors
                                                                            .gray,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              CommonText(
                                                                text: AppText
                                                                    .b_address,
                                                                style: juraTextStyle(
                                                                    fontSize: h *
                                                                        0.020,
                                                                    color:
                                                                        AppColors
                                                                            .gray,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ));
                                      })
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
                          )),
                          // Add some space at the top

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
                                  // commonNavigator(
                                  //     context: context,
                                  //     child: NotificationScreen(),
                                  //     type: PageTransitionType.fade);
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
              return IndexPageShimmer();
            }
          }),
    );
  }
}
