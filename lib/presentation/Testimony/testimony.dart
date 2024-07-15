import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/presentation/Testimony/testimony_controller.dart';
import 'package:heavenlymatrimony/presentation/shimmers/testimany_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_iconbutton.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';

class testimony extends ConsumerStatefulWidget {
  const testimony({super.key});

  @override
  ConsumerState createState() => _testimonyState();
}

class _testimonyState extends ConsumerState<testimony> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(testimonyControllerProvider);
    controller() => ref.read(testimonyControllerProvider.notifier);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: asyncState.when(
            data: (data) => Stack(
                  children: [
                    Container(
                      height: h,
                      width: w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImg.welcomeImg),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  AppColors.black.withOpacity(0.7),
                                  BlendMode.darken))),
                    ),
                    Container(
                      color: AppColors.white,
                      height: h * 0.83,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: h * 0.1,
                          ),
                          Container(
                            height: h * 0.05,
                            width: w * 0.63,
                            decoration: BoxDecoration(),
                            child: CommonText(
                              text: AppText.testimony,
                              style: juraTextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.073,
                              ),
                            ),
                          ),
                          Container(
                            height: h * 0.6,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h * 0.15,
                                  child: Center(
                                    child: Opacity(
                                      opacity: 0.1,
                                      child: Image.asset(
                                        AppImg.ring,
                                        height: h * 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                                controller()
                                            .testimonyResponse?["data"]
                                                ?["testimonys"]
                                            .isNotEmpty ??
                                        false
                                    ? CarouselSlider.builder(
                                        carouselController:
                                            controller().carouselController,
                                        itemCount: controller()
                                                .testimonyResponse?["data"]
                                                    ?["testimonys"]
                                                ?.length ??
                                            0,
                                        itemBuilder: (BuildContext context,
                                                int index, int pageViewIndex) =>
                                            Center(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: h * 0.45,
                                                  width: w * 0.69,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.015),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.black
                                                            .withOpacity(0.14),
                                                        blurRadius: 10,
                                                        blurStyle:
                                                            BlurStyle.outer,
                                                        offset: Offset(0, 0),
                                                      )
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: h * 0.25,
                                                        color: AppColors.white,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(h *
                                                                      0.015),
                                                              topRight: Radius
                                                                  .circular(h *
                                                                      0.015),
                                                            ),
                                                            child: (controller().testimonyResponse?["data"]?["testimonys"]?[index]?["images"]
                                                                            ?[
                                                                            "path"] ==
                                                                        "" ||
                                                                    controller().testimonyResponse?["data"]?["testimonys"]?[index]?["images"]
                                                                            ?["path"] ==
                                                                        null)
                                                                ? Image.asset(
                                                                    controller()
                                                                        .image[0],
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                  )
                                                                : CachedNetworkImage(
                                                                    cacheKey: controller().testimonyResponse!["data"]?["testimonys"][index]
                                                                            ?[
                                                                            "images"]["imageName"] ??
                                                                        "testimony${index}",
                                                                    imageUrl:
                                                                        "${controller().testimonyResponse!["data"]?["testimonys"][index]?["images"]["path"] ?? ""}",
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
                                                                  )),
                                                      ),
                                                      Container(
                                                        height: h * 0.2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Image.asset(
                                                                  AppImg.line_v,
                                                                  height:
                                                                      h * 0.3,
                                                                  width:
                                                                      h * 0.06,
                                                                ),
                                                                Positioned(
                                                                  top:
                                                                      h * 0.025,
                                                                  left: -w *
                                                                      0.004,
                                                                  child: Image
                                                                      .asset(
                                                                    AppImg
                                                                        .roseleft,
                                                                    height: h *
                                                                        0.15,
                                                                    width: h *
                                                                        0.06,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      h * 0.09,
                                                                  child: Container(
                                                                      height: h * 0.09,
                                                                      width: h * 0.15,
                                                                      child: TextField(
                                                                          controller: TextEditingController.fromValue(TextEditingValue(text: controller().testimonyResponse?["data"]?["testimonys"]?[index]?["description"] ?? "")),
                                                                          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                                                          readOnly: true,
                                                                          maxLines: 4,
                                                                          decoration: InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                          ))),
                                                                ),
                                                                SizedBox(
                                                                    height: h *
                                                                        0.03),
                                                                InkWell(
                                                                  onTap: () {
                                                                    controller()
                                                                        .toggleReadMore();
                                                                    DialogServiceV1()
                                                                        .readMoreTestimony(
                                                                      text: (controller().testimonyResponse?["data"]?["testimonys"]?[index]?["description"] ??
                                                                              "")
                                                                          .toString(),
                                                                      ImageWidget:
                                                                          Container(
                                                                        color: AppColors
                                                                            .white,
                                                                        height: h *
                                                                            0.15,
                                                                        child: ClipRRect(
                                                                            borderRadius: BorderRadius.circular(h * 0.015),
                                                                            child: ((controller().testimonyResponse?["data"]?["testimonys"]?[index]?["images"]?.isEmpty ?? true) || controller().testimonyResponse?["data"]?["testimonys"]?[index]?["images"]?[0]?["path"] == "")
                                                                                ? Image.asset(
                                                                                    controller().image[index],
                                                                                    fit: BoxFit.scaleDown,
                                                                                  )
                                                                                : CachedNetworkImage(
                                                                                    cacheKey: controller().testimonyResponse!["data"]?["testimonys"][index]?["images"]["imageName"] ?? "testimony${index}",
                                                                                    imageUrl: "${controller().testimonyResponse!["data"]?["testimonys"][index]?["images"]["path"] ?? ""}",
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
                                                                                  )),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: h *
                                                                        0.06,
                                                                    width: w *
                                                                        0.39,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(h *
                                                                              0.01),
                                                                      gradient:
                                                                          commonGradient(),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CommonText(
                                                                        text:
                                                                            'Read More',
                                                                        style:
                                                                            juraTextStyle(
                                                                          color:
                                                                              AppColors.white,
                                                                          fontSize:
                                                                              h * 0.022,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Image.asset(
                                                                  AppImg.line_v,
                                                                  height:
                                                                      h * 0.3,
                                                                  width:
                                                                      h * 0.06,
                                                                ),
                                                                Positioned(
                                                                  top:
                                                                      h * 0.006,
                                                                  left:
                                                                      -w * 0.05,
                                                                  child: Image
                                                                      .asset(
                                                                    AppImg
                                                                        .roseright,
                                                                    height: h *
                                                                        0.18,
                                                                    width: h *
                                                                        0.09,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        options: CarouselOptions(
                                          height: h * 0.65,
                                          aspectRatio: 16 / 9,
                                          viewportFraction: 0.8,
                                          initialPage: 0,
                                          enableInfiniteScroll: false,
                                          reverse: false,
                                          autoPlay: false,
                                          autoPlayInterval:
                                              Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 800),
                                          // autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          autoPlayCurve: Curves.easeInOut,
                                          onPageChanged: controller()
                                              .onCarouselPageChanged,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      )
                                    : Center(
                                        child: Container(
                                          height: h * 0.1,
                                          child: noDataCommonText(
                                            data: "No Data Found",
                                            style: juraTextStyle(
                                              color: AppColors.gray,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * 0.055,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  top: h * 0.25,
                                  left: -w * 0.01,
                                  child: controller().seletedIndex != 0
                                      ? CommonIconButton(
                                          containerwidth: w * 0.12,
                                          containerheight: h * 0.06,
                                          backgroundColor:
                                              AppColors.transparent,
                                          shape: LinearBorder.none,
                                          centericon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            size: h * 0.04,
                                          ),
                                          onPressed: () {
                                            controller()
                                                .carouselController
                                                .previousPage();
                                          })
                                      : SizedBox(),
                                ),
                                controller()
                                            .testimonyResponse?["data"]
                                                ?["testimonys"]
                                            .isNotEmpty ??
                                        false
                                    ? Positioned(
                                        top: h * 0.25,
                                        right: -w * 0.01,
                                        child: controller()
                                                        .testimonyResponse?[
                                                            "data"]
                                                            ?["testimonys"]
                                                        .length -
                                                    1 !=
                                                controller().seletedIndex
                                            ? CommonIconButton(
                                                containerwidth: w * 0.12,
                                                containerheight: h * 0.06,
                                                backgroundColor:
                                                    AppColors.transparent,
                                                shape: LinearBorder.none,
                                                centericon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: h * 0.04,
                                                ),
                                                onPressed: () {
                                                  controller()
                                                      .carouselController
                                                      .nextPage();
                                                })
                                            : SizedBox(),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            error: (error, stackTrace) => ErrorScreen(
                text: error.toString(),
                backgroundColor: AppColors.white,
                color: AppColors.red),
            loading: () {
              if (controller().isLoading) {
                return TestimonyShimmer();
              }
            }));
  }
}
