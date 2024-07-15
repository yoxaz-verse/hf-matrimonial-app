import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/globals.dart';
import '../bottom_bar/before_bottom_bar.dart';

part 'loading_screen_controller.g.dart';

@riverpod
class LoadingScreenController extends _$LoadingScreenController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    PreferenceManagerUtils.getIsLogin().then((islogin) {
      if (islogin == true) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: AfterBottomBar(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: BeforeBottomBar(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        });
      }
    });

    // Future.delayed(const Duration(seconds: 2), () {
    //   PreferenceManagerUtils.getIsOnboarding().then((onBoard) {
    //     //  
    //     // if (value == true) {
    //     PreferenceManagerUtils.getIsLogin().then((isLogin) {
    //       // 
    //       PreferenceManagerUtils.getIsIndividual().then((isIndividual) {
    //         PreferenceManagerUtils.getAsGuest().then((asGuest) {
    //           //    
    //           switch (onBoard) {
    //             case true:
    //               //    
    //               switch (isLogin) {
    //                 case true:
    //                   // 
    //                   Navigator.pushAndRemoveUntil(
    //                       Globals.navigatorKey.currentContext!,
    //                       PageTransition(
    //                           child: isIndividual == 1
    //                               ? BottomBar(index: 0)
    //                               : isIndividual == 2
    //                                   ? const AdminPanel()
    //                                   : const RegisterScreen(),
    //                           type: PageTransitionType.fade,
    //                           duration: const Duration(milliseconds: 400)),
    //                       (Route<dynamic> route) => false);
    //                   break;
    //                 case false:
    //                   // 
    //                   switch (asGuest) {
    //                     case true:
    //                       //    
    //                       Navigator.pushAndRemoveUntil(
    //                           Globals.navigatorKey.currentContext!,
    //                           PageTransition(
    //                               child: isIndividual == 1
    //                                   ? BottomBar(index: 0)
    //                                   : isIndividual == 2
    //                                       ? const AdminPanel()
    //                                       : const RegisterScreen(),
    //                               type: PageTransitionType.fade,
    //                               duration: const Duration(milliseconds: 400)),
    //                           (Route<dynamic> route) => false);
    //                       break;
    //                     case false:
    //                       //  
    //                       Navigator.pushAndRemoveUntil(
    //                           Globals.navigatorKey.currentContext!,
    //                           PageTransition(
    //                               child: const RegisterScreen(),
    //                               type: PageTransitionType.fade,
    //                               duration: const Duration(milliseconds: 400)),
    //                           (Route<dynamic> route) => false);
    //                       break;
    //                     case null:
    //                       //       
    //                       Navigator.pushAndRemoveUntil(
    //                           Globals.navigatorKey.currentContext!,
    //                           PageTransition(
    //                               child: const RegisterScreen(),
    //                               type: PageTransitionType.fade,
    //                               duration: const Duration(milliseconds: 400)),
    //                           (Route<dynamic> route) => false);
    //                       break;
    //                     default:
    //                       //   
    //                       Navigator.pushAndRemoveUntil(
    //                           Globals.navigatorKey.currentContext!,
    //                           PageTransition(
    //                               child: const RegisterScreen(),
    //                               type: PageTransitionType.fade,
    //                               duration: const Duration(milliseconds: 400)),
    //                           (Route<dynamic> route) => false);
    //                       break;
    //                   }
    //                   break;
    //                 case null:
    //                   //  
    //                   Navigator.pushAndRemoveUntil(
    //                       Globals.navigatorKey.currentContext!,
    //                       PageTransition(
    //                           child: const RegisterScreen(),
    //                           type: PageTransitionType.fade,
    //                           duration: const Duration(milliseconds: 400)),
    //                       (Route<dynamic> route) => false);
    //                   break;
    //                 default:
    //                   // 
    //                   Navigator.pushAndRemoveUntil(
    //                       Globals.navigatorKey.currentContext!,
    //                       PageTransition(
    //                           child: const RegisterScreen(),
    //                           type: PageTransitionType.fade,
    //                           duration: const Duration(milliseconds: 400)),
    //                       (Route<dynamic> route) => false);
    //                   break;
    //               }
    //               break;
    //             case false:
    //               //  
    //               Navigator.pushAndRemoveUntil(
    //                   Globals.navigatorKey.currentContext!,
    //                   PageTransition(
    //                       child: const OnBoardingScreen(),
    //                       type: PageTransitionType.fade,
    //                       duration: const Duration(milliseconds: 400)),
    //                   (Route<dynamic> route) => false);
    //               break;
    //             case null:
    //               //   
    //               Navigator.pushAndRemoveUntil(
    //                   Globals.navigatorKey.currentContext!,
    //                   PageTransition(
    //                       child: const OnBoardingScreen(),
    //                       type: PageTransitionType.fade,
    //                       duration: const Duration(milliseconds: 400)),
    //                   (Route<dynamic> route) => false);
    //               break;
    //             default:
    //               //   
    //               Navigator.pushAndRemoveUntil(
    //                   Globals.navigatorKey.currentContext!,
    //                   PageTransition(
    //                       child: const OnBoardingScreen(),
    //                       type: PageTransitionType.fade,
    //                       duration: const Duration(milliseconds: 400)),
    //                   (Route<dynamic> route) => false);
    //               break;
    //           }
    //         });
    //       });
    //     });
    //   });
    // });
    state = const AsyncValue.data(null);
  }
}
