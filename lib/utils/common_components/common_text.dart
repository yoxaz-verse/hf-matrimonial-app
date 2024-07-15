import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import '../color.dart';
import '../globals.dart';
import '../text.dart';

TextStyle juraTextStyle({
  bool inherit = true,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  TextLeadingDistribution? leadingDistribution,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  List<FontVariation>? fontVariations,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  String? fontFamily,
  List<String>? fontFamilyFallback,
  String? package,
  TextOverflow? overflow,
}) {
  final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
  return GoogleFonts.jura(
    textStyle: TextStyle(
        wordSpacing: wordSpacing,
        fontFeatures: fontFeatures,
        fontFamilyFallback: fontFamilyFallback,
        textBaseline: textBaseline,
        shadows: shadows,
        fontVariations: fontVariations,
        package: package,
        inherit: inherit,
        foreground: foreground,
        letterSpacing: letterSpacing,
        leadingDistribution: leadingDistribution,
        fontStyle: fontStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        background: background,
        debugLabel: debugLabel,
        decoration: decoration,
        backgroundColor: backgroundColor,
        locale: locale,
        overflow: overflow,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color),
  );
}

Text CommonText({
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
  Color? selectionColor,
  required String text,
  required TextStyle style,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: style,
    overflow: overflow,
    locale: locale,
    maxLines: maxLines,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaleFactor: textScaleFactor,
    textWidthBasis: textWidthBasis,
  );
}

Text noDataCommonText({
  required TextStyle style,
  String? data,
}) {
  return CommonText(
    text: data??"No Data Found",
    style: style,
  );
}

Gradient commonGradient({String name = ""}) {
  if(name!=""){
    if(name.toLowerCase().contains("gold")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradient1,
        AppColors.gradient2,
        AppColors.gradient3,
      ],
    );}
    if(name.toLowerCase().contains("silver")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradientSilver1,
        AppColors.gradientSilver2,
        AppColors.gradientSilver3,
      ],
    );}

    if(name.toLowerCase().contains("bronze")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradientBronze1,
        AppColors.gradientBronze2,
        AppColors.gradientBronze3,
      ],
    );}
  }
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
      0.99
    ],
    colors: [
      AppColors.gradient1,
      AppColors.gradient2,
      AppColors.gradient3,
    ],
  );
}
Gradient commonGradientForPlan({String name = ""}) {
  if(name!=""){
    if(name.toLowerCase().contains("gold")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradient1,
        AppColors.gradient2,
        AppColors.gradient3,
      ],
    );}
    if(name.toLowerCase().contains("silver")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradientSilver1,
        AppColors.gradientSilver2,
        AppColors.gradientSilver3,
      ],
    );}

    if(name.toLowerCase().contains("bronze")){
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.7,
        0.99
      ],
      colors: [
        AppColors.gradientBronze1,
        AppColors.gradientBronze2,
        AppColors.gradientBronze3,
      ],
    );}
  }
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
      0.99
    ],
    colors: [
      AppColors.gradientDefault1,
      AppColors.gradientDefault2,
      AppColors.gradientDefault3,
    ],
  );
}

Widget appNameText({
  required TextStyle heavenlyStyle,
  required String heavenly,
  required double containerHeight,
  required double containerWidth,
  required TextStyle matrimonyStyle,
  required String matrimony,
}) {

  return Container(
    height: containerHeight,
    width: containerWidth,
    // color: AppColors.black,
    child: Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(text:heavenly , style: heavenlyStyle),
              ],
            )),
        Positioned(
          bottom:0.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(text: matrimony, style: matrimonyStyle),
            ],
          ),
        ),
      ],
    ),
  );
}
