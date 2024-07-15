import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bride_contact_detail_controller.g.dart';




@riverpod
class BrideContactDetailsController extends _$BrideContactDetailsController {

  List<Map<String, dynamic>> contactDetails = [
    {
      'Contact Number': '+91879654782',
    },
    {
      'Address': 'Lorem Ipsum Is ',
    },
  ];


  List<Map<String, dynamic>> get _contactDetails => contactDetails;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }
}

