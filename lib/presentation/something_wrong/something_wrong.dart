import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/common_components/common_appbar.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';

import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
              Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: h * 0.015,
            left: w * 0.3,
            child: CommonText(
                text: AppText.tryagain,
                style: juraTextStyle(
                    fontSize: h * 0.032,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700)),
          ),
          Positioned(
            top: h * 0.0,
            left: w * 0.55,
            child: Image.asset(
              AppImg.ringbg,
              height: h * 0.1,
              width: w * 0.5,
            ),
          ),

          Container(
            height: h,
            width: w,
            child: Stack(
              children: [
                Positioned(
                  bottom: h * 0.49,
                  left: w * 0.3,
                  child: Container(
                    width: w * 0.4,
                    height: h * 0.1,
                    child: CommonText(
                      textAlign: TextAlign.center,
                      text: AppText.oops,
                      style: juraTextStyle(
                        color: AppColors.gray,
                        fontSize: h * 0.052,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: h * 0.46,
                  left: w * 0.17,
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.9,
                    child: CommonText(
                      text: AppText.somethingwrong,
                      style: juraTextStyle(
                        color: AppColors.gray,
                        fontSize: h * 0.026,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: h * 0.2,
            top: 0,
            right: -w * 0.04,
            child: RotatedBox(
                quarterTurns: 1,
                child: appNameText(
                    heavenly: AppText.heavenly,
                    matrimony: AppText.appName,
                    containerHeight: w * 0.2,
                    containerWidth: h * 0.374,
                    heavenlyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.025),
                        fontSize: h * 0.048,
                        fontWeight: FontWeight.w600),
                    matrimonyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.025),
                        fontSize: h * 0.032,
                        fontWeight: FontWeight.w500))),
          ),
          Positioned(
            bottom: h * 0.2,
            top: 0,
            left: -w * 0.04,
            child: RotatedBox(
                quarterTurns: -1,
                child: appNameText(
                    heavenly: AppText.heavenly,
                    matrimony: AppText.appName,
                    containerHeight: w * 0.2,
                    containerWidth: h * 0.374,
                    heavenlyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.025),
                        fontSize: h * 0.048,
                        fontWeight: FontWeight.w500),
                    matrimonyStyle: juraTextStyle(
                        color: AppColors.black.withOpacity(0.025),
                        fontSize: h * 0.032,
                        fontWeight: FontWeight.w500))),
          ),
          Positioned(
            bottom: h * 0,
            left: w * 0,
            child: Container(
              padding: EdgeInsets.only(top: h * 0.05),
              height: h * 0.3,
              width: w * 0.8,
              child: Opacity(
                opacity: 0.09,
                child: Image.asset(
                  AppImg.ring,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.lighten,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
