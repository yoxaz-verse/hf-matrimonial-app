import 'package:flutter/material.dart';

import '../import_utils.dart';

class ContTextInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  // final Icon? icon;
  final bool? obscureText;
  final bool? messagetext;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? titleText;
  final int? maxLines;
  final int? maxLength;
  final scrollPhysics;
  bool? readonly;
  bool center;
  Widget? suffixicon;

  // double? iconSize;
  Color? color;
  String? appimge;
  double containerwidth;
  double? containerheight;

  // Color? iconcolor;
  Color? containercolor;
  Color? borderColor;
  TextStyle textstyle;
  TextStyle titletextstyle;
  TextStyle hintStyle;
  TextStyle errorStyle;

  Widget prefix;
  String? titlesuffix;

  ContTextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.titlesuffix,
    // this.onTapIcon,
    this.onTap,
    this.onChanged,
    this.readonly = false,
    required this.center,
    this.onSubmitted,
    // this.icon,
    this.obscureText = false,
    this.messagetext,
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
    required this.textstyle,
    required this.titletextstyle,
    required this.textCapitalization,
    required this.hintStyle,
    // this.iconSize,
    required this.errorStyle,
    this.maxLines,
    this.scrollPhysics,
    required this.prefix,
    this.maxLength,
  }) : super(key: key);

  Widget _buildErrorLabel(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (errorText == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.002),
      child: Container(
        width: containerwidth,
        child: Text(
          errorText!,
          style: errorStyle != null
              ? errorStyle
              : TextStyle(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w400,
                  color: AppColors.red),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
          Container(
            width: containerwidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText == '' || titleText == null
                    ? const SizedBox.shrink()
                    : Text(titleText!,
                        style: titletextstyle != null
                            ? titletextstyle
                            : TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white)),
                titlesuffix == '' || titlesuffix == null
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.008),
                        child: SizedBox(
                          height: height * 0.025,
                        ),
                      )
                    : InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.008),
                          child: Image.asset(
                            color: AppColors.black,
                            titlesuffix!,
                            height: height * 0.025,
                          ),
                        )),
              ],
            ),
          ),
        Container(
          width: containerwidth,
          height: messagetext == true ? null : containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            // boxShadow: [BoxShadow()] == null ? SizedBox.shrink():
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.4),
                offset: const Offset(
                  0.0,
                  5.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              BoxShadow(
                color: AppColors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: containercolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              prefix!,
              Expanded(
                child: SizedBox(
                  width: containerwidth ?? width * 0.58,
                  height: messagetext == true
                      ? null
                      : containerheight ?? height * 0.06,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: center == false
                        ? TextFormField(
                            readOnly: readonly!,
                            style: textstyle,
                            onTap: onTap,
                            textCapitalization: textCapitalization,
                            textAlignVertical: TextAlignVertical.center,
                            controller: controller,
                            focusNode: focusNode,
                            onChanged: onChanged,
                            scrollPhysics:
                                scrollPhysics ?? NeverScrollableScrollPhysics(),
                            obscureText: obscureText!,
                            keyboardType: keyboardType,
                            textInputAction: textInputAction,
                            maxLines: maxLines,
                            cursorColor: AppColors.colorPrimary,
                            maxLength: maxLength,
                            decoration: InputDecoration(
                              hintText: hintText,
                              hintStyle: hintStyle,
                              suffixIcon: suffixicon,
                              border: InputBorder.none,
                              counterText: "",
                              isDense: false,
                            ),
                          )
                        : Center(
                            child: TextFormField(
                              readOnly: readonly!,
                              style: textstyle,
                              onTap: onTap,
                              textCapitalization: textCapitalization,
                              textAlignVertical: TextAlignVertical.center,
                              controller: controller,
                              focusNode: focusNode,
                              onChanged: onChanged,
                              scrollPhysics: scrollPhysics ??
                                  NeverScrollableScrollPhysics(),
                              obscureText: obscureText!,
                              keyboardType: keyboardType,
                              textInputAction: textInputAction,
                              maxLines: maxLines,
                              cursorColor: AppColors.colorPrimary,
                              maxLength: maxLength,
                              decoration: InputDecoration(
                                hintText: hintText,
                                hintStyle: hintStyle,
                                suffixIcon: suffixicon,
                                border: InputBorder.none,
                                counterText: "",
                                isDense: false,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildErrorLabel(context)
      ],
    );
  }
}
