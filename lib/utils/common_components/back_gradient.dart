import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class BackGradient extends ConsumerWidget {
  const BackGradient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[AppColors.colorPrimary, AppColors.colorSecondary],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -w * 0.2,
            top: -h * 0.03,
            child: Column(
              children: [
                Container(
                  width: w * 0.5,
                  height: h * 0.23,
                  decoration: const BoxDecoration(
                    color: AppColors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -w * 0.36,
            top: h * 0.13,
            child: Column(
              children: [
                Container(
                  width: w * 0.6,
                  height: h * 0.3,
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -w * 0.22,
            bottom: -h * 0.11,
            child: Column(
              children: [
                Container(
                  width: w * 0.6,
                  height: h * 0.3,
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
