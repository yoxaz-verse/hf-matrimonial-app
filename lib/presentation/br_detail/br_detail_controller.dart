import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/application/dropdown/dropdown_service.dart';
import 'package:heavenlymatrimony/application/home_screen/home_screen_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';
import 'package:heavenlymatrimony/presentation/bride/b_fullDetails/bride_Full_Details.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../myplan/myplan.dart';

part 'br_detail_controller.g.dart';

@riverpod
class BrDetailController extends _$BrDetailController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isNewDataLoading = false;
  bool get isNewDataLoading => _isNewDataLoading;
  String _lastKey = "undefined";
  String get lastKey => _lastKey;
  int _interest = 0;
  int _limit = 10;
  int get interest => _interest;
  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  bool _pageEnd = false;
  bool get pageEnd => _pageEnd;
  bool _canShowLoader = true;
  bool get canShowLoader => _canShowLoader;

  ///============================================================================ data used  in search API
  TextEditingController searchNameController = TextEditingController();
  TextEditingController profileIdController = TextEditingController();
  //work Location
  List<String> _workLocationList = [];
  List<String> get getWorkLocationList => _workLocationList;
  List<String> _ageList = ["10", "20", "30", "40", "50", "60", "70", "80"];
  List<String> get getAgeList => _ageList;
  String _selectAge = AppText.age;
  String get selectAge => _selectAge;

  ///============================================================================ data used  in search API
  String _selectWorkLocation = AppText.jobArea;
  String get getWorkLocation => _selectWorkLocation;
  String authToken = "";
  List<dynamic> _userCardsDataList = [];
  List<dynamic> get userCardsList => _userCardsDataList;
  final ScrollController scrollController = ScrollController();

  ///============================================================================ selectors
  bool _isSearchOn = false;
  bool get isSearchOn => _isSearchOn;
  bool _isNewMatchesOn = false;
  bool get isNewMatchesOn => _isNewMatchesOn;
  bool _isMatchingMembersOn = false;
  bool get isMatchingMembersOn => _isMatchingMembersOn;

  ///============================================================================ selectors
  _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      // pageNumber = pageNumber + 1;
      if (pageEnd == false) {
        getUserCardsDataByVariableCombinedByPagination();
      } else {
        DialogServiceV1().showSnackBar(
            content: "No more data",
            color: AppColors.black,
            textclr: AppColors.white);
      }
    }
  }

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    scrollController.addListener(_scrollListener);
    _isMatchingMembersOn = true;
    // await getUserCardsData();
    // await getUserCardsData();
    _lastKey = "undefined";

    // ref
    //     .read(afterBottomBarControllerProvider(startIndex: 0).notifier)
    //     .getAccountDetails();
    await getAccountDetails();
    await getUserCardsDataByVariableCombined();
    await getWorkLocationDropDown();
    // await getInterest();

    // onCardTap();
    // await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    state = const AsyncValue.data(null);
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushAndRemoveUntil(
    //       Globals.navigatorKey.currentContext!,
    //       PageTransition(
    //           child: AfterBottomBar(),
    //           type: PageTransitionType.fade,
    //           duration: const Duration(milliseconds: 400)),
    //
    //           (Route<dynamic> route) => false);
    //
    // });
  }

  // getUserCardsData() async {
  //   state = const AsyncLoading();
  //   _userCardsDataList.clear();
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     // Map<String, dynamic>? _userCardsData =
  //     //     await generateStaticData(count: 10, type: "ALl data");
  //     Map<String, dynamic>? _userCardsData = await ref
  //         .read(homeServiceProvider)
  //         .getAllUserCardsData(authtoken: authToken, page: 1, limit: 10);
  //     if (_userCardsData != null && _userCardsData["data"] != null) {
  //       if (_userCardsData["data"]["details"].isNotEmpty) {
  //         _userCardsData["data"]["details"].forEach((item) {
  //           _userCardsDataList.add(item);
  //         });
  //         // _userCardsDataList = _userCardsData["data"]["details"];
  //       } else {
  //         DialogServiceV1().showSnackBar(
  //             content: "All data loaded",
  //             color: AppColors.red.withOpacity(0.7),
  //             textclr: AppColors.white);
  //       }
  //     } else if (_userCardsData != null && _userCardsData["error"] != null) {
  //       DialogServiceV1().showSnackBar(
  //           content: "${_userCardsData["error"] ?? "Server error"}",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     } else {
  //       DialogServiceV1().showSnackBar(
  //           content: "Server error occurred.",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //
  //   state = const AsyncValue.data(null);
  // }

  // getUserCardsDataOfNewMatches() async {
  //   state = const AsyncLoading();
  //   _userCardsDataList.clear();
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     // Map<String, dynamic>? _userCardsData =
  //     //     await generateStaticData(count: 10);
  //     Map<String, dynamic>? _userCardsData = await ref
  //         .read(homeServiceProvider)
  //         .getAllUserCardsDataOfNewMatches(authtoken: authToken, page: 1, limit: 10);
  //     if (_userCardsData != null && _userCardsData["data"] != null) {
  //       if (_userCardsData["data"]["details"].isNotEmpty) {
  //         _userCardsData["data"]["details"].forEach((item) {
  //           _userCardsDataList.add(item);
  //         });
  //         // _userCardsDataList = _userCardsData["data"]["details"];
  //       }
  //
  //     } else if (_userCardsData != null && _userCardsData["error"] != null) {
  //       DialogServiceV1().showSnackBar(
  //           content: "${_userCardsData["error"] ?? "Server error"}",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //
  //     } else {
  //       DialogServiceV1().showSnackBar(
  //           content: "Server error occurred.",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //
  //   state = const AsyncValue.data(null);
  // }

  // getUserCardsDataByPagination() async {
  //   state = const AsyncLoading();
  //   _isNewDataLoading = true;
  //
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     _pageNo = _pageNo + 1;
  //     // Map<String, dynamic>? _userCardsData =
  //     //     await generateStaticData(type: "pagination", count: 10, pageLimit: 5);
  //     Map<String, dynamic>? _userCardsData = await ref
  //         .read(homeServiceProvider)
  //         .getAllUserCardsData(authtoken: authToken, page: _pageNo, limit: 10);
  //     if (_userCardsData != null && _userCardsData["data"] != null) {
  //       if ((_userCardsData["data"]?["details"].isNotEmpty) ?? false) {
  //         _userCardsData["data"]["details"].forEach((item) {
  //           _userCardsDataList.add(item);
  //         });
  //         // _userCardsDataList = _userCardsData["data"]["details"];
  //       } else {
  //         DialogServiceV1().showSnackBar(
  //             content: "No More Data Found",
  //             color: AppColors.red.withOpacity(0.7),
  //             textclr: AppColors.white);
  //       }
  //
  //     } else if (_userCardsData != null && _userCardsData["error"] != null) {
  //       DialogServiceV1().showSnackBar(
  //           content: "${_userCardsData["error"] ?? "Server error"}",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //
  //     } else {
  //       DialogServiceV1().showSnackBar(
  //           content: "Server error occurred.",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //   _isNewDataLoading = false;
  //
  //   state = const AsyncValue.data(null);
  // }
  //
  // getUserCardsDataBySearch() async {
  //   state = const AsyncLoading();
  //   _userCardsDataList.clear();
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     Map<String, dynamic>? _userCardsData = await ref
  //         .read(homeServiceProvider)
  //         .getAllUserCardsDataBySearch(
  //             authtoken: authToken,
  //             accountId: '',
  //             minAge: _selectAge,
  //             maxAge: '',
  //             minHeight: '',
  //             maxHeight: '',
  //             gender: '',
  //             martialStatus: '',
  //             religion: '',
  //             education: '',
  //             occupation: '',
  //             employedIn: '',
  //             country: _selectWorkLocation,
  //             state: '',
  //             profileId: profileIdController.text,
  //             page: _pageNo,
  //             limit: 10,
  //             name: searchNameController.text);
  //     if (_userCardsData != null && _userCardsData["data"] != null) {
  //       if (_userCardsData["data"]["details"].isNotEmpty) {
  //         _userCardsData["data"]["details"].forEach((item) {
  //           _userCardsDataList.add(item);
  //         });
  //         // _userCardsDataList = _userCardsData["data"]["details"];
  //       }
  //
  //     } else if (_userCardsData != null && _userCardsData["error"] != null) {
  //       DialogServiceV1().showSnackBar(
  //           content: "${_userCardsData["error"] ?? "Server error"}",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //
  //     } else {
  //       DialogServiceV1().showSnackBar(
  //           content: "Server error occurred please try again in some time...",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //
  //   state = const AsyncValue.data(null);
  // }

  // getUserCardsDataBySearchByPagination() async {
  //   state = const AsyncLoading();
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     Map<String, dynamic>? _userCardsData;
  //     _pageNo = _pageNo + 1;
  //     _userCardsData = await ref
  //         .read(homeServiceProvider)
  //         .getAllUserCardsDataBySearch(
  //             authtoken: authToken,
  //             accountId: '',
  //             minAge: _selectAge,
  //             maxAge: '',
  //             minHeight: '',
  //             maxHeight: '',
  //             gender: '',
  //             martialStatus: '',
  //             religion: '',
  //             education: '',
  //             occupation: '',
  //             employedIn: '',
  //             country: _selectWorkLocation,
  //             state: '',
  //             profileId: profileIdController.text,
  //             page: _pageNo,
  //             limit: 10,
  //             name: searchNameController.text);
  //     if (_userCardsData != null && _userCardsData["data"] != null) {
  //       if (_userCardsData["data"]["details"].isNotEmpty) {
  //         _userCardsData["data"]["details"].forEach((item) {
  //           _userCardsDataList.add(item);
  //         });
  //         // _userCardsDataList = _userCardsData["data"]["details"];
  //       }
  //
  //
  //     } else if (_userCardsData != null && _userCardsData["error"] != null) {
  //       DialogServiceV1().showSnackBar(
  //           content: "${_userCardsData["error"] ?? "Server error"}",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //
  //     } else {
  //       DialogServiceV1().showSnackBar(
  //           content: "Server error occurred please try again in some time...",
  //           color: AppColors.red.withOpacity(0.7),
  //           textclr: AppColors.white);
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //
  //   state = const AsyncValue.data(null);
  // }
  getAccountDetails() async {
    state = const AsyncLoading();
    await PreferenceManagerUtils.getToken().then((authtoken) {
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
        if (accountDetails["data"]["accountId"]["isAccountDetailCompleted"] ==
            false) {
          PreferenceManagerUtils.setIsProfileComplete((accountDetails1?["data"]
                  ["isFamilyDetailCompleted"] &&
              accountDetails1?["data"]["isPersonalDetailCompleted"] &&
              accountDetails1?["data"]["isRECDetailCompleted"] &&
              accountDetails1?["data"]["isPreferenceDetailCompleted"]));
        } else {
          PreferenceManagerUtils.setIsProfileComplete(
              accountDetails?["data"]["accountId"]["isAccountDetailCompleted"]);
        }
        // accountDetails["data"]["accountId"]["isAccountDetailCompleted"]);
        PreferenceManagerUtils.setIsSubscribed(
            accountDetails["data"]["accountId"]["isSubscribed"]);
        PreferenceManagerUtils.setIsPhoneVerified(
            accountDetails["data"]["accountId"]["isPhoneVerified"]);
        PreferenceManagerUtils.setIsEmailVerified(
            accountDetails["data"]["accountId"]["isEmailVerified"]);
        PreferenceManagerUtils.setIsProfileVerified(
            accountDetails["data"]["accountId"]?["isVerified"] ?? false);
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
    } catch (e, s) {}

    state = const AsyncValue.data(null);
  }

  getUserCardsDataByVariableCombined() async {
    state = const AsyncLoading();
    _userCardsDataList.clear();

    await PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    try {
      Map<String, dynamic>? _userCardsData;
      // ref
      //     .read(afterBottomBarControllerProvider(startIndex: 0).notifier)
      //     .getAccountDetails();
      getAccountDetails();
      if (_isSearchOn) {
        // _userCardsData =
        //     await generateStaticData(type: "Search", count: 10, pageLimit: 5);
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataBySearch(
                authtoken: authToken,
                accountId: '',
                minAge: _selectAge == AppText.age ? "" : _selectAge,
                maxAge: '',
                minHeight: '',
                maxHeight: '',
                gender: '',
                martialStatus: '',
                religion: '',
                education: '',
                occupation: '',
                employedIn: '',
                country: _selectWorkLocation == AppText.jobArea
                    ? ""
                    : _selectWorkLocation,
                state: '',
                profileId: profileIdController.text,
                lastKey: "undefined",
                limit: _limit,
                name: searchNameController.text);
      } else if (_isNewMatchesOn) {
        // _userCardsData = await generateStaticData(
        //     type: "New Matches", count: 10, pageLimit: 5);

        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataOfNewMatches(
                authtoken: authToken, lastKey: "undefined", limit: _limit);
      } else if (_isMatchingMembersOn) {
        print("mansi mansi here1");
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataOfingMembers(
                authtoken: authToken, lastKey: "undefined", limit: _limit);
// all details
        // _userCardsData = await ref
        //     .read(homeServiceProvider)
        //     .getAllUserCardsData(authtoken: authToken, page: 1, limit: 100);
        // _userCardsData = await generateStaticData(
        //     type: "Matching Members", count: 10, pageLimit: 5);
      } else {
        // _userCardsData = await generateStaticData(
        //     type: "ALL pagination", count: 10, pageLimit: 5);
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsData(
                authtoken: authToken, lastKey: "undefined", limit: _limit);
      }

      if (_userCardsData != null && _userCardsData["data"] != null) {
        if (_userCardsData["data"]["Detail"] != null) {
          if (_userCardsData["data"]["Detail"]?.isNotEmpty) {
            _userCardsData["data"]["Detail"].forEach((item) {
              _userCardsDataList.add(item);
            });
            // _userCardsDataList = _userCardsData["data"]["details"];
          }
        } else if (_userCardsData["data"]["details"] != null) {
          if (_userCardsData["data"]["details"].isNotEmpty) {
            _userCardsData["data"]["details"].forEach((item) {
              _userCardsDataList.add(item);
            });
            // _userCardsDataList = _userCardsData["data"]["details"];
          }
        }
        print("usukjebfjkse ::: ${_userCardsData["data"]["lastKey"]["_id"]}");
        _lastKey = _userCardsData["data"]["lastKey"]["_id"] ?? "undefined";
        if (_userCardsData["data"]["lastKey"]["_id"] == null) {
          _pageEnd = true;
        } else {
          _pageEnd = false;
        }

        log("user card data of home screen ::::9: ${_userCardsDataList}");
      } else if (_userCardsData != null && _userCardsData["error"] != null) {
        DialogServiceV1().showSnackBar(
            content: "${_userCardsData["error"] ?? "Server error"}",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      } else {
        DialogServiceV1().showSnackBar(
            content: "Server error please try again after some time...",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      }
    } catch (e, s) {
      DialogServiceV1().showSnackBar(
          content: "Server error $e",
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
    }

    state = const AsyncValue.data(null);
  }

  getUserCardsDataByVariableCombinedByPagination() async {
    state = const AsyncLoading();
    _isNewDataLoading = true;
    await PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    try {
      Map<String, dynamic>? _userCardsData;
      if (_isSearchOn) {
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataBySearch(
                authtoken: authToken,
                accountId: '',
                minAge: _selectAge == AppText.age ? "" : _selectAge,
                maxAge: '',
                minHeight: '',
                maxHeight: '',
                gender: '',
                martialStatus: '',
                religion: '',
                education: '',
                occupation: '',
                employedIn: '',
                country: _selectWorkLocation == AppText.jobArea
                    ? ""
                    : _selectWorkLocation,
                state: '',
                profileId: profileIdController.text,
                lastKey: _lastKey,
                limit: _limit,
                name: searchNameController.text);
      } else if (_isNewMatchesOn) {
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataOfNewMatches(
                authtoken: authToken, lastKey: _lastKey, limit: _limit);
      } else if (_isMatchingMembersOn) {
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsDataOfingMembers(
                authtoken: authToken, lastKey: _lastKey, limit: _limit);
      } else {
        _userCardsData = await ref
            .read(homeServiceProvider)
            .getAllUserCardsData(
                authtoken: authToken, lastKey: _lastKey, limit: _limit);
      }
      if (_userCardsData != null && _userCardsData["data"] != null) {
        if (_userCardsData["data"]["Detail"] != null) {
          if (_userCardsData["data"]["Detail"]?.isNotEmpty) {
            _userCardsData["data"]["Detail"].forEach((item) {
              _userCardsDataList.add(item);
            });
            // _userCardsDataList = _userCardsData["data"]["details"];
          }
        } else if (_userCardsData["data"]["details"] != null) {
          if (_userCardsData["data"]["details"].isNotEmpty) {
            _userCardsData["data"]["details"].forEach((item) {
              _userCardsDataList.add(item);
            });
            // _userCardsDataList = _userCardsData["data"]["details"];
          }
        }
        _lastKey = _userCardsData["data"]["lastKey"]["_id"] ?? "undefined";
        if (_userCardsData["data"]["lastKey"]["_id"] == null) {
          _pageEnd = true;
        } else {
          _pageEnd = false;
        }
      } else if (_userCardsData != null && _userCardsData["error"] != null) {
        DialogServiceV1().showSnackBar(
            content: "${_userCardsData["error"] ?? "Server error"}",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      } else {
        DialogServiceV1().showSnackBar(
            content: "Server error please try again after some time...",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      }
    } catch (e, s) {
      print("yyyukygghhuigyf :::: ${e} ${s}");
      DialogServiceV1().showSnackBar(
          content: "Server error $e",
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
    }
    _isNewDataLoading = false;

    state = const AsyncValue.data(null);
  }

  getInterest() async {
    state = const AsyncLoading();

    await PreferenceManagerUtils.getToken().then((authtoken) {
      authToken = authtoken;
    });
    try {
      Map<String, dynamic>? accountDetails = await ref
          .read(accountServiceProvider)
          .getAccountDetails(authtoken: authToken);

      if (accountDetails != null && accountDetails["data"] != null) {
        _interest = accountDetails["data"]["addOnViewLeft"] ?? 0;
      } else {
        DialogServiceV1().showSnackBar(
            content: "Server error Occurred",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
    } catch (e, s) {}
    state = const AsyncValue.data(null);
  }

  onCardTap({context, index}) async {
    // PreferenceManagerUtils.setIsProfileComplete(false); //
    // PreferenceManagerUtils.setIsSubscribed(false); //false
    // PreferenceManagerUtils.setViewsRemaining(0);
// if(_canShowLoader==true) {
// DialogServiceV1().loaderDialogue();
//     await ref
//         .read(afterBottomBarControllerProvider(startIndex: 0).notifier)
//         .getAccountDetails();
    // _canShowLoader = false;
// if (Globals.loaderKey.currentContext != null) {
//   Navigator.pop(Globals.loaderKey.currentContext!);
// }
// }else{
//     ref
//         .read(afterBottomBarControllerProvider(startIndex: 0).notifier)
//         .getAccountDetails();
    getAccountDetails();
    // }

    /// this code will used to check the flow of send request
    // PreferenceManagerUtils.setIsProfileComplete(true);
    // PreferenceManagerUtils.setIsSubscribed(true);
    // PreferenceManagerUtils.setViewsRemaining(5);

    PreferenceManagerUtils.getIsProfileComplete().then((isProfileCompleted) {
      PreferenceManagerUtils.getViewsRemaining().then((viewsRemaining) {
        PreferenceManagerUtils.getIsSubscribed().then((isSubscribed) {
          if (isProfileCompleted == false) {
            ref.read(dialogServiceProvider).singleButtonDialog(
                titleText: "Complete Your Profile",
                subtitleText:
                    "Complete your profile to let others know you. If you've already done so, please wait 2-3 days for admin verification.",
                onYesPressed: () {
                  Navigator.pop(context);
                  commonNavigator(
                      context: context,
                      child: MyAccountScreen(),
                      type: PageTransitionType.fade);
                },
                buttonText: 'Complete Profile');
          } else if (isSubscribed == false) {
            ref.read(dialogServiceProvider).singleButtonDialog(
                titleText: "Purchase Subscription",
                subtitleText:
                    "Explore our amazing plans and choose the one that's best for you!",
                onYesPressed: () {
                  Navigator.pop(context);
                  try {
                    ref
                        .read(afterBottomBarControllerProvider(startIndex: 0)
                            .notifier)
                        .onItemTapped(2);

                    // Navigator.pushAndRemoveUntil(
                    //     Globals.navigatorKey
                    //         .currentContext!,
                    //     PageTransition(
                    //         child: AfterBottomBar(
                    //             startIndex: 2),
                    //         type: PageTransitionType
                    //             .fade,
                    //         duration: const Duration(
                    //             milliseconds: 400)),
                    //         (Route<dynamic> route) =>
                    //     false);
                  } catch (e, s) {
                    print("sjhfbhae ::: ${e} $s");
                  }
                },
                buttonText: 'Plans and Pricing');
          } else if (viewsRemaining <= 0) {
            ref.read(dialogServiceProvider).singleButtonDialog(
                titleText: "Views Alert!",
                subtitleText:
                    "You have reached your view limit for the current plan. Please check your plan for more details.",
                onYesPressed: () {
                  Navigator.pop(context);
                  commonNavigator(
                      context: context,
                      child: MyPlanScreen(),
                      type: PageTransitionType.fade);
                },
                buttonText: 'Current Plan');
          } else {
            // PreferenceManagerUtils.setViewsRemaining(viewsRemaining - 1);

            commonNavigator(
                context: context,
                child: BrideDetails(
                  accountId: _userCardsDataList[index]["accountId"] ?? "",
                ),
                type: PageTransitionType.fade);
          }
        });
      });
    });
  }

  toggleSearch() async {
    state = const AsyncLoading();
    _isLoading = true;
    await getWorkLocationDropDown();

    if (_isSearchOn) {
      _isSearchOn = false;
      _isMatchingMembersOn = true;
    } else {
      clearFilters();
      _isSearchOn = true;
    }
    await getUserCardsDataByVariableCombined();
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  toggleNewMatches() async {
    state = const AsyncLoading();
    _isLoading = true;
    if (_isNewMatchesOn) {
      _isNewMatchesOn = false;
      _isMatchingMembersOn = true;
    } else {
      clearFilters();
      _isNewMatchesOn = true;
      // _isMatchingMembersOn = false;
    }
    await getUserCardsDataByVariableCombined();
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  toggleMatchingMembers() async {
    if (_isMatchingMembersOn) {
      // state = const AsyncLoading();
      //
      // _isLoading = true;
      // _isMatchingMembersOn = false;
      // // _isNewMatchesOn = true;
      // await getUserCardsDataByVariableCombined();
      // _isLoading = false;
      // state = const AsyncValue.data(null);
    } else {
      clearFilters();
      state = const AsyncLoading();
      _isLoading = true;
      _isMatchingMembersOn = true;
      // _isNewMatchesOn = false;
      await getUserCardsDataByVariableCombined();
      _isLoading = false;
      state = const AsyncValue.data(null);
    }
  }

  clearFilters() {
    _isSearchOn = false;
    _isNewMatchesOn = false;
    _isMatchingMembersOn = false;
    // _isMatchingMembersOn = true;
    _lastKey = "undefined";
    _pageEnd = false;
  }

  @override
  void changeAge({required val}) {
    state = const AsyncLoading();
    _selectAge = val;
    state = const AsyncValue.data(null);
  }

  Future<void> getWorkLocationDropDown() async {
    state = const AsyncLoading();

    // Map<String, dynamic>? workLocationData = {};
    Map<String, dynamic>? workLocationData = await ref
        .read(DropDownServiceProvider)
        .getallWorkLocation(authtoken: authToken);
    if (workLocationData != null) {
      if (workLocationData["data"] != null &&
          workLocationData['data']?["locations"] != null &&
          workLocationData['data']?["locations"].isNotEmpty) {
        for (var workLocationStatus
            in workLocationData['data']?["locations"] ?? []) {
          _workLocationList.add(workLocationStatus['state']["name"]);
        }
      }
    }
    state = const AsyncValue.data(null);
  }

  @override
  void changeWorkLocation({required val}) {
    state = const AsyncLoading();
    _selectWorkLocation = val;
    state = const AsyncValue.data(null);
  }

  Future<Map<String, dynamic>> generateStaticData(
      {int count = 0, String type = "all data", pageLimit = 2}) async {
    if (_lastKey == "undefined") {
      return {
        "data": {"details": []}
      };
    }
    ;
    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> staticData = {
      "data": {
        "details": List.generate(
            count,
            (index) => {
                  "accountId": "${type}660b18220e6eb47fe349b347",
                  "accountCustomId": index,
                  "name": "Yoxaz${index}",
                  "profileImageName": "1712006934114_1712006934105aaaa.jpg",
                  "profileImage":
                      "https://mayank-aws-private-account.s3.ap-south-1.amazonaws.com/1712006934114_1712006934105aaaa.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAYMJZXRWECNUEVUX7%2F20240401%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240401T214033Z&X-Amz-Expires=604800&X-Amz-Signature=f3614097c46f7437427d1d1b3e80c01ac4556fe63b98292a0643f7287c666970&X-Amz-SignedHeaders=host&x-id=GetObject",
                  "Gender": "gender${index}",
                  "age": 21 + index,
                  "DOB": "2002-06-26T00:00:00.000Z${index}",
                  "height": 208 + index,
                  "weight": 70 + index,
                  "BodyType": "body-type",
                  "complexion": "complexion",
                  "Address": "India India India India",
                  "education": "education",
                  "religion": "religion",
                  "occupation": "occupation",
                  "employedIn": "employment-type",
                  "subscriptionPlan": "${type}"
                }),
        "AccountCount": 1
      },
      "success": true
    };
    return staticData;
  }
}
