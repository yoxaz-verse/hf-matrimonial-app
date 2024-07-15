import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/otp/otp_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/Registration%20otp/registration_otp.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/validate/validate.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';

part 'registration_moblie_controller.g.dart';

@riverpod
class RegistrationMoblieController extends _$RegistrationMoblieController {
  TextEditingController emailidController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  String authToken = "";

  Map<String, dynamic>? _createOtpResponse;
  Map<String, dynamic>? _createEmailOtpResponse;

  @override
  FutureOr<void> build(
      {required String phoneNo,
      required String email,
      required bool fromRegister}) async {
    state = const AsyncLoading();
    _isLoading = true;
    emailidController.text = email;
    phoneController.text = phoneNo;
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

    if (validatePhone(phoneController.text) == null &&
        validateEmail(emailidController.text) == null) {
      _isLoading = true;
      _createOtpResponse = await ref.read(otpServiceProvider).createOtp(
            authtoken: authToken,
            phoneNumber: phoneController.text,
            email: '',
          );
      _createEmailOtpResponse = await ref.read(otpServiceProvider).createOtp(
            authtoken: authToken,
            phoneNumber: '',
            email: emailidController.text,
          );

      if (_createOtpResponse?["data"] != null &&
          _createEmailOtpResponse?["data"] != null) {
        if (_createOtpResponse?["data"]["message"] != null &&
            _createEmailOtpResponse?["data"]["message"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${_createOtpResponse?["data"]["message"] ?? "success"}" ??
                  "${_createEmailOtpResponse?["data"]["message"] ?? "success"}",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          if (_createOtpResponse?["data"]["message"] == "OTP Sent" &&
              _createEmailOtpResponse?["data"]["message"] == "OTP Sent") {
            commonNavigator(
                context: context,
                child: RegistrationOtp(
                    email: emailidController.text,
                    phoneNo: phoneController.text),
                type: PageTransitionType.fade);
          }
        }
      } else {
        DialogServiceV1().showSnackBar(
            content:
                "Registration Failed due to ${_createOtpResponse?["error"] ?? _createEmailOtpResponse?["error"]}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }
}
