import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/shimmers/about_page_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_carouselslider.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';
import '../error/error_screen.dart';
import 'about_page_controller.dart';

class About extends ConsumerWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(aboutControllerProvider);
    controller() => ref.read(aboutControllerProvider.notifier);
    final asyncState1 = ref.watch(afterBottomBarControllerProvider());
    controller1() => ref.read(afterBottomBarControllerProvider().notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: asyncState.when(
          data: (data) => SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      right: -w * 0.08,
                      bottom: -h * 0.00,
                      left: w * 0.4,
                      child: Image.asset(
                        AppImg.ringimg,
                        colorBlendMode: BlendMode.lighten,
                        color: AppColors.white.withOpacity(0.9),
                        height: h * 0.18,
                        width: w * 0.3,
                      ),
                    ),
                    controller().aboutUsDataResponse == null
                        ? Center(
                            child: noDataCommonText(
                            style: juraTextStyle(
                                fontSize: h * 0.032,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w700),
                          ))
                        : Scrollbar(
                            thickness: w * 0.02,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.05),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: w * 0.07,
                                          right: w * 0.03,
                                          bottom: h * 0.01,
                                          top: h * 0.05),
                                      child: Row(
                                        children: [
                                          CommonText(
                                            text: AppText.about,
                                            style: juraTextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: h * 0.032,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CommonCarousel(
                                      enlargeFactor: 1,
                                      containerheight: h,
                                      containerwidth: w * 0.5,
                                      viewportFraction: 1,
                                      scrollDirection: Axis.horizontal,
                                      autoPlayCurve: Curves.easeInOut,
                                      aspectRatio: 16 / 9,
                                      itemBuilder: (BuildContext context,
                                          int index, int realIndex) {
                                        //   return Image.network(
                                        //     controller().aboutUsImageData[0],
                                        //     fit: BoxFit.cover,
                                        //   );
                                        // },
                                        return CachedNetworkImage(
                                          cacheKey: controller().imageName != ""
                                              ? controller().imageName
                                              : "about",
                                          imageUrl: controller()
                                                  .aboutUsImageData[0] ??
                                              "",
                                          fit: BoxFit.cover,
                                          errorWidget:
                                              (context, error, stackTrace) {
                                            return Icon(
                                              Icons.broken_image_rounded,
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              size: w * 0.1,
                                            );
                                          },
                                          placeholder: (context, url) {
                                            return Shimmer.fromColors(
                                                baseColor:
                                                    AppColors.shimmerGrey,
                                                highlightColor: AppColors.white,
                                                enabled: true,
                                                child: Container(
                                                  color: AppColors.grey,
                                                ));
                                          },
                                        );
                                      },
                                      enableInfiniteScroll: false,
                                      autoPlay: true,
                                      reverse: false,
                                      itemCount:
                                          controller().aboutUsImageData.length,
                                      carouselHeight: h * 0.4,
                                      dotindicator: false,
                                      carouselController:
                                          controller().controller,
                                      disableGesture: true,
                                      padding: EdgeInsets.all(0),
                                      gradient: true,
                                      getcurrentPageIndex:
                                          controller().getcurrentPageIndex,
                                      onPageChanged: (index, reason) {
                                        controller().onPageChanged(index);
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: w * 0.04,
                                          bottom: h * 0.04,
                                          right: w * 0.04,
                                          top: h * 0.03),
                                      child: CommonText(
                                        // text: AppText.detail,
                                        text: controller().aboutUsData,
                                        style: juraTextStyle(
                                          letterSpacing: h * 0.002,
                                          color:
                                              AppColors.gray.withOpacity(0.6),
                                          fontSize: h * 0.022,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
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
              return AboutPageShimmer();
            }
          }),

      // bottomNavigationBar:  BeforeBottomBar(),
    );
  }
}
