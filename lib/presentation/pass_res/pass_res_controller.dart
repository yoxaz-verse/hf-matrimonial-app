import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';

part 'pass_res_controller.g.dart';

@riverpod
class PasswordResScreenController extends _$PasswordResScreenController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _authToken = '';

  String get authToken => _authToken;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    PreferenceManagerUtils.getToken().then((token) {
      _authToken = token;
    });
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;

    state = const AsyncValue.data(null);
  }

  Future<void> onDoneTap() async {
    Map<String, dynamic>? resetPasswordResponse =
        await ref.read(accountServiceProvider).updatePassword(
              email: emailIdController.text,
              newpassword: newPasswordController.text,
              password: currentPasswordController.text,
              authtoken: authToken,
            );
    if (resetPasswordResponse?["data"] != null) {
      DialogServiceV1().showSnackBar(
          content: "Password Reset Successfully!!!",
          color: AppColors.black,
          textclr: AppColors.white);
      Navigator.pop(Globals.navigatorKey.currentContext!);
    } else if (resetPasswordResponse?["error"] != null) {
    } else {
      DialogServiceV1().showSnackBar(
          content: "Something went wrong...!",
          color: AppColors.red,
          textclr: AppColors.white);
    }
  }
}
