import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/otp/otp_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/forget_password/verify_otp/verify_otp.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/validate/validate.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';

part 'forget_password_controller.g.dart';

@riverpod
class ForgetPasswordController extends _$ForgetPasswordController {
  TextEditingController emailidController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  String authToken = "";

  Map<String, dynamic>? _createForgetPasswordOtpResponse;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> onSubmitTap(BuildContext context) async {
    state = const AsyncLoading();
    _isSubmit = true;

    if (validateEmail(emailidController.text) == null) {
      _isLoading = true;

      _createForgetPasswordOtpResponse = await ref
          .read(otpServiceProvider)
          .createForgetPasswordOtp(email: emailidController.text);

      if (_createForgetPasswordOtpResponse?["data"] != null) {
        if (_createForgetPasswordOtpResponse?["data"]["message"] != null) {
          DialogServiceV1().showSnackBar(
              content:
                  "${_createForgetPasswordOtpResponse?["data"]["message"] ?? "success"}",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          if (_createForgetPasswordOtpResponse?["data"]["message"] ==
              "OTP Sent") {
            commonNavigator(
                context: context,
                child: VerifyOtp(email: emailidController.text),
                type: PageTransitionType.fade);
          }
        }
      } else {
        DialogServiceV1().showSnackBar(
            content:
                "Forget Password Failed due to ${_createForgetPasswordOtpResponse?["error"] ?? "Unknown"}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }
}
