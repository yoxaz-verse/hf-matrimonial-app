import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/common_components/common_loader.dart';

import '../../../utils/color.dart';
import '../../utils/globals.dart';

class LoaderDialogue extends ConsumerWidget {
  const LoaderDialogue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(
      key: Globals.loaderKey,
      surfaceTintColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.only(
        bottom: h * 0.38,
        top: h * 0.1,
        left: w * 0.1,
        right: w * 0.1,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: Container(
        width: w,
        height: h * 0.45,
        color: AppColors.transparent,
        child: CommonLoader(
          color: AppColors.transparent,
        ),
      ),
    );
  }
}
