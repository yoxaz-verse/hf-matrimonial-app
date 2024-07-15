import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/br_detail/br_detail.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.zero,
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // commonNavigator(
              //     context: context,
              //     child: const ProfilePageScreen(),
              //     type: PageTransitionType.fade);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: h * 0.02,
            top: 0,
            right: -w * 0.04,
            child: RotatedBox(
                quarterTurns: 1,
                child: appNameText(
                    heavenly: AppText.heavenly.toUpperCase(),
                    matrimony: AppText.appName.toUpperCase(),
                    containerHeight: w * 0.18,
                    containerWidth: w,
                    heavenlyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.1),
                        fontSize: h * 0.043,
                        fontWeight: FontWeight.w500),
                    matrimonyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.1),
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.w500))),
          ),
          Positioned(
            bottom: h * 0.02,
            top: 0,
            left: -w * 0.04,
            child: RotatedBox(
                quarterTurns: -1,
                child: appNameText(
                    heavenly: AppText.heavenly.toUpperCase(),
                    matrimony: AppText.appName.toUpperCase(),
                    containerHeight: w * 0.18,
                    containerWidth: w,
                    heavenlyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.1),
                        fontSize: h * 0.043,
                        fontWeight: FontWeight.w500),
                    matrimonyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.1),
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.w500))),
          ),
          InkWell(
            highlightColor: Colors.transparent,

            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pushAndRemoveUntil(Globals.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) {return AfterBottomBar();
              },), (route) => false);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                      text: AppText.paymentCompleted,
                      style: juraTextStyle(
                          fontSize: h * 0.02, color: AppColors.paymentMsg,letterSpacing: w*0.00001,wordSpacing:  w*0.00001)),
                  CommonText(
                      text: AppText.successfully,
                      style: juraTextStyle(
                          fontSize: h * 0.02, color: AppColors.paymentMsg,letterSpacing: w*0.00001,wordSpacing:  w*0.00001)),
                  SizedBox(height: h*0.03,),
                  CommonText(

                      text: AppText.welcome,
                      style: juraTextStyle(
                          fontSize: h * 0.07,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,letterSpacing: w*0.0000000,wordSpacing:  w*0.00001,height: h*0.001)),

                  CommonText(
                      text: AppText.hm,
                      style: juraTextStyle(
                          fontSize: h * 0.020, color: AppColors.black,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
