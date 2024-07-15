import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/application/home_screen/home_screen_service.dart';
import 'package:heavenlymatrimony/application/inbox/inbox_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/myplan/myplan.dart';
import 'package:heavenlymatrimony/presentation/registration%20moblie/registration_moblie.dart';
import 'package:heavenlymatrimony/presentation/send_interest_reason/send_interest_reason.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';

part 'bride_Full_Details_controller.g.dart';

@riverpod
class brideFullDetailsController extends _$brideFullDetailsController {
  List<String> _image = [];

  List<String> get image => _image;
  List<String> _imageName = [];

  List<String> get imageName => _imageName;

  String _brideName = 'jyfhg';
  String get brideName => _brideName;
  int _interest = 0;
  int get interest => _interest;
  bool _showContact = false;
  bool get showContact => _showContact;
  List<String> _inboxDataList = [];
  List<String> get inboxDataList => _inboxDataList;
  Map<String, dynamic>? _brideDetails;
  Map<String, dynamic>? get brideDetails => _brideDetails;

  List<Map<String, dynamic>> _personalInfo = [];
  List<Map<String, dynamic>> _religiousInfo = [];

  List<Map<String, dynamic>> get religiousInfo => _religiousInfo;
  List<Map<String, dynamic>> _eduAndCarrier = [];

  List<Map<String, dynamic>> get eduAndCarrier => _eduAndCarrier;

  List<Map<String, dynamic>> get personalInfo => _personalInfo;

  List<Map<String, dynamic>> _familyDetails = [];

  List<Map<String, dynamic>> get familyDetails => _familyDetails;
  List<Map<String, dynamic>> _contactDetails = [];

  List<Map<String, dynamic>> get contactDetails => _contactDetails;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;
  String authToken = "";

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _accountId = "";
  String get getAccountId => _accountId;

  String getFullDetails = "";
  get _getFullDetails => getFullDetails;

  @override
  FutureOr<void> build({accountId, profileData}) async {
    state = const AsyncLoading();
    _isLoading = true;
    _accountId = accountId;
    // await Future.delayed(Duration(seconds: 5));
    await PreferenceManagerUtils.getToken().then((value) async {
      authToken = value;

      /// detail of login user
      await getAccountDetails();

      // detail of selected user profile
      await getAccountDetailsById();
      await getInterest();
      await getInboxData();
    });
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
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
        _interest = accountDetails["data"]["addOnInterestLeft"] ?? 0;
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
  refresh() async {
    state = const AsyncLoading();
    await getInterest();
    await getInboxData();

    print("_contactDetails ${_contactDetails}");
    _showContact = true;
    // await build();

    state = const AsyncValue.data(null);
  }
  getInboxData() async {
    state = const AsyncLoading();
    Map<String,dynamic>? inboxData =
    await ref.read(inboxServiceProvider).getInterestSent(
      authtoken:authToken,
    );
    if(inboxData!=null && inboxData["data"]!=null && inboxData["data"]["interests"]!=null && inboxData["data"]["interests"].isNotEmpty){
      // 
      inboxData["data"]["interests"].forEach((item){
        _inboxDataList.add(item["receiverId"]["_id"]??"");
      });
      
      if(_inboxDataList.contains(_accountId)){
        _showContact = true;
      }
    }
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
            accountDetails["data"]["accountId"]["isSubscribed"]);
        PreferenceManagerUtils.setIsPhoneVerified(
            accountDetails["data"]["accountId"]["isPhoneVerified"]);
        PreferenceManagerUtils.setIsEmailVerified(
            accountDetails["data"]["accountId"]["isEmailVerified"]);
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

  onInterestTapped({context}) async {
    // PreferenceManagerUtils.setIsPhoneVerified(false);
    // PreferenceManagerUtils.setIsEmailVerified(false);
    // PreferenceManagerUtils.setIsProfileVerified(false);
    // PreferenceManagerUtils.setRequestsRemaining(0);

    // await ref.read(afterBottomBarControllerProvider().notifier).getAccountDetails();
 getAccountDetails();
    // PreferenceManagerUtils.setIsPhoneVerified(true);
    // PreferenceManagerUtils.setIsEmailVerified(true);
    // PreferenceManagerUtils.setIsProfileVerified(true);
    // PreferenceManagerUtils.setRequestsRemaining(5);

    PreferenceManagerUtils.getIsPhoneVerified().then((isPhoneVerified) {
      PreferenceManagerUtils.getIsEmailVerified().then((isEmailVerified) {
        PreferenceManagerUtils.getIsProfileVerified().then((isProfileVerified) {
          PreferenceManagerUtils.getRequestsRemaining()
              .then((requestRemaining) {
            // 
            if (isPhoneVerified == false || isEmailVerified == false) {
              ref.read(dialogServiceProvider).singleButtonDialog(
                  titleText: "Verification is pending",
                  subtitleText:
                      "Please confirm your phone number and email to continue.",
                  onYesPressed: () {
                    Navigator.pop(context);
                    commonNavigator(
                        context: context,
                        child: RegistrationMobile(),
                        type: PageTransitionType.fade);
                  },
                  buttonText: 'Verify Now');
            } else if (isProfileVerified == false) {
              ref.read(dialogServiceProvider).singleButtonDialog(
                  titleText: "Profile verification",
                  subtitleText:
                      "Your profile is currently being verified, which typically takes 2 - 3 working days.",
                  onYesPressed: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Okay, Got it.');
            } else if (requestRemaining <= 0) {
              ref.read(dialogServiceProvider).singleButtonDialog(
                  titleText: "Request Alert!",
                  subtitleText:
                      "You have reached the maximum request limit. Please upgrade your plan to increase your requests.",
                  onYesPressed: () {
                    Navigator.pop(context);
                    commonNavigator(
                        context: context,
                        child: MyPlanScreen(),
                        type: PageTransitionType.fade);
                  },
                  buttonText: 'Current Plan');
            } else {
              commonNavigator(
                  context: context,
                  child: SendInterestReason(
                    accountId: _accountId,
                    afterSentCallback: refresh,
                  ),
                  type: PageTransitionType.fade);
            }
          });
        });
      });
    });
  }

  Future<void> getAccountDetailsById() async {
    state = const AsyncLoading();
    try {
      Map<String, dynamic>? accountDetailsByIdResponse = await ref
          .read(homeServiceProvider)
          .getUsersCardFullDetailsById(
              authtoken: authToken, accountId: _accountId);
      if (accountDetailsByIdResponse?["data"] != null) {
        /// all data
        _brideDetails = accountDetailsByIdResponse?["data"];

        /// bride name
        _brideName = _brideDetails?["name"];

        /// images
        if (_brideDetails?["profileImage"] != null &&
            _brideDetails?["profileImage"] != "")
          _image.add(_brideDetails?["profileImage"]);
          _imageName.add(_brideDetails?["profileImageName"]);
        if (_brideDetails?["AllImages"] != null &&
            _brideDetails?["AllImages"].isNotEmpty) {
          _brideDetails?["AllImages"].forEach((element) {
            if (element != null && element["path"] != "") {
              _image.add(element["path"]);
            }
          });
        }
        //
        //   {
        //    'Age': '28',
        //   },
        //   {
        //   'Gender': 'Male',
        //   },
        //   {
        //   'Date Of Birth': '01-02-1995',
        //   },
        //   {
        //   'Height': '5ft 7in - 170 Cm',
        //   },
        //   {
        //   'Complexion': 'Wheatish',
        //   },
        //   {
        //   'Body Type': 'Slim',
        //   },
        //   {
        //   'Physical Status': 'Normal',
        //   },
        //   {
        //   'Marutal Status': 'Unmarried',
        //   },

        /// personal details
        if (_brideDetails?["age"] != null && _brideDetails?["age"] != '')
          _personalInfo.add({
            'Age': _brideDetails?["age"].toString(),
          });
        if (_brideDetails?["Gender"] != null && _brideDetails?["Gender"] != '')
          _personalInfo.add({
            'Gender': _brideDetails?["Gender"].toString(),
          });
        final dateFormatter = DateFormat("dd-MM-yyyy");
        if (_brideDetails?["DOB"] != null && _brideDetails?["DOB"] != '')
          _personalInfo.add({
            'Date Of Birth':
                dateFormatter.format(DateTime.parse(_brideDetails?["DOB"])),
          });
        if (_brideDetails?["height"] != null && _brideDetails?["height"] != '')
          _personalInfo.add({
            'Height': _brideDetails?["height"].toString(),
          });
        if (_brideDetails?["Complexion"] != null &&
            _brideDetails?["Complexion"] != '')
          _personalInfo.add({
            'Complexion': _brideDetails?["Complexion"].toString(),
          });
        if (_brideDetails?["BodyType"] != null &&
            _brideDetails?["BodyType"] != '')
          _personalInfo.add({
            'Body Type': _brideDetails?["BodyType"].toString(),
          });
        if (_brideDetails?["PhysicalStatus"] != null &&
            _brideDetails?["PhysicalStatus"] != '')
          _personalInfo.add({
            'Physical Status': _brideDetails?["PhysicalStatus"].toString(),
          });
        if (_brideDetails?["MartialStatus"] != null &&
            _brideDetails?["MartialStatus"] != '')
          _personalInfo.add({
            'Martial Status': _brideDetails?["MartialStatus"].toString(),
          });

        /// religious info
        if (_brideDetails?["religion"] != null &&
            _brideDetails?["religion"] != '')
          _religiousInfo.add({
            'Previous Religion': _brideDetails?["religion"].toString(),
          });
        if (_brideDetails?["denomination"] != null &&
            _brideDetails?["denomination"] != '')
          _religiousInfo.add({
            'Denomination': _brideDetails?["denomination"].toString(),
          });

        ///education and career info
        if (_brideDetails?["highestEducation"] != null &&
            _brideDetails?["highestEducation"] != '')
          _eduAndCarrier.add({
            'Highest Education': _brideDetails?["highestEducation"].toString(),
          });
        if (_brideDetails?["occupation"] != null &&
            _brideDetails?["occupation"] != '')
          _eduAndCarrier.add({
            'Occupation': _brideDetails?["occupation"].toString(),
          });
        if (_brideDetails?["occupationDetail"] != null &&
            _brideDetails?["occupationDetail"] != '')
          _eduAndCarrier.add({
            'Occupation In Detail':
                _brideDetails?["occupationDetail"].toString(),
          });
        if ((_brideDetails?["workLocationCountry"] != null &&
                _brideDetails?["workLocationCountry"] != '') ||
            (_brideDetails?["workLocationState"] != null &&
                _brideDetails?["workLocationState"] != ''))
          _eduAndCarrier.add({
            'Work Location':
                (_brideDetails?["workLocationState"].toString() ?? "") +
                    " " +
                    (_brideDetails?["workLocationCountry"].toString() ?? ""),
          });
        if (_brideDetails?["employedIn"] != null &&
            _brideDetails?["employedIn"] != '')
          _eduAndCarrier.add({
            'Employed In': _brideDetails?["employedIn"].toString() ??
                "" + " " + (_brideDetails?["employedIn"].toString() ?? ""),
          });

        ///family detaails
        if (_brideDetails?["fatherName"] != null &&
            _brideDetails?["fatherName"] != '')
          _familyDetails.add({
            'Father Name': _brideDetails?["fatherName"].toString(),
          });
        if (_brideDetails?["fatherOccupation"] != null &&
            _brideDetails?["fatherOccupation"] != '')
          _familyDetails.add({
            'Father Occupation': _brideDetails?["fatherOccupation"].toString(),
          });
        if (_brideDetails?["motherName"] != null &&
            _brideDetails?["motherName"] != '')
          _familyDetails.add({
            'Mother Name': _brideDetails?["motherName"].toString(),
          });
        if (_brideDetails?["motherOccupation"] != null &&
            _brideDetails?["motherOccupation"] != '')
          _familyDetails.add({
            'Mother Occupation': _brideDetails?["motherOccupation"].toString(),
          });
        if (_brideDetails?["numberOfBrother"] != null &&
            _brideDetails?["numberOfBrother"] != '')
          _familyDetails.add({
            'Number Of Brother': _brideDetails?["numberOfBrother"].toString(),
          });
        if (_brideDetails?["numberOfSister"] != null &&
            _brideDetails?["numberOfSister"] != '')
          _familyDetails.add({
            'Number Of Sister': _brideDetails?["numberOfSister"].toString(),
          });

        /// contact
        if (_brideDetails?["phoneNumber"] != null &&
            _brideDetails?["phoneNumber"] != '')
          _contactDetails.add({
            'Contact Number': _brideDetails?["phoneNumber"].toString(),
          });
        if (_brideDetails?["phoneNumber"] != null &&
            _brideDetails?["phoneNumber"] != '')
          _contactDetails.add({
            'Address':
                "${_brideDetails?["Address"]["Address"] != null ? "${_brideDetails?["Address"]["Address"]} " : ""}${_brideDetails?["Address"]["Distict"] != null ? "${_brideDetails?["Address"]["Distict"]} " : ""}${_brideDetails?["Address"]["State"] != null ? "${_brideDetails?["Address"]["State"]} " : ""}${_brideDetails?["Address"]["Country"] != null ? "${_brideDetails?["Address"]["Country"]}" : ""}",
          });
      }else{
        Navigator.pop(Globals.navigatorKey.currentContext!);
      }
    } catch (e, s) {
      Navigator.pop(Globals.navigatorKey.currentContext!);

    }
    state = const AsyncValue.data(null);
  }
}
