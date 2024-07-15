import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

abstract class OfferRepo {
  Future<Map<String, dynamic>?> createOffer({
    required String authorization,
    required String code,
    required String discount,
    required bool isPrice,
    required bool isOneTime,
  });

  Future<Map<String, dynamic>?> updateOffer({
    required String authorization,
    required String code,
    required String discount,
    required bool isPrice,
    required bool isOneTime,
  });

  // Future<Map<String, dynamic>?> getOfferById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getOffer({
    required String id,
    required String code,
    required String pageNo,
    required String limit,
  });

  Future<Map<String, dynamic>?> getOfferByCode({
    required String code,
  });

  Future<Map<String, dynamic>?> deleteOffer({
    required String authorization,
  });
}

class OfferRepoV1 extends OfferRepo {
  OfferRepoV1(this.api);
  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createOffer(
      {required String authorization,
      required String code,
      required String discount,
      required bool isPrice,
      required bool isOneTime}) async {
    try {
      final body = {
        {
          "code": code,
          "discount": discount,
          "isPrice": isPrice,
          "isOneTime": isOneTime
        }
      };
      return api.postData(
          uri: Uri.parse(ApiConfig.getOffer),
          headers: api.createHeaders(authtoken: authorization),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["success"] = true) {
              return jsonMap;
            } else {
              throw Exception('Failed..');
            }
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> updateOffer(
      {required String authorization,
      required String code,
      required String discount,
      required bool isPrice,
      required bool isOneTime}) {
    return api.putData(
        uri: Uri.parse(ApiConfig.getOffer),
        headers: api.createHeaders(authtoken: authorization),
        body: {
          {
            "code": code,
            "discount": discount,
            "isPrice": isPrice,
            "isOneTime": isOneTime
          }
        },
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["success"] = true) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }

  // @override
  // Future<Map<String, dynamic>?> getOfferById({required String id}) {
  //   return api.postData(
  //       uri: Uri.parse(ApiConfig.offerURl + "{$id}"),
  //       headers: api.createHeaders(authtoken: ""),
  //       body: {},
  //       builder: (data) {
  //         Map<String, dynamic> jsonMap = json.decode(data);
  //         if (jsonMap["id"] != null) {
  //           return jsonMap;
  //         } else {
  //           throw Exception('Failed..');
  //         }
  //       });
  // }

  @override
  Future<Map<String, dynamic>?> getOffer({
    String id = "",
    String code = "",
    String pageNo = "",
    String limit = "",
  }) {
    String url = ApiConfig.getOffer;
    if (id != '') {
      url = url + "?id=${id}";
    }
    if (code != '') {
      url = url + "?code=${code}";
    }
    if (pageNo != '') {
      url = url + "?pageNo=${pageNo}";
    }
    if (limit != '') {
      url = url + "?limit=${limit}";
    }

    return api.putData(
        uri: Uri.parse(url),
        headers: api.createHeaders(authtoken: ""),
        body: {},
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["id"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> getOfferByCode({required String code}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.getOffer + "{$code}"),
        headers: api.createHeaders(authtoken: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["code"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> deleteOffer({required String authorization}) {
    return api.deleteData(
        uri: Uri.parse(ApiConfig.getOffer),
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

final offerProvider = Provider((ref) => OfferRepoV1(ApiClient()));
