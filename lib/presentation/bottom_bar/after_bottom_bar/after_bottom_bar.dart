import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';

import '../../../utils/color.dart';
import '../../br_detail/br_detail.dart';
import '../../notification_page/notification.dart';
import '../../profile_page/profile_page.dart';
import '../../subsription/subscription_screen.dart';
import 'after_bottom_bar_controller.dart';

class AfterBottomBar extends ConsumerWidget {
  int startIndex;
  AfterBottomBar({Key? key, this.startIndex = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState =
        ref.watch(afterBottomBarControllerProvider(startIndex: startIndex));
    controller() => ref.read(
        afterBottomBarControllerProvider(startIndex: startIndex).notifier);
    final currentIndex = controller().selectedIndex;

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return  WillPopScope(

        onWillPop: () async {

          DialogServiceV1().areYouSureDialogue(titleText: "Are you sure you want to exit?",onYesPressed: (){              SystemNavigator.pop();
          }, subtitleText: '', yesText: 'Exit', noText: 'No', onNoPressed: () { Navigator.pop(context); });




          return false;
        },child:Scaffold(
      body: controller().selectedIndex == 0
          ? BrDetailScreen()
          : controller().selectedIndex == 1
              ? const NotificationScreen()
              : controller().selectedIndex == 2
                  ? SubscrptionScreen()
                  : controller().selectedIndex == 3
                      ? ProfilePageScreen()
                      : null,
      bottomNavigationBar: Container(
        height: h * 0.1,
        padding: EdgeInsets.only(left: h * 0.05),
        color: AppColors.black,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller().listOfIcons.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller().onItemTapped(index);
                },
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: index == controller().selectedIndex
                        ? h * 0.075
                        : h * 0.065,
                    width: w * 0.2,
                    curve: Curves.fastLinearToSlowEaseIn,
                    padding: EdgeInsets.all(h * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: index == controller().selectedIndex
                          ? BorderRadius.circular(h * 0.01)
                          : index == 3
                              ? BorderRadius.only(
                                  topRight: Radius.circular(h * 0.01),
                                  bottomRight: Radius.circular(h * 0.01))
                              : index == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(h * 0.01),
                                      bottomLeft: Radius.circular(h * 0.01))
                                  : null,
                      color: index == controller().selectedIndex
                          ? AppColors.white
                          : AppColors.gray,
                    ),
                    child: Image.asset(
                      controller().listOfIcons[index],
                      height: w * 0.08,
                      color: index == controller().selectedIndex
                          ? AppColors.gradient2
                          : AppColors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   width: w,
      //   color: AppColors.black.withOpacity(0.8),
      //   child: Container(
      //     margin:
      //         EdgeInsets.symmetric(vertical: w * 0.04, horizontal:w * 0.13),
      //     height: h * 0.07,
      //     width: w * 0.3,
      //     decoration: BoxDecoration(
      //       color: AppColors.gray,
      //       borderRadius: BorderRadius.circular(h * 0.01),
      //     ),
      //     child: ListView.builder(
      //       itemCount: controller().listOfIcons.length,
      //       scrollDirection: Axis.horizontal,
      //       physics: NeverScrollableScrollPhysics(),
      //       padding: EdgeInsets.all(h * 0.001),
      //       itemBuilder: (context, index) => InkWell(
      //         onTap: () {
      //           controller().onItemTapped(index);
      //           HapticFeedback.lightImpact();
      //         },
      //         splashColor: AppColors.transparent,
      //         highlightColor: AppColors.transparent,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             AnimatedContainer(
      //               duration: const Duration(seconds: 1),
      //               curve: Curves.fastLinearToSlowEaseIn,
      //               height: h * 0.12,
      //               width: w * 0.15,
      //               decoration: BoxDecoration(
      //                 color: index == controller().selectedIndex
      //                     ? AppColors.white
      //                     : AppColors.transparent,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: Center(
      //                 child: Image.asset(
      //                   controller().listOfIcons[index],
      //                   height: w * 0.09,
      //                   color: index == controller().selectedIndex
      //                       ? AppColors.gradient2
      //                       : AppColors.white,
      //                 ),
      //               ),
      //             ),
      //             SizedBox(width: w*0.045,),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    ));
  }
}
