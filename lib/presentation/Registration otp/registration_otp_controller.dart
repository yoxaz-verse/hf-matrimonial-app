import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/br_detail/br_detail.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/otp/otp_service.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';

part 'registration_otp_controller.g.dart';

@riverpod
class RegistrationOtpController extends _$RegistrationOtpController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneotpcontroller = TextEditingController();
  TextEditingController emailotpcontroller = TextEditingController();
  PinTheme? isPinTheme;
  bool _isLoading = false;
  String authToken = "";
  bool get isLoading => _isLoading;
  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  Map<String, dynamic>? _verifyResponse;
  bool isFromRegister=false;

  @override
  FutureOr<void> build({email,phoneNo,fromRegister=false}) async {
    state = const AsyncLoading();
    emailIdController.text = email;
    phoneController.text = phoneNo;
    isFromRegister = fromRegister??false;
PreferenceManagerUtils.getToken().then((value) {
  authToken = value;
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
    _isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    isPinTheme = PinTheme(
      height: h * 0.06,
      width: h * 0.05,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
        color: AppColors.black.withOpacity(0.05),
      ),
      padding: EdgeInsets.zero,
      textStyle: juraTextStyle(
          fontSize: w * 0.04,
          color: AppColors.black,
          fontWeight: FontWeight.w700),
      margin: EdgeInsets.zero,
    );

    state = const AsyncValue.data(null);
  }
  Future<void> onVerifyTap(BuildContext context) async {
    state = const AsyncLoading();
    _isSubmit = true;
    
    if (validate(phoneotpcontroller.text) == null &&
        validate(emailotpcontroller.text) == null) {
      _isLoading = true;

      
      _verifyResponse = await ref.read(otpServiceProvider).verifyOtp(
          authtoken: authToken,
          phoneNumber: phoneController.text,
          email: emailIdController.text,
          phoneOtp: phoneotpcontroller.text,
          emailOtp: emailotpcontroller.text);

      
      if (_verifyResponse?["error"] != null) {
        DialogServiceV1().showSnackBar(
            content: "${_verifyResponse?["error"]}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      } else if (_verifyResponse?["data"] != null && _verifyResponse?["data"] == true) {
        DialogServiceV1().showSnackBar(
            content: "Email and phone number is verified successfully",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
        Navigator.pushAndRemoveUntil(
            Globals.navigatorKey.currentContext!,
            PageTransition(
                child: AfterBottomBar(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 400)),
                (Route<dynamic> route) => false);
        // if (isFromRegister) {
        //   Navigator.push(
        //     Globals.navigatorKey.currentContext!,
        //     PageTransition(
        //         child:
        //         MyAccountScreen(frromRegister: true),
        //         type: PageTransitionType.fade,
        //         duration:
        //         const Duration(milliseconds: 200)),
        //   );
        // }
      } else {
        DialogServiceV1().showSnackBar(
            content: "Registration Failed due to ${_verifyResponse?["message"]?? "Server error Occurred"}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }
}


