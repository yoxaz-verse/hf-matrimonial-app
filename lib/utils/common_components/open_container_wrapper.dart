import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class OpenContainerWrapper extends ConsumerWidget {
  Widget child;
  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  Duration transitionDuration;

  OpenContainerWrapper({
    super.key,
    required this.child,
    required this.closedBuilder,
    required this.transitionDuration,
    required this.transitionType,
    required this.onClosed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openElevation: 0,
      closedElevation: 0,
      middleColor: AppColors.transparent,
      clipBehavior: Clip.none,
      routeSettings: const RouteSettings(name: 'openContainer'),
      closedShape: const RoundedRectangleBorder(),
      openShape: const RoundedRectangleBorder(),
      openBuilder: (BuildContext context, VoidCallback _) {
        return child;
      },
      useRootNavigator: true,
      transitionDuration: transitionDuration,
      openColor: AppColors.transparent,
      closedColor: AppColors.transparent,
      onClosed: onClosed,
      tappable: true,
      closedBuilder: closedBuilder,
    );
  }
}
