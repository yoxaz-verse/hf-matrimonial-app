import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/Carousel/carousel_service.dart';
import '../../application/account/account_service.dart';
import '../../application/dialog/dialog_service.dart';
import '../../application/dropdown/dropdown_service.dart';
import '../../application/validate/validate.dart';
import '../../utils/import_utils.dart';
import '../registration moblie/registration_moblie.dart';

part 'registration_page_controller.g.dart';

@riverpod
class RegistrationPageController extends _$RegistrationPageController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late TextEditingController otpcontroller;
  Map<String, dynamic>? carouselResponse;
//genderList
  List<String> _genderList = [];

  List<String> get getGenderList => _genderList;
  String _selectGenderStatus = AppText.gender;

  String get getGenderStatus => _selectGenderStatus;
  Map<String, dynamic>? genderDataResponse;

  // PinTheme? isPinTheme;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;
  CarouselController carouselController = CarouselController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isGenderLoading = false;

  bool get isGenderLoading => _isGenderLoading;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  final List<String> _catList = [
    AppImg.welcomeImg3,
    AppImg.welcomeImg3,
    AppImg.welcomeImg3,
  ];
  String genderID = '';

  List<String> get catList => _catList;

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  //Create Account
  Map<String, dynamic>? _createAccountResponse;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await getCarousel();
     getGenderDropDown();
    _isLoading = false;
    otpcontroller = TextEditingController();
    state = const AsyncValue.data(null);
  }
  Future<void> getCarousel() async {
    state = const AsyncLoading();

    carouselResponse = await ref.read(carouselServiceProvider).getCarousel();

    
    // 

    state = AsyncValue.data(null);
  }

  Future<void> getGenderDropDown() async {
    state = const AsyncLoading();
    _isGenderLoading = true;
    genderDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallGender(authtoken: '');

    if (genderDataResponse != null) {
      if (genderDataResponse?["data"] != null) {
        
        for (var genderStatus in genderDataResponse?['data']["genders"]) {
          _genderList.add(genderStatus['name']);
        }
        
      }
    }

    _isGenderLoading = false;
    state = const AsyncValue.data(null);
  }
//create Account
  Future<void> onSignUpTap(BuildContext context) async {
    state = const AsyncLoading();
    _isSubmit = true;

    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());

    if (validatePhone(phoneController.text) == null &&
        validateEmail(emailidController.text) == null &&
        validate(nameController.text) == null &&
        validatePassword(passwordController.text) == null &&
        validateConfirmPassword(
                confirmPasswordController.text, passwordController.text) ==
            null) {
      _isLoading = true;

      if (_isChecked == true) {
        _createAccountResponse =
            await ref.read(accountServiceProvider).createAccount(
                  name: nameController.text,
                  email: emailidController.text,
                  password: passwordController.text,
                  phoneNumber: phoneController.text,
              gender: genderID
                );
        
        if (_createAccountResponse?["data"] != null) {
          if (_createAccountResponse?["data"]["token"] != null) {
            DialogServiceV1().showSnackBar(
                content: "Registration Successfull",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            PreferenceManagerUtils.setIsLogin(true);
            PreferenceManagerUtils.setToken(
                _createAccountResponse?["data"]["token"]);
            PreferenceManagerUtils.setUserId(
                _createAccountResponse?["data"]["Account"]["userId"]);
            PreferenceManagerUtils.setProfileId(
              (  _createAccountResponse?["data"]["Account"]["acc_Id"].toString()??_createAccountResponse?["data"]["Account"]["acc_id"].toString()??"").toString());

            PreferenceManagerUtils.setUserName(
                _createAccountResponse?["data"]["Account"]["name"]);
            PreferenceManagerUtils.setProfEmail(
                _createAccountResponse?["data"]["Account"]["email"]);

            Navigator.pushAndRemoveUntil(
                Globals.navigatorKey.currentContext!,
                PageTransition(
                    child: RegistrationMobile(
                        email: emailidController.text,
                        phoneNo: phoneController.text,fromRegister: true,),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 200)),
                (Route<dynamic> route) {
              return false;
            });
          }
        } else if (_createAccountResponse?["error"] != null) {
          DialogServiceV1().showSnackBar(
              content:
                  "Registration Failed due to ${_createAccountResponse?["error"]}",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
        } else {
          DialogServiceV1().showSnackBar(
              content:
                  "Registration Failed due to ${_createAccountResponse?["message"] ?? "Unknown"}",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
        }
      } else {
        DialogServiceV1().showSnackBar(
            content: "You Haven't Agree Privacy and T&C",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
    }

    _isLoading = false;
    state = const AsyncValue.data(null);
  }
  void changeGender({required val}) {
    state = const AsyncLoading();
    _selectGenderStatus = val;
    genderID = getIdFromNameValidateList(
        genderDataResponse?["data"]?["genders"] ?? [],
        _selectGenderStatus) ??
        "";
    
    state = const AsyncValue.data(null);
  }
  String? getIdFromNameValidateList(List<dynamic> jsonData, String name) {
    try {
      if (jsonData.isNotEmpty) {
        List<dynamic> data = jsonData;
        for (Map<String, dynamic> item in data) {
          if (item.containsKey("name")) {
            if (item['name'] == name) {
              return item['_id'];
            }
          } else if (item.containsKey("state")) {
            if (item["state"]?.containsKey("name")) {
              if (item["state"]['name'] == name) {
                return item['_id'];
              }
            }
          }
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  @override
  FutureOr<void> toggle(val) {
    state = const AsyncLoading();
    _isChecked = !_isChecked;
    state = const AsyncValue.data(null);
  }

  @override
  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }
}
