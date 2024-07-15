import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import 'Plans_pricing_detail_controller.dart';

class plandetail extends ConsumerWidget {
  Map<String,dynamic>? planData;
   plandetail({super.key,this.planData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(planPriceDetailsControllerProvider);
    controller() => ref.read(planPriceDetailsControllerProvider.notifier);

    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Center(
      child: Stack(
        children: [
          Container(
            width: w * 0.8,
            height: h * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.024),
              image: DecorationImage(
                image: AssetImage(AppImg.goldbg),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  child: Padding(
                    padding:  EdgeInsets.all(h * 0.024),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.07,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.white,
                                width:
                                h * 0.001,
                              ),
                            ),
                          ),
                          child: CommonText(
                            text: AppText.benefits,
                            style: juraTextStyle(
                              fontSize: h * 0.03,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppImg.done),
                              color: AppColors.white,
                            ),
                            SizedBox(width: w *  0.02),
                            CommonText(
                                text: "View ${planData?["view"]??0} contact details",
                                style: juraTextStyle(
                                    fontSize: h * 0.022,
                                    color: AppColors.white))
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppImg.done),
                              color: AppColors.white,
                            ),
                            SizedBox(width: w *  0.02),
                            CommonText(
                              text: "Send ${planData?["interest"]??0} interest",

                              style: juraTextStyle(
                                  fontSize: h * 0.022,
                                  color: AppColors.white),
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
                      color: AppColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(h * 0.026),
                        bottomRight: Radius.circular(h * 0.024),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceEvenly,
                      children: [
                        Container(
                          width: w * 0.33,
                          height: h * 0.06,

                          // child: Stack(
                          //   children: [
                          //     Container(
                          //       height: h *0.06,
                          //       width: w * 0.4,
                          //       child:
                          //       Row(
                          //         mainAxisAlignment:
                          //         MainAxisAlignment.center,
                          //         crossAxisAlignment:
                          //         CrossAxisAlignment.center,
                          //         children: [
                          //           CommonText(
                          //               text: AppText.rs,
                          //               style: juraTextStyle(
                          //                 fontSize: h * 0.022,
                          //                 fontWeight: FontWeight.w700,
                          //                 color: AppColors.white.withOpacity(0.70),
                          //               )),
                          //           CommonText(
                          //               text: "9000",
                          //               style: juraTextStyle(
                          //                 fontSize: h * 0.032,
                          //                 fontWeight: FontWeight.w700,
                          //                 color: AppColors.white.withOpacity(0.70),
                          //               )),
                          //         ],
                          //       ),
                          //     ),
                          //     Center(
                          //       child:
                          //       Container(
                          //         height: h *
                          //             0.04,
                          //         width: w *
                          //             0.6,
                          //         child: Image
                          //             .asset(
                          //           AppImg
                          //               .cross,
                          //           fit: BoxFit
                          //               .cover,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                        Container(

                          height:
                          h * 0.06,
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
                                  text: AppText
                                      .rs,
                                  style:
                                  juraTextStyle(
                                    fontSize:
                                    h * 0.024,
                                    fontWeight:
                                    FontWeight.w700,
                                    color:
                                    AppColors.white,
                                  )),
                              CommonText(
                                  text: "${planData?["price"]??0}",
                                  style:
                                  juraTextStyle(
                                    fontSize:
                                    h * 0.044,
                                    fontWeight:
                                    FontWeight.w700,
                                    color:
                                    AppColors.white,
                                  )),
                            ],
                          ),
                        ),
                        // CommonText(
                        //   text:
                        //       AppText.rs,
                        //   style: juraTextStyle(
                        //       fontSize: h *
                        //           0.024,
                        //       fontWeight:
                        //           FontWeight
                        //               .w700,
                        //       color: AppColors
                        //           .white),
                        // ),
                        // CommonText(
                        //   text:
                        //       AppText.rss,
                        //   style: juraTextStyle(
                        //       fontSize: h *
                        //           0.044,
                        //       fontWeight:
                        //           FontWeight
                        //               .w700,
                        //       color: AppColors
                        //           .white),
                        // ),
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
                  bottomLeft: Radius.circular(h * 0.024),
                  topRight: Radius.circular(h * 0.024),
                ),
                gradient: commonGradientForPlan(name: planData?["name"]??""),
              ),
              child: Column(
                children: [
                  CommonText(
                    text: planData?["name"]??"",
                    style: juraTextStyle(
                      fontSize: h * 0.024,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: AppText.Validity,
                        style: juraTextStyle(
                          fontSize: w * 0.042,
                          color: AppColors.white,
                            fontWeight: FontWeight.w500,
                        ),
                      ),
                      CommonText(
                        text: planData?["duration"]??"",
                        style: juraTextStyle(
                          fontSize: w * 0.042,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
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
    );
  }
}