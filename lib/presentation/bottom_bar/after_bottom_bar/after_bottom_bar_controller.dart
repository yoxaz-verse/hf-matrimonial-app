import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/utils/color.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';

part 'after_bottom_bar_controller.g.dart';

@riverpod
class AfterBottomBarController extends _$AfterBottomBarController {
  String authToken = "";

  @override
  FutureOr<void> build({startIndex=0}) async {
    state = const AsyncLoading();
    selectedIndex = startIndex;
    onItemTapped(startIndex);
    PreferenceManagerUtils.getToken().then((authtoken) {
      authToken = authtoken;
    });
    state = const AsyncValue.data(null);
  }

  getAccountDetails() async {
    state = const AsyncLoading();
   await  PreferenceManagerUtils.getToken().then((authtoken) {
      authToken = authtoken;
    });
    try {
      Map<String, dynamic>? accountDetails = await ref
          .read(accountServiceProvider)
          .getAccountDetails(authtoken: authToken);

            Map<String, dynamic>? accountDetails1 = await ref
          .read(accountServiceProvider)
          .getAllAccountDetailsByLogin(authtoken: authToken);

      if (accountDetails != null && accountDetails["data"] != null) {

        if( accountDetails["data"]["accountId"]["isAccountDetailCompleted"] == false) {

          PreferenceManagerUtils.setIsProfileComplete(
              (accountDetails1?["data"]["isFamilyDetailCompleted"] &&
                  accountDetails1?["data"]["isPersonalDetailCompleted"] &&
                  accountDetails1?["data"]["isRECDetailCompleted"] &&
                  accountDetails1?["data"]["isPreferenceDetailCompleted"]));


    }else{
          PreferenceManagerUtils.setIsProfileComplete(
              accountDetails?["data"]["accountId"]["isAccountDetailCompleted"]);
        }
            // accountDetails["data"]["accountId"]["isAccountDetailCompleted"]);
        PreferenceManagerUtils.setIsSubscribed(
            accountDetails["data"]["accountId"]["isSubscribed"]??false);
        PreferenceManagerUtils.setIsPhoneVerified(
            accountDetails["data"]["accountId"]["isPhoneVerified"]??false);
        PreferenceManagerUtils.setIsEmailVerified(
            accountDetails["data"]["accountId"]["isEmailVerified"]??false);
        PreferenceManagerUtils.setIsProfileVerified(
            accountDetails["data"]["accountId"]?["isVerified"]??false);
        PreferenceManagerUtils.setViewsRemaining(
            accountDetails["data"]["addOnInterestLeft"]);
        PreferenceManagerUtils.setRequestsRemaining(
            accountDetails["data"]["addOnViewLeft"]);
      } else {
        // DialogServiceV1().showSnackBar(
        //     content: "Server error Occurred",
        //     color: AppColors.colorPrimary.withOpacity(0.7),
        //     textclr: AppColors.white);
      }
    } catch (e, s) {
      
    }

    state = const AsyncValue.data(null);
  }

  int selectedIndex = 0;
  PageController? pageController;

  List<String> listOfIcons = [
    AppImg.b1,
    AppImg.bottom2_2,
    AppImg.bottom2_3,
    AppImg.bottom2_4,
  ];
  void onItemTapped(int index) {
    state = const AsyncLoading();
    selectedIndex = index;
    state = const AsyncValue.data(null);
  }
}
