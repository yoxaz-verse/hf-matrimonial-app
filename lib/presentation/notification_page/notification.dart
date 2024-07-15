import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/admin_notification/admin_notification_screen.dart';
import 'package:heavenlymatrimony/utils/common_components/common_navigator.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/color.dart';
import '../../utils/common_components/common_iconbutton.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../myplan/myplan_controller.dart';
import '../send_interest_page/send_interest_screen.dart';
import '../shimmers/notification_shimmer.dart';
import '../inbox/inbox_page.dart';
import 'notification_controller.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(notificationControllerProvider);
    controller() => ref.read(notificationControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body:  SafeArea(
                child: controller().isLoading ?NotificationShimmer():Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: h * 0.1),
                          Padding(
                            padding:
                                EdgeInsets.only(top: h * 0.012, left: h * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ImageIcon(
                                  AssetImage(AppImg.notification),
                                  color: AppColors.gradient2,
                                  size: h * 0.042,
                                ),
                                SizedBox(width: w * 0.03),
                                CommonText(
                                  text: AppText.noti,
                                  style: juraTextStyle(
                                    fontSize: h * 0.028,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.08),
                          Container(
                            height: h * 0.07,
                            width: w * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.008),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.07),
                                  spreadRadius: w * 0.007,
                                  blurRadius: w * 0.02,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    commonNavigator(
                                        context: context,
                                        child: InboxPage(),
                                        type: PageTransitionType.fade);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: w * 0.03),
                                      ImageIcon(
                                        AssetImage(AppImg.mail1),
                                        color: AppColors.gradient1,
                                        size: h * 0.035,
                                      ),
                                      SizedBox(width: w * 0.03),
                                      Container(
                                        height: h * 0.045,
                                        width: w * 0.52,
                                        child: CommonText(
                                          text: AppText.inbox,
                                          style: juraTextStyle(
                                            fontSize: h * 0.028,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: w * 0.35),
                                      if(controller().inboxCount!=0)Container(
                                        height: h * 0.036,
                                        width: w * 0.078,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.024),
                                          color: AppColors.greenn,
                                          border: Border.all(
                                            color: AppColors.black
                                                .withOpacity(0.2),
                                            width: h * 0.001,
                                          ),
                                        ),
                                        child: Center(
                                          child: CommonText(
                                            text: controller().inboxCount.toString(),

                                            style: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.018,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if(controller().inboxCount!=0)SizedBox(width: w * 0.05),
                                      if(controller().inboxCount==0)SizedBox(width: w * 0.12),
                                      Image.asset(
                                        AppImg.next,
                                        height: h * 0.028,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.03),
                          Container(
                            height: h * 0.07,
                            width: w * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.01),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.07),
                                  spreadRadius: w * 0.007,
                                  blurRadius: w * 0.02,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    commonNavigator(
                                        context: context,
                                        child: SendInterestScreen(),
                                        type: PageTransitionType.fade);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: w * 0.02),
                                      ImageIcon(
                                        AssetImage(AppImg.send),
                                        color: AppColors.gradient1,
                                        size: w * 0.09,
                                      ),
                                      SizedBox(width: w * 0.02),
                                      Container(
                                        height: h * 0.045,
                                        width: w * 0.52,
                                        child: CommonText(
                                          text: AppText.sendint,
                                          style: juraTextStyle(
                                            fontSize: h * 0.028,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: w * 0.1),
                                      if(controller().sentInterestCount!=0)
                                        Container(
                                       height: h * 0.036,
                                        width: w * 0.078,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.024),
                                          color: AppColors.greenn,
                                          border: Border.all(
                                            color: AppColors.black
                                                .withOpacity(0.2),
                                            width: h * 0.001,
                                          ),
                                        ),
                                        child: Center(
                                          child: CommonText(
                                            text: controller().sentInterestCount.toString(),
                                            style: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.018,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if(controller().sentInterestCount!=0)SizedBox(width: w * 0.05),
                                      if(controller().sentInterestCount==0)SizedBox(width: w * 0.12),
                                     Image.asset(
                                        AppImg.next,
                                        height: h * 0.028,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.03),
                          Container(
                            height: h * 0.07,
                            width: w * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.01),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.07),
                                  spreadRadius: w * 0.007,
                                  blurRadius: w * 0.02,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    commonNavigator(
                                        context: context,
                                        child: AdminNotificationScreen(),
                                        type: PageTransitionType.fade);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: w * 0.02),
                                      ImageIcon(
                                        AssetImage(AppImg.admin),
                                        color: AppColors.gradient2,
                                        size: w * 0.09,
                                      ),
                                      SizedBox(width: w * 0.02),
                                      Container(
                                        height: h * 0.045,
                                        width: w * 0.52,
                                        child: CommonText(
                                          text: AppText.admin,
                                          style: juraTextStyle(
                                            fontSize: h * 0.028,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: w * 0.3),
                                      if(controller().adminCount!=0)Container(
                                      height: h * 0.036,
                                        width: w * 0.078,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.024),
                                          color: AppColors.greenn,
                                          border: Border.all(
                                            color: AppColors.black
                                                .withOpacity(0.2),
                                            width: h * 0.001,
                                          ),
                                        ),
                                        child: Center(
                                          child: CommonText(
                                            text: controller().adminCount.toString(),
                                            style: juraTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.018,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if(controller().adminCount!=0)SizedBox(width: w * 0.04),
                                      if(controller().adminCount==0)SizedBox(width: w * 0.12),
                                        Image.asset(
                                        AppImg.next,
                                        height: h * 0.028,
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
                    Positioned(
                      top: h * 0.055,
                      left: w * 0.43,
                      child: Image.asset(
                        AppImg.ringbg,
                        height: h * 0.10,
                        width: w * 0.6,
                      ),
                    ),
                    Positioned(
                      top: h * 0.69,
                      right: w * -0.3,
                      child: Image.asset(
                        AppImg.ringbg,
                        height: h * 0.20,
                        width: w * 0.99,
                      ),
                    ),
                  ],
                ),
              ),

      // bottomNavigationBar: AfterBottomBar(),
    );
  }
}
