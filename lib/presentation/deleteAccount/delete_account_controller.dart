import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/before_bottom_bar.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';
import '../../utils/text.dart';

part 'delete_account_controller.g.dart';

@riverpod
class deleteAccountController extends _$deleteAccountController {



  TextEditingController otherReasonController = TextEditingController();


  final List<String> reasons = [
    AppText.not,
    AppText.lifePartner,
    AppText.oreason
  ];
  final Set<String> _selectedReasons = {};

  bool _isLoading= false;
  bool get isLoading => _isLoading;

  int _selectedmethod = 0;
  int get selectedmethod => _selectedmethod;
  String authToken = "";
  @override

  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    // await Future.delayed(Duration(seconds:2));
    _isLoading=false;
    state = const AsyncValue.data(null);
  }

  bool isSelected(String reason) {
    return _selectedReasons.contains(reason);
  }

  void toggleSelected(String reason) {
    if (_selectedReasons.contains(reason)) {
      _selectedReasons.remove(reason);
    } else {
      _selectedReasons.add(reason);
    }
    state = AsyncData(_selectedReasons);
  }

  onDeleteTap() async {
    state = const AsyncLoading();
    Map<String,dynamic>? deleteResponse = await ref.read(accountServiceProvider).deleteAccount(authtoken: authToken);
    if(deleteResponse?["data"]!=null){
          DialogServiceV1().showSnackBar(
              content: "Account Deleted SuccessFully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          ref
              .read(dialogServiceProvider)
              .checkMail();
          PreferenceManagerUtils
              .clearPreference();
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              MaterialPageRoute(
                  builder: (context) {
                    return BeforeBottomBar();
                  }), (route) => false);

    }else{
      DialogServiceV1().showSnackBar(
          content: "Account Deleted SuccessFully",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
      ref
          .read(dialogServiceProvider)
          .checkMail();
      PreferenceManagerUtils
          .clearPreference();
      Navigator.pushAndRemoveUntil(
          Globals.navigatorKey.currentContext!,
          MaterialPageRoute(
              builder: (context) {
                return BeforeBottomBar();
              }), (route) => false);
    }
    state = const AsyncValue.data(null);
  }

  onPaymentval(val) {
    state = const AsyncLoading();
    _selectedmethod = val;
    state = const AsyncValue.data(null);
  }

}
