import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bride_reglion_screenDetail_controller.g.dart';

@riverpod
class BrideReglionscreenDetailsController
    extends _$BrideReglionscreenDetailsController {
  List<Map<String, dynamic>> religiousInfo = [
    {
      'Previous Religion': 'christian',
    },
    {
      'Domination': 'Heavenly Feast',
    },
  ];

  List<Map<String, dynamic>> get _religiousInfo => religiousInfo;

  List<Map<String, dynamic>> eduAndCarrier = [
    {
      'Highest education': 'Engineer',
    },
    {
      'Occupation': 'Developer',
    },
    {
      'Occupation In Details': 'Developer',
    },
    {
      'Work Location': 'Canada',
    },
    {
      'Employed In': 'Private',
    },
  ];

  List<Map<String, dynamic>> get _eduAndCarrier => eduAndCarrier;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }
}
