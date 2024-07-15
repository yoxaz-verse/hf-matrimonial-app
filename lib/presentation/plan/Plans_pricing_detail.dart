import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/checkout/checkoutScreen.dart';
import 'package:heavenlymatrimony/presentation/plan/plan.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_listview.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/images.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../shimmers/plans_pricing_detail_shimmer.dart';
import 'Plans_pricing_detail_controller.dart';

class Plans_pricing_detail extends ConsumerWidget {
  Plans_pricing_detail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(planPriceDetailsControllerProvider);
    controller() => ref.read(planPriceDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: asyncState.when(
          data: (data) => SafeArea(
                child: Center(
                  child: Container(
                    height: h * 0.85,
                    width: w * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(h * 0.024),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray.withOpacity(0.2),
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
                          Positioned(
                            bottom: h * 0.01,
                            left: w * 0.03,
                            child: Image.asset(
                              AppImg.ringbg,
                              height: h * 0.2,
                              width: w * 0.6,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: h * 0.035,
                                ),
                                CommonText(
                                    text: AppText.pnp,
                                    style: juraTextStyle(
                                      fontSize: h * 0.032,
                                      fontWeight: FontWeight.w700,
                                    )),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                CommonListView(
                                    itemCount: 3,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: false,
                                    padding: EdgeInsets.all(h * 0.02),
                                    width: w,
                                    height: h * 0.76,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Center(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: w * 0.8,
                                                  height: h * 0.55,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.024),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          controller()
                                                              .image[index]),
                                                      fit: BoxFit.cover,
                                                      colorFilter:
                                                          ColorFilter.mode(
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
                                                              EdgeInsets.all(
                                                                  h * 0.024),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    h * 0.07,
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border:
                                                                      Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color: AppColors
                                                                          .white,
                                                                      width: h *
                                                                          0.001,
                                                                    ),
                                                                  ),
                                                                ),
                                                                child:
                                                                    CommonText(
                                                                  text: AppText
                                                                      .benefits,
                                                                  style:
                                                                      juraTextStyle(
                                                                    fontSize:
                                                                        h * 0.03,
                                                                    color: AppColors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    h * 0.02,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  ImageIcon(
                                                                    AssetImage(
                                                                        AppImg
                                                                            .done),
                                                                    color: AppColors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                      width: w *
                                                                          0.02),
                                                                  CommonText(
                                                                      text: AppText
                                                                          .view_con,
                                                                      style: juraTextStyle(
                                                                          fontSize: h *
                                                                              0.022,
                                                                          color:
                                                                              AppColors.white))
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  ImageIcon(
                                                                    AssetImage(
                                                                        AppImg
                                                                            .done),
                                                                    color: AppColors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                      width: w *
                                                                          0.02),
                                                                  CommonText(
                                                                    text: AppText
                                                                        .sms,
                                                                    style: juraTextStyle(
                                                                        fontSize: h *
                                                                            0.02,
                                                                        color: AppColors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    h * 0.02,
                                                              ),
                                                              CommonText(
                                                                text: AppText
                                                                    .goldpackage,
                                                                maxLines: 16,
                                                                style:
                                                                    juraTextStyle(
                                                                  fontSize:
                                                                      h * 0.016,
                                                                  color:
                                                                      AppColors
                                                                          .white,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(h *
                                                                      0.026),
                                                              bottomRight: Radius
                                                                  .circular(h *
                                                                      0.024),
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

                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      height: h *0.06,
                                                                      width: w * 0.4,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          CommonText(
                                                                              text: AppText.rs,
                                                                              style: juraTextStyle(
                                                                                fontSize: h * 0.022,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: AppColors.white.withOpacity(0.70),
                                                                              )),
                                                                          CommonText(
                                                                              text: "6000",
                                                                              style: juraTextStyle(
                                                                                fontSize: h * 0.032,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: AppColors.white.withOpacity(0.70),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Container(
                                                                        height: h *
                                                                            0.04,
                                                                        width: w *
                                                                            0.6,
                                                                        child: Image
                                                                            .asset(
                                                                          AppImg
                                                                              .cross,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                                        text: AppText
                                                                            .rss,
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
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                h * 0.024),
                                                        topRight:
                                                            Radius.circular(
                                                                h * 0.024),
                                                      ),
                                                      gradient: controller()
                                                          .gradientList[index],
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        CommonText(
                                                          text: controller()
                                                              .package[index],
                                                          style: juraTextStyle(
                                                            fontSize: h * 0.024,
                                                            color:
                                                                AppColors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CommonText(
                                                              text: AppText
                                                                  .Validity,
                                                              style:
                                                                  juraTextStyle(
                                                                fontSize:
                                                                    w * 0.042,
                                                                color: AppColors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            CommonText(
                                                              text:
                                                                  AppText.month,
                                                              style:
                                                                  juraTextStyle(
                                                                fontSize:
                                                                    w * 0.042,
                                                                color: AppColors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                            height: h * 0.02,
                                          ),
                                          CommonButton(
                                            containerwidth: w * 0.4,
                                            containerheight: h * 0.06,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.01),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.01),
                                              gradient: commonGradient(),
                                            ),
                                            text: AppText.payNow,
                                            textStyle: juraTextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: h * 0.026,
                                            ),
                                            onPressed: () {
                                              commonNavigator(
                                                  context: context,
                                                  child: CheckOutScreen(planData: {}),
                                                  type:
                                                      PageTransitionType.fade);
                                            },
                                          ),
                                          SizedBox(
                                            height: h * 0.04,
                                          ),
                                        ],
                                      );
                                    }),
                              ],
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
              return PlansPricingDetailShimmer();
            }
          }),
    );
  }
}
