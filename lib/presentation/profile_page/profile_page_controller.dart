import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/data/subscribed%20user/subscribed_repo.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/personal_detail/personal_details_service.dart';

part 'profile_page_controller.g.dart';

@riverpod
class ProfilePageScreenController extends _$ProfilePageScreenController {
  TextEditingController profileScreenController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _userName = "Username Not Set";
  String authToken = "";
  String get userName => _userName;
  String _imgUrl = '';
  List<Map<String, dynamic>> _planDetails = [];
  List<Map<String, dynamic>> get planDetails => _planDetails;
  String get imgUrl => _imgUrl;
  String _imgName = '';
  Map<String, dynamic>? myPlanData;
  String _notSubscribed = '';
  String get notSubscribed => _notSubscribed;
  String _validity = '';
  String get validity => _validity;
  String _planName = '';
  String get planName => _planName;
  String get imgName => _imgName;
  String _userId = "UserID Not Found";
  String get userId => _userId;
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    // await Future.delayed(Duration(seconds: 2));
    await PreferenceManagerUtils.getToken().then((token) {
      authToken = token;
    });
    await getPersonalDetailsData();
    await getMyPlan();

    _isLoading = false;
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

  Future<void> getMyPlan() async {
    state = const AsyncLoading();

    myPlanData = await ref
        .read(userSubscribedRepositoryProvider)
        .getUserSubscriptionloging(authtoken: authToken);
    if (myPlanData != null) {
      if (myPlanData?["data"] != null) {
        if (myPlanData?["data"]["currentSubscription"] != null) {
          if (myPlanData?["data"]?["currentSubscription"]?["name"] != null &&
              myPlanData?["data"]["currentSubscription"]?["name"] != '')
            _planDetails.add({
              'Name':
                  myPlanData!["data"]["currentSubscription"]["name"].toString(),
            });
          _planName =
              myPlanData!["data"]["currentSubscription"]["name"].toString();
          if (myPlanData?["data"]["currentSubscription"]["interest"] != null &&
              myPlanData?["data"]["currentSubscription"]["interest"] != '')
            _planDetails.add({
              'Interest Quota': myPlanData!["data"]["currentSubscription"]
                      ["interest"]
                  .toString(),
            });

          if (myPlanData?["data"]["currentSubscription"]["view"] != null &&
              myPlanData?["data"]["currentSubscription"]["view"] != '')
            _planDetails.add({
              'Views Quota':
                  myPlanData!["data"]["currentSubscription"]["view"].toString(),
            });
          if (myPlanData?["data"]["currentSubscription"]["price"] != null &&
              myPlanData?["data"]["currentSubscription"]["price"] != '')
            _planDetails.add({
              'Price': myPlanData!["data"]["currentSubscription"]["price"]
                  .toString(),
            });
          if (myPlanData?["data"]["addOnInterestLeft"] != null &&
              myPlanData?["data"]["addOnInterestLeft"] != '')
            _planDetails.add({
              'Interest Left':
                  myPlanData!["data"]["addOnInterestLeft"].toString(),
            });
          if (myPlanData?["data"]["addOnViewLeft"] != null &&
              myPlanData?["data"]["addOnViewLeft"] != '')
            _planDetails.add({
              'Views Left': myPlanData!["data"]["addOnViewLeft"].toString(),
            });
          final dateFormatter = DateFormat("dd days");
          if (myPlanData?["data"]["subscriptionEndTime"] != null &&
              myPlanData?["data"]["subscriptionEndTime"] != '') {
            // int days = (DateTime.parse("2024-04-16T06:53:06.894Z").difference(DateTime.now()).inDays);
            int days =
                (DateTime.parse(myPlanData!["data"]["subscriptionEndTime"])
                    .difference(DateTime.now())
                    .inDays);
            int month = (days / 30).toInt();
            int remainingdays =
                (((days / 30) - (days / 30).toInt()) * 30).toInt();
            _planDetails.add({
              'Validity':
                  "${month != 0 ? "${month} month " : ""}${remainingdays != 0 ? "${remainingdays} days " : ""}"
                      .toString(),
            });
            _validity =
                "${month != 0 ? "${month} month " : ""}${remainingdays != 0 ? "${remainingdays} days " : ""}"
                    .toString();
          }
        }
      }
    } else {
      _notSubscribed = myPlanData?["error"] ?? "";
    }
    state = const AsyncValue.data(null);
  }

  onLogOut() {
    ref.read(accountServiceProvider).logOut(authtoken: authToken);
    PreferenceManagerUtils.clearPreference();
  }

  Future<void> getPersonalDetailsData() async {
    state = const AsyncLoading();
    await PreferenceManagerUtils.getProfileId().then((value) async {
      _userId = value ?? "Not Found";
    });
    await PreferenceManagerUtils.getUserName().then((value) async {
      _userName = value;
    });

    Map<String, dynamic>? persData = await ref
        .read(personalDetailsServiceProvider)
        .getPersDetailByLoginAccount(authtoken: authToken);
    if (persData != null) {
      if (persData["data"] != null) {
        if (persData["data"]["name"] != null &&
            persData["data"]["name"].isNotEmpty)
          _userName = (persData["data"]["name"] ?? "").toString();

        if (persData["data"]["profileImage"]["path"] != null) {
          _imgUrl = persData["data"]["profileImage"]["path"];
          _imgName = persData["data"]["profileImage"]["imageName"];
        }
      }
    }

    state = const AsyncValue.data(null);
  }
}
