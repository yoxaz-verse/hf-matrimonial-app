import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/interest/interest_service.dart';
import '../../data/shared_pref/shared_pref.dart';
import '../../utils/color.dart';
import '../../utils/text.dart';

part 'send_interest_reason_controller.g.dart';

@riverpod
class sendInterestController extends _$sendInterestController {
  // final List<String> reasons = [AppText.iam, AppText.you, AppText.our];
  // final Set<String> _selectedReasons = {};

  final List<String> reasons = [AppText.iam, AppText.you, AppText.our];
  final Set<String> _selectedReasons = {""};

  String get selectedReason =>
      _selectedReasons.isNotEmpty ? _selectedReasons.first : "";
  String _selectReason="";

  String get selectReason=>_selectReason;
  String authToken = "";

  Map<String, dynamic>? sendIntrestDetailsResponse;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _accountId = "";

  String get accountId => _accountId;
  int _selectedmethod = 0;

  int get selectedmethod => _selectedmethod;

  @override
  FutureOr<void> build({accountId}) async {
    state = const AsyncLoading();
    _isLoading = true;
    _accountId = accountId;
    // await Future.delayed(Duration(seconds: 2));
    PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });

    state = const AsyncValue.data(null);
  }

  bool isSelected(String reason) {
    return _selectedReasons.contains(reason);
  }

  void toggleSelected(String reason) {
    state = const AsyncLoading();

    if (_selectedReasons.contains(reason)) {
      _selectedReasons.remove(reason);
    } else {
      _selectedReasons.add(reason);
    }
    _selectReason = reason;
    

    // Notify listeners of state change
    state = const AsyncValue.data(null);

  }


  onPaymentval(val) {
    state = const AsyncLoading();
    _selectedmethod = val;
    state = const AsyncValue.data(null);
  }

  void onCreateSendInterestDetail({afterCallback}) async {
    
    if (_selectReason!="") {

      sendIntrestDetailsResponse =
      await ref.read(interestServiceProvider).createInterest(
        authtoken: authToken,
        reason: _selectReason,
        receiverId: _accountId, //change
      );
      try {
        if (sendIntrestDetailsResponse != null) {
          
          if (sendIntrestDetailsResponse!["success"] == true) {
            ref.read(dialogServiceProvider).showSnackBar(
                content: 'Interest send successfully!!',
                color: AppColors.yellow.withOpacity(0.9),
                textclr: AppColors.black);
            await afterCallback();
            Navigator.of(Globals.navigatorKey.currentContext!).pop();

          } else {
            ref.read(dialogServiceProvider).showSnackBar(
                content: sendIntrestDetailsResponse!["error"].toString(),
                color: AppColors.yellow.withOpacity(0.9),
                textclr: AppColors.black);
          }
        }
      } catch (e) {
        ref.read(dialogServiceProvider).showSnackBar(
            content: e.toString(),
            color: AppColors.yellow.withOpacity(0.9),
            textclr: AppColors.black);
        throw Exception("Exception is =-=-1 $e");
      }
    } else {
      ref.read(dialogServiceProvider).showSnackBar(
          content: "Please select a reson!",
          color: AppColors.yellow.withOpacity(0.9),
          textclr: AppColors.black);
    }
  }
}