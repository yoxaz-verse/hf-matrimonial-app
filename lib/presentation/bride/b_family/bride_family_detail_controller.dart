
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'bride_family_detail_controller.g.dart';



@riverpod
class brideFamilyDetailsController extends _$brideFamilyDetailsController {

  List<Map<String, dynamic>> familyDetails = [
    {
      'Father Name': 'John',
    },
    {
      'Father Occupation': 'Developer',
    },
    {
      'Mother Name': 'Maria',
    },
    {
      'Mother Occupation': 'Private',
    },
    {
      'Number Of Brothers': '03',
    },
    {
      'Number Of Sisters': '03',
    },
  ];


  List<Map<String, dynamic>> get _familyDetails => familyDetails;


  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }
}
