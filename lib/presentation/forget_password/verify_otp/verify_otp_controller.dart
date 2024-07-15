import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../application/dialog/dialog_service.dart';
import '../../../application/otp/otp_service.dart';
import '../../../application/validate/validate.dart';
import '../../../utils/color.dart';
import '../../login page/login_page.dart';

part 'verify_otp_controller.g.dart';

@riverpod
class VerifyOtpController extends _$VerifyOtpController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController emailotpcontroller = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isOTPVerified = false;
  bool get isOTPVerified => _isOTPVerified;
  PinTheme? isPinTheme;
  bool _isLoading = false;
  String authToken = "";
  bool get isLoading => _isLoading;
  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  Map<String, dynamic>? _verifyResponse;

  @override
  FutureOr<void> build({email}) async {
    state = const AsyncLoading();
    emailIdController.text = email;
    PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
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
    if (validate(emailotpcontroller.text) == null) {
      _isLoading = true;
      _verifyResponse =
          await ref.read(otpServiceProvider).verifyForgetPasswordOtp(

                phoneNumber: "",
                email: emailIdController.text,
                phoneOtp: "",
                emailOtp: emailotpcontroller.text,
              );
      print("sedkjjfhseh :::; ${_verifyResponse}");
      if (_verifyResponse?["error"] != null) {
        DialogServiceV1().showSnackBar(
            content: "${_verifyResponse?["error"]}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      } else if (_verifyResponse?["data"] != null &&
          _verifyResponse?["data"] == true) {
        _isOTPVerified = true;
        _isSubmit = false;
        DialogServiceV1().showSnackBar(
            content: "OTP is verified successfully",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
        // Navigator.pushAndRemoveUntil(
        //     Globals.navigatorKey.currentContext!,
        //     PageTransition(
        //         child: AfterBottomBar(),
        //         type: PageTransitionType.fade,
        //         duration: const Duration(milliseconds: 400)),
        //     (Route<dynamic> route) => false);
      } else {
        DialogServiceV1().showSnackBar(
            content:
                "OTP verification Failed due to ${_verifyResponse?["message"] ?? _verifyResponse?["error"] ?? "Server Error Please try again"}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
    }
    state = const AsyncValue.data(null);
  }
  Future<void> onDoneTap() async {
    state = const AsyncLoading();
    _isLoading = true;
    Map<String, dynamic>? forgetPasswordResponse = await ref
        .read(accountServiceProvider)
        .forgetPassword(
            email: emailIdController.text,
            password: newPasswordController.text,
            authtoken: "");

    if (forgetPasswordResponse != null) {
      DialogServiceV1().showSnackBar(
          content: "Password reset Successfully",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
      Navigator.pushAndRemoveUntil(
          Globals.navigatorKey.currentContext!,
          PageTransition(
              child: const LoginPage(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 400)),
          (Route<dynamic> route) => false);
    } else {
      DialogServiceV1().showSnackBar(
          content:
              "${forgetPasswordResponse?["error"] ?? "Password reset Failed"}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    }
    _isLoading = false;
    state = const AsyncValue.data(null);
  }
}
