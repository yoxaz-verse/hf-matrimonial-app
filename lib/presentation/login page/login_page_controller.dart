import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/application/Carousel/carousel_service.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/registration%20moblie/registration_moblie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../application/account/account_service.dart';
import '../../application/dialog/dialog_service.dart';
import '../../application/validate/validate.dart';
import '../../data/shared_pref/shared_pref.dart';
import '../../utils/color.dart';
import '../../utils/globals.dart';
import '../../utils/images.dart';
part 'login_page_controller.g.dart';

@riverpod
class LoginPageController extends _$LoginPageController {
  TextEditingController emailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;

  int currentpageIndex = 0;
  int get getcurrentPageIndex => currentpageIndex;

  Map<String, dynamic>? _createLoginResponse;
  Map<String, dynamic>? carouselResponse;

  CarouselController carouselController = CarouselController();

  final List<String> _catList = [
    AppImg.welcomeImg3,
    AppImg.welcomeImg3,
    AppImg.welcomeImg3,
  ];

  List<String> get catList => _catList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await getCarousel();
    // await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> getCarousel() async {
    state = const AsyncLoading();
    carouselResponse = await ref.read(carouselServiceProvider).getCarousel();
    
    // 
    state = AsyncValue.data(null);
  }

  Future<void> onLoginTap(BuildContext context) async {
    state = const AsyncLoading();
    _isSubmit = true;

    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());

    if (validateEmail(emailidController.text) == null) {
      _isLoading = true;
      try {
        _createLoginResponse = await ref
            .read(accountServiceProvider)
            .loginAccount(
                email: emailidController.text,
                password: passwordController.text);
      } catch (e, s) {
        DialogServiceV1().showSnackBar(
            content: "Server error please login again or try again after some time",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      }
      

      // 
      if (_createLoginResponse?["data"] != null) {
        if (_createLoginResponse?["data"]["token"] != null) {
          PreferenceManagerUtils.setIsLogin(true);

          PreferenceManagerUtils.setToken(
              _createLoginResponse?["data"]["token"]);
          PreferenceManagerUtils.setUserId(
              _createLoginResponse?["data"]["Account"]["userId"]["_id"]);
          PreferenceManagerUtils.setProfileId(
              (_createLoginResponse?["data"]["Account"]["acc_Id"].toString()?? _createLoginResponse?["data"]["Account"]["acc_id"].toString()??"").toString());
          PreferenceManagerUtils.setProfMobileNo(_createLoginResponse?["data"]
              ["Account"]["userId"]["phoneNumber"]);
          PreferenceManagerUtils.setUserName(
              _createLoginResponse?["data"]["Account"]["name"]);
          PreferenceManagerUtils.setProfEmail(
              _createLoginResponse?["data"]["Account"]["email"]);

          if (_createLoginResponse?["data"]["Account"]["isPhoneVerified"] ==
                  true &&
              _createLoginResponse?["data"]["Account"]["isEmailVerified"] ==
                  true) {
            Navigator.pushAndRemoveUntil(
                Globals.navigatorKey.currentContext!,
                PageTransition(
                    child: AfterBottomBar(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 200)),
                (Route<dynamic> route) {
              return false;
            });
          } else {
            Navigator.pushAndRemoveUntil(
                Globals.navigatorKey.currentContext!,
                PageTransition(
                    child: RegistrationMobile(email: _createLoginResponse?["data"]["Account"]["email"]??"",phoneNo:  _createLoginResponse?["data"]["Account"]["userId"]["phoneNumber"] ?? "",),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 200)),
                (Route<dynamic> route) {
              return false;
            });
          }
        }
      }
    } else {
      _isLoading = false;
      state = AsyncValue.data(null);
      if (validateEmail(emailidController.text) != null) {
        DialogServiceV1().showSnackBar(
            content: ((validateEmail(emailidController.text) ?? "") +
                (validatePassword(passwordController.text) ?? "")),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      } else if (validatePassword(passwordController.text) != null) {
        DialogServiceV1().showSnackBar(
            content: (validatePassword(passwordController.text) ?? ""),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
      }
    }

    _isLoading = false;
    state = AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }
}
