import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';
import 'package:heavenlymatrimony/utils/globals.dart';

import '../../utils/color.dart';

abstract class InterestRepository {
  Future<Map<String, dynamic>?> createInterest({
    required String reason,
    required String receiverId,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updateInterest({
    required String reason,
    required String receiverId,
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getInterestById({
  //   required String userid,
  //   required String authtoken,
  // });

  Future<Map<String, dynamic>?> getsendedInterest({
    required String userid,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getreceivedInterest({
    required String userid,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> getInterest({
    required String authtoken,
    String id = "",
    String senderId = "",
    String receiverId = "",
    String pageNo = "",
    String limit = "",
  });
  Future<bool?> deleteInterest({
    required String userId,
    required String authtoken,
  });
}

class InterestRepositoryV1 extends InterestRepository {
  InterestRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createInterest(
      {required String reason,
      required String receiverId,
      required String authtoken}) async {
    try {
      final body = {
        'reason': reason,
        'receiverId': receiverId,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.createInterest),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          // 
          if (jsonMap['data'] != {}) {


            DialogServiceV1().showSnackBar(
                content: "Interest Added Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
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
  Future<bool?> deleteInterest(
      {required String userId, required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse("${ApiConfig.createInterest}$userId"),
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
  Future<Map<String, dynamic>?> getInterest({
    required String authtoken,
    String id = "",
    String senderId = "",
    String receiverId = "",
    String pageNo = "",
    String limit = "",
  }) async {

    String url = ApiConfig.createInterest;

    if (id != '') {
      url = url + "?id=${id}";
    }
    if (senderId != '') {
      url = url + "?senderId=${senderId}";
    }
    if (receiverId != '') {
      url = url + "?receiverId=${receiverId}";
    }
    if (pageNo != '') {
      url = url + "?pageNo=${pageNo}";
    }
    if (limit != '') {
      url = url + "?limit=${limit}";
    }
    return api.getData(
      uri: Uri.parse(url),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["id"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getInterestById(
      {required String userid, required String authtoken}) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.createInterest}?_id=$userid"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }


  @override
  Future<Map<String, dynamic>?> getsendedInterest(
      {required String userid, required String authtoken}) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getSendedInterest}?_id=$userid"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getreceivedInterest(
      {required String userid, required String authtoken}) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getReceivedInterest}?_id=$userid"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> updateInterest(
      {required String reason,
      required String receiverId,
      required String authtoken}) {
    final body = {
      'reason': reason,
      'receiverId': receiverId,
    };
    return api.patchData(
      uri: Uri.parse("${ApiConfig.createInterest}$receiverId"),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap != {}) {
          DialogServiceV1().showSnackBar(
              content: "Interest Updated Successfully",
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
}

final interestRepositoryProvider =
    Provider<InterestRepository>((ref) => InterestRepositoryV1(
          ApiClient(),
        ));
