import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/images.dart';

part 'before_bottom_bar_controller.g.dart';

@riverpod
class BottomBarController extends _$BottomBarController {
  int selectedIndex = 0;
  PageController? pageController;
  int _imgIndex = 0;
  int get imgIndex => _imgIndex;
  Timer? timer;

  List _imgList = [AppImg.welcomeImg, AppImg.welcomeImg2];
  List get imgList => _imgList;
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    try{
      timer = Timer.periodic(Duration(seconds: 4), (timer) {
        state = const AsyncLoading();
        if (_imgIndex < imgList.length-1) {
          _imgIndex++;
        } else {
          _imgIndex = 0;
        }
        state = const AsyncValue.data(null);
      });
    }catch(e,s){

    }
    state = const AsyncValue.data(null);
  }

  List<String> listOfIcons = [
    AppImg.b1,
    AppImg.b2,
    AppImg.b3,
    AppImg.b4,
  ];
  void onItemTapped(int index) {
    state = const AsyncLoading();
    selectedIndex = index;
    state = const AsyncValue.data(null);
  }
}
