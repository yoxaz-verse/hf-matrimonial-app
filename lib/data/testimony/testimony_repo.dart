import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

import '../../utils/color.dart';
import '../../utils/globals.dart';

abstract class TestimonyRepository {
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

class TestimonyRepositoryV1 extends TestimonyRepository {
  TestimonyRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createTestimony({
    required String image,
    required String title,
    required String description,
    required String authtoken,
  }) async {
    try {
      final body = {
        'image': image,
        'title': title,
        'description': description,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.getTestimony),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          // 
          if (jsonMap['existingAddress'] != {}) {
            DialogServiceV1().showSnackBar(
                content: "Testimony Added Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            Navigator.of(Globals.navigatorKey.currentContext!).pop();
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      //  
      return null;
    }
  }

  @override
  Future<bool?> deleteTestimony(
      {required String userId, required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse("${ApiConfig.getTestimony}$userId"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        bool jsonMap = json.decode(data);
        DialogServiceV1().showSnackBar(
            content: "Deleted Successfully",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
        // Navigator.pop(Globals.navigatorKey.currentContext!);
        return jsonMap;
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> updateTestimony({
    required String userid,
    required File image,
    required String title,
    required String description,
    required String authtoken,
  }) {
    final body = {
      'userid': userid,
      'image': image,
      'title': title,
      'description': description,
    };
    return api.patchData(
      uri: Uri.parse("${ApiConfig.getTestimony}$userid"),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap != {}) {
          DialogServiceV1().showSnackBar(
              content: "Testimony Updated Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          Navigator.of(Globals.navigatorKey.currentContext!).pop();
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getTestimony(
  // {
    // required String authtoken,
  // }
  ) {
    String url = ApiConfig.getTestimony;

    return api.getData(
      uri: Uri.parse(url),
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final testimonyRepositoryProvider = Provider<TestimonyRepository>(
  (ref) => TestimonyRepositoryV1(
    ApiClient(),
  ),
);
