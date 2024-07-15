import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import 'common_text.dart';

class TitleSubtitle extends ConsumerWidget {
  String title;
  String subtitle;
  TextStyle titleStyle;
  TextStyle subtitleStyle;
  bool isExpanded;
  bool? isColExpanded;
  void Function()? onTap;

  TitleSubtitle(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.titleStyle,
      required this.isExpanded,
      this.isColExpanded,
      required this.subtitleStyle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          isColExpanded == true
              ? Expanded(
                  child: Container(
                    color: AppColors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          style: titleStyle,
                          text: title,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (isExpanded)
                              Expanded(
                                child: CommonText(
                                  text: subtitle,
                                  style: subtitleStyle,
                                ),
                              )
                            else
                              CommonText(
                                text: subtitle,
                                style: subtitleStyle,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      style: titleStyle,
                      text: title,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isExpanded)
                          Expanded(
                            child: CommonText(
                              text: subtitle,
                              style: subtitleStyle,
                            ),
                          )
                        else
                          CommonText(
                            text: subtitle,
                            style: subtitleStyle,
                          ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
