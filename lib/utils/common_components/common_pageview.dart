import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CommonPageView extends ConsumerWidget {
  CommonPageView(
      {super.key,
      required this.dotindicator,
      required this.scrollDirection,
      required this.pageSnapping,
      required this.reverse,
      required this.gradient,
      required this.padEnds,
      required this.itemBuilder,
      required this.itemCount,
      required this.pageController,
      required this.padding,
      required this.containerHeight,
      required this.containerwidth,
      this.getcurrentPageIndex,
      this.allowImplicitScrolling,
      this.physics,
      this.dragStartBehavior,
      this.findChildIndexCallback,
      this.restorationId,
      this.scrollBehavior,
      this.clipBehavior,
      required this.onPageChanged});

  bool dotindicator;
  Axis scrollDirection;
  bool pageSnapping;
  bool reverse;
  bool gradient;
  bool padEnds;
  int itemCount;
  int? getcurrentPageIndex;

  bool? allowImplicitScrolling;

  Widget? Function(BuildContext, int) itemBuilder;
  PageController pageController;
  int? Function(Key)? findChildIndexCallback;
  EdgeInsetsGeometry padding;
  DragStartBehavior? dragStartBehavior;
  void Function(int) onPageChanged;
  String? restorationId;
  double containerHeight;
  double containerwidth;
  ScrollPhysics? physics;
  ScrollBehavior? scrollBehavior;
  Clip? clipBehavior;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Container(
            height: containerHeight,
            width: containerwidth,
            child: PageView.builder(
                scrollDirection: scrollDirection,
                reverse: reverse,
                physics: physics,
                pageSnapping: pageSnapping,
                findChildIndexCallback: findChildIndexCallback,
                dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
                allowImplicitScrolling: allowImplicitScrolling ?? true,
                restorationId: restorationId,
                clipBehavior: clipBehavior ?? Clip.hardEdge,
                scrollBehavior: scrollBehavior,
                padEnds: padEnds,
                controller: pageController,
                onPageChanged: (index) {
                  onPageChanged(index);
                },
                itemCount: itemCount,
                itemBuilder: itemBuilder),
          ),
        ),
        if (dotindicator == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                itemCount,
                (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      child: Container(
                        height: h * 0.01,
                        width: h * 0.01,
                        decoration: BoxDecoration(
                            color: getcurrentPageIndex == index
                                ? AppColors.yellow
                                : gradient == true
                                    ? AppColors.dotColor
                                    : AppColors.white,
                            gradient:
                                gradient == true && getcurrentPageIndex == index
                                    ? const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                            AppColors.colorPrimary,
                                            AppColors.colorSecondary
                                          ])
                                    : null,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
          ),
      ],
    );
  }
}
