import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/testimony/testimony_repo.dart';

abstract class TestimonyService {
  Future<Map<String, dynamic>?> createTestimony({
    required String image,
    required String title,
    required String description,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> updateTestimony({
    required String userid,
    required File image,
    required String title,
    required String description,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getTestimony(
  // {
    // required String authtoken,
  // }
  );

  Future<bool?> deleteTestimony({
    required String userId,
    required String authtoken,
  });
}

class TestimonyServiceV1 implements TestimonyService {
  TestimonyServiceV1(
    this.testimonyRepository,
  );

  final TestimonyRepository testimonyRepository;

  @override
  Future<Map<String, dynamic>?> createTestimony(
      {required String image,
      required String title,
      required String description,
      required String authtoken}) async {
    return testimonyRepository.createTestimony(
        image: image,
        title: title,
        description: description,
        authtoken: authtoken);
  }

  @override
  Future<bool?> deleteTestimony(
      {required String userId,
        required String authtoken}) {
    return testimonyRepository.deleteTestimony(
      userId: userId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getTestimony(
      // {
        // required String authtoken,
      // }
      ) async {
    return testimonyRepository.getTestimony(
      // authtoken : authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> updateTestimony(
      {required String userid,
      required File image,
      required String title,
      required String description,
      required String authtoken}) {
    return testimonyRepository.updateTestimony(
        userid: userid,
        image: image,
        title: title,
        description: description,
        authtoken: authtoken);
  }}
final testimonyServiceProvider = Provider.autoDispose<TestimonyService>((ref) {
  final service = TestimonyServiceV1(
    ref.watch(testimonyRepositoryProvider),
  );
  return service;
});
