import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/color.dart';
import 'loading_screen_controller.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(loadingScreenControllerProvider);
    controller() => ref.read(loadingScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
      ),
    );
  }
}
