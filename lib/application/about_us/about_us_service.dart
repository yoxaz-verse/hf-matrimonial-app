import 'dart:io';

import 'package:heavenlymatrimony/data/about_us/about_us_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class AboutUsService {
  Future<Map<String, dynamic>?> createAboutUs({
    required String authorization,
    required String title,
    required String description,
    required File image,
    required String imagePath,
  });

  Future<Map<String, dynamic>?> updateAboutUs({
    required String authorization,
    required String title,
    required String description,
    required File image,
    required String imagePath,
    required String id,
  });

  Future<Map<String, dynamic>?> getAboutUs();


  Future<Map<String, dynamic>?> getAboutUsByTitle({
    required String title,
    // required String authtoken,
  });

  // Future<Map<String, dynamic>?> getAboutUsById({
  //   required String title,
  //   required String description,
  //   required File image,
  //   required String imagePath,
  //   required String id,
  // });


  Future<Map<String, dynamic>?> deleteAboutUs({
    required String authorization,
    required String id,
  });
}

class AboutUsServiceV1 extends AboutUsService {
  AboutUsServiceV1(this.aboutUsRepository);

  final AboutUsRepository aboutUsRepository;

  @override
  Future<Map<String, dynamic>?> createAboutUs({
    required String authorization,
    required String title,
    required String description,
    required File image,
    required String imagePath,
  }) {
    return aboutUsRepository.createAboutUs(
        authorization: authorization,
        title: title,
        description: description,
        image: image,
        imagePath: imagePath);
  }

  @override
  Future<Map<String, dynamic>?> updateAboutUs(
      {required String authorization,
      required String title,
      required String description,
      required File image,
      required String imagePath,
      required String id}) {
    return aboutUsRepository.updateAboutUs(
        authorization: authorization,
        title: title,
        description: description,
        image: image,
        imagePath: imagePath,
        id: id);
  }

  @override
  Future<Map<String, dynamic>?> getAboutUs() {
    return aboutUsRepository.getAboutUs();
  }


  @override
  Future<Map<String, dynamic>?> getAboutUsByTitle(
      {required String title,
        // required String authtoken,
      }) {
    return aboutUsRepository.getAboutUsByTitle(
        title: title,
       );
  }

  // @override
  // Future<Map<String, dynamic>?> getAboutUsById(
  //     {required String title,
  //     required String description,
  //     required File image,
  //     required String imagePath,
  //     required String id}) {
  //   return aboutUsRepository.getAboutUsById(
  //       title: title,
  //       description: description,
  //       image: image,
  //       imagePath: imagePath);
  // }


  @override
  Future<Map<String, dynamic>?> deleteAboutUs({
    required String authorization,
    required String id,
  }) {
    return aboutUsRepository.deleteAboutUs(
      authorization: authorization,
      id: id,
    );
  }
}

final aboutUsServiceProvider = Provider.autoDispose<AboutUsService>((ref) {
  final service = AboutUsServiceV1(
    ref.watch(aboutUsProvider),
  );
  return service;
});
