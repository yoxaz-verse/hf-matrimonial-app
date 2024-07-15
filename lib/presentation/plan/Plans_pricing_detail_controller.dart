import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/text.dart';

part 'Plans_pricing_detail_controller.g.dart';

@riverpod
class planPriceDetailsController extends _$planPriceDetailsController {


  bool _isLoading= false;
  bool get isLoading => _isLoading;


  List<String> image = [
    AppImg.goldbg,
    AppImg.silver,
    AppImg.platinum,
  ];

  List<String> get getCat => image;
  List<String> package = [AppText.gold,AppText.silver,AppText.platinum];

  List<String> get getpackage => package;

  List<Gradient> gradientList = [
    commonGradient(),
    LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [
          0.1,
          0.5,
          0.8,
        ],
        colors: [
          AppColors.gradWhite.withOpacity(0.7),
          AppColors.gradBlack.withOpacity(0.4),
          AppColors.gradWhite.withOpacity(0.7),
        ]),
    LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.gradBlack.withOpacity(0.7),
          AppColors.gradWhite.withOpacity(0.7),
        ]),
  ];

  List<Gradient> get getgradientList => gradientList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    _isLoading=false;

    state = const AsyncValue.data(null);
  }



}
