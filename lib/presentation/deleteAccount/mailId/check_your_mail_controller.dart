import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';


part 'check_your_mail_controller.g.dart';

@riverpod
class CheckMailController extends _$CheckMailController {
  TextEditingController emailController = TextEditingController();


  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

}