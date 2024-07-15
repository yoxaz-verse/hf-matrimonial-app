import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/presentation/br_detail/br_detail_controller.dart';
import 'package:heavenlymatrimony/presentation/login%20page/login_page.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';

import '../bottom_bar/before_bottom_bar_controller.dart';
import '../registration page/registration_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(bottomBarControllerProvider);
    controller() => ref.read(bottomBarControllerProvider.notifier);


    return Scaffold(
      body: Stack(
        children: [

             Container(
               color:  AppColors.black,
               height: h,
               width: w,
               child: AnimatedSwitcher(

                // transitionBuilder: (child, animation) {
                //   return FadeUpwardsPageTransitionsBuilder();
                // },
                duration: Duration(seconds: 2),
                child:   Container(
                  key: UniqueKey(),
                  height: h,
                  width: w,child: Image.asset(
                  // key: UniqueKey(),
                  controller().imgList[controller().imgIndex],
                  fit: BoxFit.cover,
                  color: AppColors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),

                           ),
                 transitionBuilder: (child, animation) {
                   return FadeTransition(opacity: animation,child: child,);

                 },
                         ),
             ),
          Padding(
            padding: EdgeInsets.all(h * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: h * 0.15,
                  child: Stack(
                    children: [
                      CommonText(
                        text: AppText.Marriages,
                        style: juraTextStyle(
                          color: AppColors.white,
                          fontSize: h * 0.08,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Positioned(
                        bottom: h * 0.02,
                        child: Container(
                          height: h * 0.04,
                          child: CommonText(
                            text: AppText.AreMadeinHeaven,
                            style: juraTextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                fontSize: h * 0.025),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      CommonButton(
                          containerwidth: w * 0.4,
                          containerheight: h * 0.05,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h * 0.015)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.005),
                            gradient: commonGradient(),
                          ),
                          text: AppText.Register,
                          textStyle: juraTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.022,
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            // ref
                            //     .read(dialogServiceProvider)
                            //     .searchPartner(controller: controller1);
                            commonNavigator(
                                context: context,
                                child: RegistrationPage(),
                                type: PageTransitionType.fade);
                          }),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      CommonButton(
                          containerwidth: w * 0.4,
                          containerheight: h * 0.05,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h * 0.015)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.005),
                            gradient: commonGradient(),
                          ),
                          text: AppText.Login,
                          textStyle: juraTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.022,
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            commonNavigator(
                                context: context,
                                child: const LoginPage(),
                                type: PageTransitionType.fade);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: h * 0.3,
            left: -w * 0.04,
            child: Container(
              height: h * 0.27,
              width: w * 0.2,
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: appNameText(
                    heavenly: AppText.heavenly,
                    matrimony: AppText.appName,
                    containerHeight: w * 0.2,
                    containerWidth: h * 0.374,
                    heavenlyStyle: juraTextStyle(
                      color: AppColors.watermarkColor.withOpacity(0.1),
                      fontSize: h * 0.052,
                      fontWeight: FontWeight.w500,
                    ),
                    matrimonyStyle: juraTextStyle(
                      color: AppColors.watermarkColor.withOpacity(0.1),
                      fontSize: h * 0.027,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BeforeBottomBar(),
    );
  }
}
