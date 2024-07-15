import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';

import '../error/error_screen.dart';
import '../notification_page/notification.dart';
import '../shimmers/admin_notification_shimmer.dart';
import 'admin_notification_screen_controller.dart';

class AdminNotificationScreen extends ConsumerWidget {
  const AdminNotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(adminNotificationScreenControllerProvider);
    controller() =>
        ref.read(adminNotificationScreenControllerProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: asyncState.when(
          data: (data) => SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: h * 0.01,
                      left: w * 0.62,
                      child: Opacity(
                          opacity: 0.15,
                          child: Image.asset(
                            AppImg.rings,
                            height: h * 0.2,
                            width: w * 0.32,
                          )),
                    ),
                    Positioned(
                      top: h * 0.06,
                      left: w * 0.85,
                      child: CommonIconButton(
                          containerwidth: w * 0.12,
                          containerheight: h * 0.06,
                          backgroundColor: AppColors.transparent,
                          shape: LinearBorder.none,
                          centericon: Icon(
                            Icons.arrow_back_ios_new,
                            size: h * 0.03,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            
                            // commonNavigator(
                            //     context: context,
                            //     child: NotificationScreen(),
                            //     type: PageTransitionType.fade);
                            
                          }),
                    ),
                    Positioned(
                      top: h * 0.12,
                      left: w * 0.02,
                      child: Row(
                        children: [
                          Image.asset(
                            AppImg.admin,
                            height: h * 0.04,
                            width: w * 0.16,
                            color: AppColors.gradient1,
                          ),
                          CommonText(
                              text: AppText.adminNotification,
                              style: juraTextStyle(
                                  fontSize: h * 0.032,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Positioned(
                      top: h * 0.18,
                      left: w * 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: Container(
                          height: h * 0.7,
                          width: w * 0.65,
                          child: controller().adminNotificationDataList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller()
                                      .adminNotificationDataList
                                      .length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  // width: w * 0.89,
                                  // height: h * 0.78,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.016, vertical: h * 0.016),
                                  itemBuilder: (BuildContext context, int index) {
                                    int itemCount = index + 1;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: h * 0.02,
                                      ),
                                      child: Container(
                                        // height: double.minPositive,
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: AppColors.backgroundField,
                                          borderRadius:
                                              BorderRadius.circular(h * 0.015),
                                          border: Border.all(
                                            color: AppColors.white,
                                            width: w * 0.01,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.backgroundField,
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        // child: ListTile(
                                        //   tileColor: AppColors.white.withOpacity(0.7),
                                        //   title: CommonText(
                                        //       text:
                                        //           '0$itemCount   ${controller().adminNotificationDataList[index]["title"]}',
                                        //       style: juraTextStyle(
                                        //           fontSize: h * 0.03,
                                        //           fontWeight: FontWeight.w600)),
                                        //   subtitle: CommonText(
                                        //     text: "${controller().adminNotificationDataList[index]["description"]}",
                                        //     style: juraTextStyle(
                                        //       fontSize: h * 0.022,
                                        //       color: AppColors.gray,
                                        //     ),
                                        //   ),
                                        // ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: w * 0.8,
                                              child: CommonText(
                                                  text:
                                                      '0$itemCount   ${controller().adminNotificationDataList[index]["title"]}',
                                                  style: juraTextStyle(
                                                      fontSize: h * 0.03,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            Container(
                                                width: w * 0.8,
                                                child: CommonText(
                                                  text:
                                                      "${controller().adminNotificationDataList[index]["description"]}",
                                                  style: juraTextStyle(
                                                    fontSize: h * 0.022,
                                                    color: AppColors.gray,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child: noDataCommonText(
                                      style: juraTextStyle(
                                          fontSize: h * 0.032,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w700)),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.01,
                      right: -w * 0.23,
                      child: Opacity(
                        opacity: 0.07,
                        child: Image.asset(
                          AppImg.rings,
                          height: h * 0.25,
                          width: w * 0.97,
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
              return AdminNotificationShimmer();
            }
          }),
    );
  }
}
