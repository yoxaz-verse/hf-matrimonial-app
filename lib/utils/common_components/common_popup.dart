import 'package:flutter/material.dart';
import '../import_utils.dart';

import '../globals.dart';

void CommonPopup(
    {required RelativeRect position,
    required List<PopupMenuEntry<dynamic>> items}) async {
  final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
  final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
  await showMenu(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: Globals.navigatorKey.currentContext!,
      position: position,
      items: items);
}
