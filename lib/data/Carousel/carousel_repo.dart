import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

abstract class CarouselRepository {

  Future<Map<String, dynamic>?> getCarousel();


  Future<Map<String, dynamic>?> getCarouselByTitle({
    required String title,
  });

}

class CarouselRepositoryV1 extends CarouselRepository {
  CarouselRepositoryV1(this.api);

  final ApiClient api;



  @override
  Future<Map<String, dynamic>?> getCarousel() {
    return api.getData(
        uri: Uri.parse(ApiConfig.getCarousel),
        headers: api.createHeaders(authtoken:""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["data"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> getCarouselByTitle(
      {required String title,
      }) {
    return api.getData(
        uri: Uri.parse(ApiConfig.getAboutUsByTitle),
        headers: api.createHeaders(authtoken: ''),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["title"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }
}

final carouselProvider = Provider((ref) => CarouselRepositoryV1(ApiClient()));
