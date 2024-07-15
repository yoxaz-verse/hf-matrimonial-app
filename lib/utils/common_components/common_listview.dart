import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../import_utils.dart';

class CommonListView extends ConsumerWidget {
  int itemCount;
  Axis scrollDirection;
  bool shrinkWrap;
  double width;
  double height;
  ScrollController? controller;
  EdgeInsetsGeometry? padding;
  ScrollPhysics? physics;
  Widget? Function(BuildContext, int) itemBuilder;

  CommonListView(
      {Key? key,
      required this.itemCount,
      required this.scrollDirection,
      required this.shrinkWrap,
      required this.padding,
      required this.width,
      required this.height,
      this.controller,
      this.physics,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: itemCount != 0
          ? ListView.builder(
    addAutomaticKeepAlives: true ,
              controller: controller,
              itemCount: itemCount,
              physics: physics,
              scrollDirection: scrollDirection,
              shrinkWrap: shrinkWrap,
              itemBuilder: itemBuilder)
          : Center(
              child: noDataCommonText(
                  style: juraTextStyle(
                      fontSize: h * 0.025,
                      overflow: TextOverflow.ellipsis,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ],
                        ).createShader(const Rect.fromLTRB(105, 0, 280, 10)),
                      fontWeight: FontWeight.w600)),
            ),
    );
  }
}
