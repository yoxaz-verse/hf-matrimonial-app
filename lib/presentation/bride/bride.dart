import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/inbox/inbox_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_carouselslider.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../send_interest_reason/send_interest_reason.dart';
import 'b_fullDetails/bride_Full_Details_controller.dart';

class brideInfo extends ConsumerWidget {
  final String accountId;
  brideInfo({super.key, required this.accountId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState =
        ref.watch(brideFullDetailsControllerProvider(accountId: accountId));
    controller() => ref.read(
        brideFullDetailsControllerProvider(accountId: accountId).notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    CarouselController _controller = CarouselController();
    return Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                          color: AppColors.black,
                        )),
                  ),
                  Container(
                    height: h * 0.3,
                    child: Stack(
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h * 0.03),
                          ),
                          child: Container(
                            height: h * 0.28,
                            width: w * 0.530,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(h * 0.03),
                            ),
                            child: CommonCarousel(
                              enlargeFactor: 1,
                              ispageIndicatorInside: false,
                              containerheight: h * 0.333,
                              containerwidth: w,
                              viewportFraction: 1,
                              scrollDirection: Axis.horizontal,
                              autoPlayCurve: Curves.easeInOut,
                              aspectRatio: 16 / 9,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                // 
                                return Container(
                                  height: h * 0.25,
                                  width: w * 0.45,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.02),
                                          child: ((controller().image.isNotEmpty && controller().image[index].isNotEmpty) &&
                                              (controller().image[index]
                                                  ?.startsWith(
                                                  "http") ==
                                                  true)) && controller().image.length!=0
                                              ? Image.network(
                                            controller().image[index],
                                            fit: BoxFit.cover,
                                            height: h * 0.22,
                                            width: w * 0.45,  errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              AppImg
                                                  .profilePic,
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                            loadingBuilder:
                                                (BuildContext
                                            context,
                                                Widget
                                                child,
                                                ImageChunkEvent?
                                                loadingProgress) {
                                              if (loadingProgress ==
                                                  null) {
                                                return child;
                                              } else {
                                                return Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes !=
                                                        null
                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                        loadingProgress.expectedTotalBytes!
                                                        : null,color: AppColors.gradient1,
                                                  ),
                                                );
                                              }
                                            },
                                          )
                                              : Image.asset(AppImg.profilePic,
                                              fit: BoxFit.cover,
                                              height: h * 0.37,
                                              width: w),
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
                              enableInfiniteScroll: false,
                              autoPlay: false,
                              reverse: false,
                              itemCount: controller().image.length!=0?controller().image.length:1,
                              carouselHeight: h * 0.26,
                              dotindicator: true,
                              carouselController: _controller,
                              disableGesture: true,
                              padding: EdgeInsets.all(0),
                              gradient: true,
                              getcurrentPageIndex:
                                  controller().getcurrentPageIndex,
                              onPageChanged: (index, reason) {
                                controller().onPageChanged(index);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: w * 0.18,
                          top: h * 0.26,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Container(
                              height: h * 0.033,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Text and Button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                        text: controller().brideName,
                        style: juraTextStyle(
                          fontSize: h * 0.026,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (controller().brideDetails?["age"] != null ||
                          controller().brideDetails?["occupationDetail"] !=
                              null)
                        CommonText(
                          text:
                              "${controller().brideDetails?["age"] != null ? "Age: ${controller().brideDetails?["age"]}, " : ""}${controller().brideDetails?["occupationDetail"] != null ? "${controller().brideDetails?["occupationDetail"]}" : ""}",
                          style: juraTextStyle(fontSize: h * 0.017),
                        ),
                      if (controller().brideDetails?["Address"] != null ||
                          controller().brideDetails?["Distict"] !=
                              null ||
                          controller().brideDetails?["State"] !=
                              null ||
                          controller().brideDetails?["Country"] !=
                              null)
                        CommonText(
                          text:
                              "${controller().brideDetails?["Address"]["Address"] != null ? "${controller().brideDetails?["Address"]["Address"]} " : ""}${controller().brideDetails?["Address"]["Distict"] != null ? "${controller().brideDetails?["Address"]["Distict"]} " : ""}${controller().brideDetails?["Address"]["State"] != null ? "${controller().brideDetails?["Address"]["State"]} " : ""}${controller().brideDetails?["Address"]["Country"] != null ? "${controller().brideDetails?["Address"]["Country"]}" : ""}",
                          style: juraTextStyle(fontSize: h * 0.017),
                        ),
                      SizedBox(height: h * 0.01),
                      CommonButton(
                        containerwidth: w * 0.4,
                        containerheight: h * 0.06,
                        // backgroundColor: AppColors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: commonGradient(),
                        ),
                        text: AppText.interested,
                        textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: h * 0.018,
                        ),
                        onPressed: () {
                          controller().onInterestTapped(context: context);
                        },
                      ),
                      CommonText(text: "Interest left : ${controller().interest}", style: juraTextStyle())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
