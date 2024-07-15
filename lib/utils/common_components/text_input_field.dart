import 'package:flutter/material.dart';

import '../color.dart';
import 'common_text.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final String? lableText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  bool? isCounter = false;

  // final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  final GestureTapCallback? suffixonTap;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  Color? underlinecolor;
  Color? enableunderlinecolor;
  Color? disableunderlinecolor;
  Color? focusunderlinecolor;

  // final Icon? icon;
  final bool? obscureText;
  final bool? isdescription;
  bool? center = false;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? titleText;
  final int? maxLines;
  final int? maxLength;
  final scrollPhysics;
  final enabled;
  final containerborder;
  BorderRadiusGeometry? borderRadius;
  final bool? readonly;
  final bool? underline;
  final TextAlign? textAlign;
  final Widget? suffixicon;
  String? counterText;

  // double? iconSize;
  final Color? color;
  final String? appimge;
  final double containerwidth;
  final double? containerheight;
  final Color? containercolor;
  final Color? borderColor;
  List<BoxShadow>? boxShadow;
  // Color? iconcolor;
  double? cursorHeight;
  final TextStyle? textstyle;
  final TextStyle? titletextstyle;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  final TextStyle? errorStyle;
  final TextStyle? counterStyle;
  final Widget? prefix;
  final String? titlesuffix;

  TextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.lableText,
    this.boxShadow,
    this.underline,
    this.isCounter = false,
    this.center,
    this.disableunderlinecolor,
    this.focusunderlinecolor,
    this.enableunderlinecolor,
    this.focusNode,
    this.titlesuffix,
    this.isdescription,
    this.cursorHeight,
    this.counterStyle,
    this.counterText,
    this.borderRadius,
    this.textAlign,

    // this.onTapIcon,
    this.onTap,
    this.underlinecolor,
    this.onChanged,
    this.readonly = false,
    this.onSubmitted,
    // this.icon,
    this.obscureText = false,
    required this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.color,
    this.appimge,
    this.suffixicon,
    required this.containerwidth,
    this.containerheight,
    // this.iconcolor,
    required this.containercolor,
    this.borderColor,
    this.titleText,
    this.suffixonTap,
    this.textstyle,
    this.titletextstyle,
    required this.textCapitalization,
    this.hintStyle,
    this.lableStyle,
    // this.iconSize,
    this.errorStyle,
    this.maxLines,
    this.prefix,
    this.maxLength,
    this.enabled,
    this.scrollPhysics,
    this.containerborder,
  }) : super(key: key);

  Widget _buildErrorLabel(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (errorText == null) {
      return Container();
    }

    return Container(
      width: containerwidth,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          errorText == null
              ? SizedBox()
              : Expanded(
                  child: Text(
                    errorText!,
                    style: errorStyle ??
                        juraTextStyle(
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w400,
                            color: AppColors.red),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          isCounter == false
              ? SizedBox()
              : Text(
                  "${controller!.text.length}/${maxLength}",
                  style: counterStyle ??
                      juraTextStyle(
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor1),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (titleText != null || titlesuffix != null)
          Padding(
            padding: containerborder != null
                ? EdgeInsets.only(top: height * 0.005, bottom: height * 0.005)
                : EdgeInsets.zero,
            child: Container(
              width: containerwidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleText == '' || titleText == null
                      ? const SizedBox.shrink()
                      : CommonText(
                          text: titleText!,
                          style: titletextstyle ??
                              juraTextStyle(
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black)),
                ],
              ),
            ),
          ),
        Container(
          width: containerwidth,
          height:
              isdescription == true ? null : containerheight ?? height * 0.06,
          decoration: BoxDecoration(boxShadow: boxShadow,
            color: containercolor,
            border: containerborder,
            borderRadius: borderRadius ?? BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefix ?? const SizedBox(),
              Expanded(
                child: SizedBox(
                  width: width * 0.54,
                  height: isdescription == true
                      ? null
                      : containerheight ?? height * 0.06,
                  child: center == false
                      ? TextFormField(
                          readOnly: readonly!,
                          enabled: enabled,
                          style: textstyle ??
                              juraTextStyle(
                                  fontSize: height * 0.019,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                          onTap: onTap,
                          textCapitalization: textCapitalization,
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller,
                          focusNode: focusNode,
                          onChanged: onChanged,
                          scrollPhysics: scrollPhysics ??
                              const NeverScrollableScrollPhysics(),
                          obscureText: obscureText!,
                          keyboardType: keyboardType,
                          textInputAction: textInputAction,
                          maxLines: maxLines,
                          cursorColor: AppColors.colorPrimary,
                          maxLength: maxLength,
                          cursorHeight: cursorHeight ?? height * 0.025,
                          decoration: underline == false
                              ? InputDecoration(
                                  border: InputBorder.none,
                                  labelText: lableText,
                                  labelStyle: lableStyle,
                                  hintText: hintText,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                  ),
                                  hintStyle: hintStyle ??
                                      juraTextStyle(
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey),
                                  suffixIcon: suffixicon != null
                                      ? GestureDetector(
                                          onTap: suffixonTap, child: suffixicon)
                                      : suffixicon,
                                  counterText: counterText ?? "",
                                  isDense: true,
                                )
                              : InputDecoration(
                                  labelText: lableText,
                                  labelStyle: lableStyle,
                                  hintText: hintText,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                  ),
                                  hintStyle: hintStyle ??
                                      juraTextStyle(
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey),
                                  suffixIcon: suffixicon != null
                                      ? GestureDetector(
                                          onTap: suffixonTap, child: suffixicon)
                                      : suffixicon,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: enableunderlinecolor ??
                                              AppColors.borderColor,
                                          width: 1)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: disableunderlinecolor ??
                                              AppColors.borderColor,
                                          width: 1)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: focusunderlinecolor ??
                                              AppColors.borderColor,
                                          width: 1)),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: underlinecolor ??
                                              AppColors.borderColor,
                                          width: 1)),
                                  counterText: counterText ?? "",
                                  isDense: true,
                                ),
                        )
                      : Center(
                          child: TextFormField(
                            readOnly: readonly!,
                            enabled: enabled,
                            style: textstyle ??
                                juraTextStyle(
                                    fontSize: height * 0.019,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                            onTap: onTap,
                            textCapitalization: textCapitalization,
                            textAlignVertical: TextAlignVertical.center,
                            controller: controller,
                            focusNode: focusNode,
                            textAlign: textAlign??TextAlign.start,
                            onChanged: onChanged,
                            scrollPhysics: scrollPhysics ??
                                const NeverScrollableScrollPhysics(),
                            obscureText: obscureText!,
                            keyboardType: keyboardType,
                            textInputAction: textInputAction,
                            maxLines: maxLines,
                            cursorColor: AppColors.gradient2,
                            maxLength: maxLength,
                            cursorHeight: cursorHeight ?? height * 0.025,
                            decoration: underline == false
                                ? InputDecoration(
                                    border: InputBorder.none,
                                    labelText: lableText,
                                    labelStyle: lableStyle,
                                    hintText: hintText,
                                    contentPadding:
                                        EdgeInsets.only(left: width * 0.025),
                                    hintStyle: hintStyle ??
                                        juraTextStyle(
                                            fontSize: height * 0.018,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey),
                                    suffixIcon: suffixicon != null
                                        ? GestureDetector(
                                            onTap: suffixonTap,
                                            child: suffixicon)
                                        : suffixicon,
                                    counterText: counterText ?? "",
                                    isDense: true,
                                  )
                                : InputDecoration(
                                    labelText: lableText,
                                    labelStyle: lableStyle,
                                    hintText: hintText,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                    ),
                                    hintStyle: hintStyle ??
                                        juraTextStyle(
                                            fontSize: height * 0.018,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey),
                                    suffixIcon: suffixicon != null
                                        ? GestureDetector(
                                            onTap: suffixonTap,
                                            child: suffixicon)
                                        : suffixicon,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: enableunderlinecolor ??
                                                AppColors.borderColor,
                                            width: 1)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: disableunderlinecolor ??
                                                AppColors.borderColor,
                                            width: 1)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: focusunderlinecolor ??
                                                AppColors.gradient2,
                                            width: 1)),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: underlinecolor ??
                                                AppColors.borderColor,
                                            width: 1)),
                                    counterText: counterText ?? "",
                                    isDense: true,
                                  ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        _buildErrorLabel(context),
      ],
    );
  }
}
