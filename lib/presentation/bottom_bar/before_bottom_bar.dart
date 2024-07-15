import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/before_bottom_bar_controller.dart';
import 'package:heavenlymatrimony/presentation/home_page/home_page_screen.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import '../About Page/about_page.dart';
import '../Testimony/testimony.dart';
import '../contact/contact.dart';

class BeforeBottomBar extends ConsumerWidget {
  BeforeBottomBar({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(bottomBarControllerProvider);
    controller() => ref.read(bottomBarControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: controller().selectedIndex == 0
          ? HomePage()
          : controller().selectedIndex == 1
              ? About()
              : controller().selectedIndex == 2
                  ? testimony()
                  : controller().selectedIndex == 3
                      ? contact()
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
      //   color: AppColors.black,
      //   child: Container(
      //     margin:
      //         EdgeInsets.symmetric(vertical: w * 0.04, horizontal: w * 0.13),
      //     height: h * 0.08,
      //     decoration: BoxDecoration(
      //       color: AppColors.gray,
      //       borderRadius: BorderRadius.circular(h * 0.01),
      //     ),
      //     child: ListView.builder(
      //       itemCount: controller().listOfIcons.length,
      //       scrollDirection: Axis.horizontal,
      //       physics: const NeverScrollableScrollPhysics(),
      //       // padding: EdgeInsets.all(h * 0.001),
      //       itemBuilder: (context, index) => InkWell(
      //         onTap: () {
      //           controller().onItemTapped(index);
      //         },
      //         splashColor: AppColors.transparent,
      //         highlightColor: AppColors.transparent,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             AnimatedContainer(
      //               duration: const Duration(seconds: 1),
      //               curve: Curves.fastLinearToSlowEaseIn,
      //               height:  h * 0.2,
      //               width: w * 0.15,
      //               decoration: BoxDecoration(
      //                 color: index == controller().selectedIndex
      //                     ? AppColors.white
      //                     : AppColors.transparent,
      //                 borderRadius: BorderRadius.circular(h*0.01),
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
    );
  }
}
