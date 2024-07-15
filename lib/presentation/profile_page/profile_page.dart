import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/contact/contact.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/presentation/profile_page/profile_page_controller.dart';
import 'package:heavenlymatrimony/presentation/shimmers/profile_page_shimmer.dart';
import 'package:heavenlymatrimony/presentation/terms_condition/terms_condition.dart';
import 'package:heavenlymatrimony/utils/common_components/common_iconbutton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../bottom_bar/before_bottom_bar.dart';
import '../myplan/myplan.dart';
import '../pass_res/pass_res.dart';

class ProfilePageScreen extends ConsumerStatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  ConsumerState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends ConsumerState<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(profilePageScreenControllerProvider);
    controller() => ref.read(profilePageScreenControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: controller().isLoading == true
            ? ProfilePageShimmer()
            : Container(
                height: h,
                child: Column(
                  children: [
                    Container(
                      height: h * 0.85,
                      child: Stack(
                        children: [
                          Positioned(
                            top: h * 0.02,
                            left: -w * 0.05,
                            child: Container(
                              padding: EdgeInsets.only(top: h * 0.05),
                              height: h * 0.25,
                              width: w * 0.65,
                              child: Image.asset(
                                AppImg.rings,
                                fit: BoxFit.fill,
                                color: AppColors.white.withOpacity(0.7),
                                colorBlendMode: BlendMode.lighten,
                              ),
                            ),
                          ),
                          Positioned(
                            top: h * 0.52,
                            left: w * 0,
                            child: Container(
                              height: h * 0.2,
                              width: w,
                              child: Image.asset(
                                AppImg.rings,
                                fit: BoxFit.fill,
                                color: AppColors.white.withOpacity(0.7),
                                colorBlendMode: BlendMode.lighten,
                              ),
                            ),
                          ),
                          Positioned(
                            top: h * 0.65,
                            left: w * 0.082,
                            child: Container(
                              height: h * 0.15,
                              width: w * 0.83,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.grey,
                                    spreadRadius: 4,
                                    blurRadius: 13,
                                  )
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(h * 0.015),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: h * 0.08),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: h * 0.05,
                                      width: w * 0.12,
                                      child: Image.asset(
                                        // width: w * 0.15,
                                        AppImg.leftArrow,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                    CommonIconButton(
                                        containerwidth: w * 0.11,
                                        showSplash: false,
                                        containerheight: h * 0.05,
                                        backgroundColor: AppColors.white,
                                        shape: LinearBorder.none,
                                        centericon: Image.asset(
                                          AppImg.facebookIcon,
                                          fit: BoxFit.cover,
                                        ),
                                        onPressed: () {}),
                                    CommonIconButton(
                                      showSplash: false,
                                      containerwidth: w * 0.12,
                                      containerheight: h * 0.055,
                                      backgroundColor: AppColors.white,
                                      shape: LinearBorder.none,
                                      centericon: Image.asset(
                                        AppImg.whatsappIcon,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {},
                                    ),
                                    CommonIconButton(
                                      containerwidth: w * 0.1,
                                      showSplash: false,
                                      containerheight: h * 0.05,
                                      backgroundColor: AppColors.white,
                                      shape: LinearBorder.none,
                                      centericon: Image.asset(
                                        AppImg.instagramIcon,
                                        width: w * 0.09,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: h * 0.05,
                                      width: w * 0.12,
                                      child: Image.asset(
                                        AppImg.rightArrow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                h * 0.03,
                                h * 0.06,
                                h * 0.03,
                                h * 0.06,
                              ),
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  height: h * 0.6,
                                  width: w * 0.82,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(h * 0.015),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: h * 0.6,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.grey,
                                              spreadRadius: 4,
                                              blurRadius: 13,
                                            )
                                          ],
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(h * 0.015),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(h * 0.037),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: h * 0.18),
                                              InkWell(
                                                onTap: () {
                                                  commonNavigator(
                                                      context: context,
                                                      child: MyAccountScreen(
                                                          controller:
                                                              controller),
                                                      type: PageTransitionType
                                                          .fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg.profileIcon,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text: AppText.prof,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  commonNavigator(
                                                      context: context,
                                                      child: MyPlanScreen(),
                                                      type: PageTransitionType
                                                          .fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg.myPlansIcon,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text: AppText.myplan,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  commonNavigator(
                                                      context: context,
                                                      child:
                                                          const PasswordScreen(),
                                                      type: PageTransitionType
                                                          .fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg
                                                            .resetPasswordIcon,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text:
                                                          AppText.passwordreset,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.all(h * 0.01),
                                                child: const Divider(
                                                    color: AppColors.gradient2),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller().onLogOut();

                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return BeforeBottomBar();
                                                  }), (route) => false);

                                                  // commonNavigator(
                                                  //     context: context,
                                                  //       child: BeforeBottomBar(),
                                                  //       type: PageTransitionType.fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg.logoutIcon,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text: AppText.logout,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  commonNavigator(
                                                      context: context,
                                                      child: contact(
                                                          isFromHomeScreen:
                                                              false),
                                                      type: PageTransitionType
                                                          .fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg.contactIcon,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text: AppText.contactus,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  commonNavigator(
                                                      context: context,
                                                      child:
                                                          const TermsAndConditions(),
                                                      type: PageTransitionType
                                                          .fade);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h * 0.04,
                                                      width: h * 0.04,
                                                      child: Image.asset(
                                                        AppImg.termsIcon,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.04),
                                                    CommonText(
                                                      text: AppText.terms,
                                                      style: juraTextStyle(
                                                        fontSize: w * 0.05,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.17,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.grey,
                                              spreadRadius: 4,
                                              blurRadius: 13,
                                            )
                                          ],
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(h * 0.015),
                                        ),
                                        child: Column(
                                          children: [
                                            controller().myPlanData?["data"]
                                                            ?["accountId"]
                                                        ?["isSubscribed"] ==
                                                    true
                                                ? Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: h * 0.007,
                                                          right: h * 0.004),
                                                      height: h * 0.055,
                                                      width: w * 0.37,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  h * 0.015),
                                                        ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                AppColors.grey,
                                                            spreadRadius: 2,
                                                            blurRadius: 10,
                                                          )
                                                        ],
                                                        gradient:
                                                            commonGradientForPlan(
                                                                name: controller()
                                                                    .planName),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CommonText(
                                                            text: controller()
                                                                .planName,
                                                            style:
                                                                juraTextStyle(
                                                              fontSize:
                                                                  h * 0.017,
                                                              color: AppColors
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          FittedBox(
                                                            child: CommonText(
                                                              text:
                                                                  "${AppText.expiryDateProfilePage} ${controller().validity}",
                                                              softWrap: true,
                                                              style:
                                                                  juraTextStyle(
                                                                fontSize:
                                                                    h * 0.017,
                                                                color: AppColors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: h * 0.055,
                                                    width: w * 0.37),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: h * 0.02),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: h * 0.11,
                                                    width: h * 0.11,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipOval(
                                                        child: controller()
                                                                        .imgUrl !=
                                                                    "" &&
                                                                controller()
                                                                        .imgUrl !=
                                                                    null
                                                            ? CachedNetworkImage(
                                                                cacheKey: controller()
                                                                        .imgName ??
                                                                    "profilePic",
                                                                imageUrl:
                                                                    "${controller().imgUrl}",
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
                                                                        .withOpacity(
                                                                            0.4),
                                                                    size:
                                                                        w * 0.1,
                                                                  );
                                                                },
                                                                placeholder:
                                                                    (context,
                                                                        url) {
                                                                  return Shimmer
                                                                      .fromColors(
                                                                          baseColor: AppColors
                                                                              .shimmerGrey,
                                                                          highlightColor: AppColors
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
                                                                AppImg
                                                                    .profilePic,
                                                                fit: BoxFit
                                                                    .cover,
                                                                height:
                                                                    h * 0.37,
                                                                width: w)),
                                                  ),
                                                  SizedBox(width: w * 0.03),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonText(
                                                        text:
                                                            controller().userId,
                                                        style: juraTextStyle(
                                                          fontSize: h * 0.017,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      CommonText(
                                                        text: controller()
                                                            .userName,
                                                        style: juraTextStyle(
                                                          fontSize: h * 0.022,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  )
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
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ), // bottomNavigationBar: AfterBottomBar(),
    );
  }
}
