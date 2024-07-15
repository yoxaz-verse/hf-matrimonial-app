import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CommonButton extends ConsumerWidget {
  CommonButton({
    Key? key,
    required this.containerwidth,
    required this.containerheight,

     this.backgroundColor,
    required this.shape,
    required this.text,
    required this.textStyle,
    this.suffixicon,
    this.decoration,
    this.centericon,
    this.prefixicon,
    required this.onPressed,
  }) : super(key: key);
  double containerwidth;
  double containerheight;
  Color? backgroundColor;
  OutlinedBorder shape;
  BoxDecoration? decoration;
  Widget? suffixicon;
  Widget? prefixicon;
  Widget? centericon;
  String text;
  TextStyle textStyle;
  void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: containerwidth,
      height: containerheight,
      decoration: decoration,
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: shape,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefixicon != null
                ? Padding(
                    padding: EdgeInsets.only(right: w * 0.02),
                    child: prefixicon!,
                  )
                : const SizedBox.shrink(),
            text == "" && centericon != null
                ? centericon!
                : prefixicon != null
                    ? Container(
              alignment: Alignment.center,
              // color: AppColors.red,
                      child: Text(
                          text,
                          textAlign: prefixicon == null && suffixicon == null
                              ? TextAlign.center
                              : TextAlign.center,
                          style: textStyle,
                        ),
                    )
                    : Expanded(
                        child: Text(
                          text,
                          textAlign: prefixicon == null && suffixicon == null
                              ? TextAlign.center
                              : TextAlign.start,
                          style: textStyle,
                        ),
                      ),
            suffixicon != null
                ? Container(
                    width: text.length > 10 ? w * 0.1 : w * 0.06,
                    height: containerheight,
                    child: suffixicon!)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
