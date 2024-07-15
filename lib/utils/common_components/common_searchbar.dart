import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../import_utils.dart';

import '../color.dart';
import 'common_text.dart';

class CommonSearchBar extends ConsumerWidget {
  TextEditingController searchController;
  void Function(String)? onsearchChanged;
  void Function()? suffixonTap;
  double containerwidth;
  double containerheight;
  final Color? containercolor;
  final Color? borderColor;
  BorderRadiusGeometry? borderRadius;
  Widget? suffixicon;
  Widget? prefix;
  TextStyle? textStyle;

  CommonSearchBar(
      {super.key,
      required this.searchController,
      this.borderColor,
      this.containercolor,
      this.borderRadius,
      this.suffixicon,
      this.suffixonTap,
      this.textStyle,
      this.prefix,
      required this.containerwidth,
      required this.containerheight,
      required this.onsearchChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInputField(
          hintText: 'Search',
          controller: searchController,
          keyboardType: TextInputType.text,
          containerwidth: containerwidth,
          containerheight: containerheight,
          underline: false,
          containercolor: containercolor ?? AppColors.white,
          borderColor: borderColor ?? AppColors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          onChanged: (str) {
            onsearchChanged!(str);
          },
          suffixicon: suffixicon ??
              CommonIconButton(
                  containerwidth: h * 0.03,
                  containerheight: h * 0.03,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  centericon: Icon(Icons.mic,
                      color: AppColors.gray.withOpacity(0.6), size: h * 0.03),
                  onPressed: suffixonTap ?? () {}),
          textCapitalization: TextCapitalization.sentences,
          textstyle: juraTextStyle(
              fontSize: w * 0.04,
              color: AppColors.gray.withOpacity(0.4),
              fontWeight: FontWeight.w700),
          titletextstyle: juraTextStyle(
              fontSize: w * 0.04,
              color: AppColors.gray.withOpacity(0.4),
              fontWeight: FontWeight.w700),
          hintStyle: textStyle ??
              juraTextStyle(
                  fontSize: w * 0.04,
                  color: AppColors.gray.withOpacity(0.4),
                  fontWeight: FontWeight.w700),
          errorStyle: juraTextStyle(
              fontSize: w * 0.04,
              color: AppColors.gray.withOpacity(0.4),
              fontWeight: FontWeight.w700),
          prefix: Padding(
            padding:
                EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.02),
            child: prefix != null
                ? prefix
                : Icon(
                    Icons.search,
                    size: h * 0.03,
                    color: AppColors.gray.withOpacity(0.6),
                  ),
          ),
        ),
      ],
    );
  }
}
