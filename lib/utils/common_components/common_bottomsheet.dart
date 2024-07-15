import 'package:flutter/material.dart';

import '../color.dart';
import '../globals.dart';

void CommonBottomsheet() {
  showModalBottomSheet(
      context: Globals.navigatorKey.currentContext!,
      builder: (context) {
        return Container(
          height: 200,
          color: AppColors.gradient2,
        );
      });
}
