import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CommonCarousel extends ConsumerWidget {
  CommonCarousel(
      {Key? key,
      required this.enlargeFactor,
      required this.containerheight,
      required this.containerwidth,
      required this.viewportFraction,
      required this.scrollDirection,
      required this.autoPlayCurve,
      required this.aspectRatio,
      required this.itemBuilder,
      required this.enableInfiniteScroll,
       this.ispageIndicatorInside = true,
      required this.autoPlay,
      required this.reverse,
      required this.itemCount,
      required this.carouselHeight,
      required this.dotindicator,
      required this.carouselController,
      required this.disableGesture,
      required this.padding,
      required this.gradient,
      this.enlargeCenterPage,
      this.getcurrentPageIndex,
      this.items,
      this.onPageChanged})
      : super(key: key);
  List<Widget>? items;

  double enlargeFactor;
  double viewportFraction;
  bool dotindicator;
  double aspectRatio;
  double carouselHeight;
  double containerwidth;
  Curve autoPlayCurve;
  Axis scrollDirection;
  bool? enlargeCenterPage;
  bool enableInfiniteScroll;
  bool autoPlay;
  bool ispageIndicatorInside;
  bool reverse;
  bool gradient;
  int itemCount;
  int? getcurrentPageIndex;

  bool disableGesture;
  double containerheight;
  Widget Function(BuildContext, int, int)? itemBuilder;
  CarouselController carouselController;
  EdgeInsetsGeometry padding;
  dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: padding,
          child: CarouselSlider.builder(
            itemBuilder: itemBuilder,
            options: CarouselOptions(
              height: carouselHeight,
              aspectRatio: aspectRatio,
              viewportFraction: viewportFraction,
              initialPage: 0,
              enableInfiniteScroll: enableInfiniteScroll,
              reverse: reverse,
              autoPlay: autoPlay,
              autoPlayInterval: Duration(seconds: 1),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayCurve: autoPlayCurve,
              enlargeCenterPage: enlargeCenterPage,
              enlargeFactor: enlargeFactor,
              onPageChanged: onPageChanged,
              scrollDirection: scrollDirection,
            ),
            disableGesture: disableGesture,
            carouselController: carouselController,
            itemCount: itemCount,
          ),
        ),
        if (dotindicator == true)
          Positioned(
            bottom: ispageIndicatorInside?h*0.07:h*0.03,
            left: 0,right: 0,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  itemCount,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                        child: Container(    height: h * 0.016,
                          width: h * 0.016,
                          decoration: BoxDecoration(shape: BoxShape.circle,
                            gradient: getcurrentPageIndex == index
                                ? LinearGradient(

                                begin: Alignment.bottomLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.gradBlack
                                      .withOpacity(0.7),
                                  AppColors.white
                                      .withOpacity(0.9),
                                ]) : null,
                          ),
                          child: Container(
                            height: h * 0.015,
                            width: h * 0.015, margin: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                                color: getcurrentPageIndex == index
                                    ? AppColors.yellow
                                    : gradient == true
                                        ? AppColors.white
                                        : AppColors.dotColor,
                                gradient:
                                    gradient == true && getcurrentPageIndex == index
                                        ? LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                                AppColors.gradient1,
                                                AppColors.gradient2
                                              ])
                                        : null,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      )),
            ),
          ),
      ],
    );
  }
}
