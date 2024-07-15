import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



part 'terms_condition_controller.g.dart';

@riverpod
class TermsAndConditionScreenController extends _$TermsAndConditionScreenController {
  TextEditingController termsAndConditionScreenController= TextEditingController();
  bool _isLoading= false;
  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    _isLoading=false;
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