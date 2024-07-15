import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

abstract class AboutUsRepository {
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
    // required String authtoken,
    required String title,

  });


  // Future<Map<String, dynamic>?> getAboutUsById({
  //   required String title,
  //   required String description,
  //   required File image,
  //   required String imagePath,
  // });

  Future<Map<String, dynamic>?> deleteAboutUs({
    required String authorization,
    required String id,
  });
}

class AboutUsRepositoryV1 extends AboutUsRepository {
  AboutUsRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createAboutUs({
    required String authorization,
    required String title,
    required String description,
    required File image,
    required String imagePath,
  }) async {
    try {
      final body = {};
      return api.multipartData(
        uri: Uri.parse(ApiConfig.getAboutUs),
        headers: api.createHeaders(authtoken: authorization),
        body: body,
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["Authorization"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
        imageparam: image,
        imagepath: imagePath,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> updateAboutUs({
    required String authorization,
    required String title,
    required String description,
    required File image,
    required String imagePath,
    required String id,
  }) async {
    try {
      final body = {};
      return api.multipartData(
        uri: Uri.parse("${ApiConfig.getAboutUs}/$id"),
        headers: api.createHeaders(authtoken: authorization),
        body: body,
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["Authorization"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
        imageparam: image,
        imagepath: imagePath,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getAboutUs() {
    String url = "${ApiConfig.getAboutUs}";

    return api.getData(
        uri: Uri.parse(url),
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
  Future<Map<String, dynamic>?> getAboutUsByTitle(
      {required String title,
        // required String authtoken,
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


  // @override
  // Future<Map<String, dynamic>?> getAboutUsById(
  //     {required String title,
  //     required String description,
  //     required File image,
  //     required String imagePath}) {
  //   return api.getData(
  //       uri: Uri.parse(ApiConfig.aboutUSURl),
  //       headers: api.createHeaders(authtoken: ""),
  //       builder: (data) {
  //         Map<String, dynamic> jsonMap = json.decode(data);
  //         if (jsonMap["Authorization"] != null) {
  //           return jsonMap;
  //         } else {
  //           throw Exception('Failed..');
  //         }
  //       });
  // }

  @override
  Future<Map<String, dynamic>?> deleteAboutUs({
    required String authorization,
    required String id,
  }) {
    return api.deleteData(
        uri: Uri.parse("${ApiConfig.getAboutUs}/$id"),
        headers: api.createHeaders(authtoken: authorization),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["Authorization"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }
}

final aboutUsProvider = Provider((ref) => AboutUsRepositoryV1(ApiClient()));
