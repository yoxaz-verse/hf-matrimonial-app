import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dialog_screen_controller.g.dart';


@riverpod
class DialogScreenController extends _$DialogScreenController {

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }
}