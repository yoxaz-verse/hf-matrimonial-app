import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../application/dialog/dialog_service.dart';
import '../../application/testimony/testimony_service.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
part 'testimony_controller.g.dart';

@riverpod
class testimonyController extends _$testimonyController {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();


  bool _isLoading= false;
  bool get isLoading => _isLoading;
  CarouselController carouselController = CarouselController();

  Map<String,dynamic>? testimonyResponse;
  bool _isReadMore = false;
  bool get isReadMore => _isReadMore;
  int _seletedIndex = 0 ;
  int get seletedIndex => _seletedIndex;

  List<String> image = [
    AppImg.wedding,
    AppImg.wedding1,
    AppImg.testimony3,
  ];
  // int currentpageIndex = 0;
  // int get getcurrentPageIndex => currentpageIndex;

  List<String> get getCat => image;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    getTestimony();
    await Future.delayed(Duration(seconds: 2));

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

    state = const AsyncValue.data(null);
  }
  // onPageChanged(int index) async {
  //   state = const AsyncLoading();
  //   currentpageIndex = index;
  //   state = const AsyncValue.data(null);
  // }
  void onCarouselPageChanged(int page, CarouselPageChangedReason reason) {
    state = const AsyncLoading();
    _seletedIndex = page;    state = const AsyncValue.data(null);

    
    state = const AsyncValue.data(null);

  }

  toggleReadMore(){
    state = const AsyncLoading();
    _isReadMore = !_isReadMore;
    state = const AsyncValue.data(null);

  }

  Future<void> getTestimony() async {
    state = const AsyncLoading();


    testimonyResponse = await ref.read(testimonyServiceProvider).getTestimony(
      // authtoken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWQ4YTllMDVhYzEyZTJiYjA5NTkyMTkiLCJlbWFpbCI6InN1cGVyYWRtaW5AZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlzU3VwZXJBZG1pbiI6dHJ1ZSwiaWF0IjoxNzA4Njk4MDgxLCJleHAiOjE3MDk1NjIwODF9.XL7F2_4Tv-o-S0ixsvm2f949W-0aRHPsdVQJZZAIh5o',
    );
    
    if (testimonyResponse != null) {
      if (testimonyResponse!["data"] != null) {
      print("djsgfj :::${testimonyResponse}");
      // testimonyResponse!.forEach((key, value) {
      //   
      //   
      // });
      }
    }
    state = const AsyncValue.data(null);
  }






}
