import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

commonNavigator(
    {required BuildContext context,
    required Widget child,
    Duration? duration,
    required PageTransitionType type}) {
  // Navigator.push(Globals.navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (context) => child));
  Navigator.push(
      context,
      PageTransition(
          child: child,
          type: type,
          duration: duration ?? const Duration(milliseconds: 350)));
}
