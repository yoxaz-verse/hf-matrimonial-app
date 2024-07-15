import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/config.dart';
import '../api_client/api_client.dart';

abstract class UserSubscribedRepository {
  Future<Map<String, dynamic>?> createUserSubscription({
    required String subscription,
    required String authorization,
    required String payment,
  });

  Future<Map<String, dynamic>?> getUserSubscription(
      {required String authtoken,
      required String id,
      required String accountId,
      required String pageNo,
      required String limit});

  Future<Map<String, dynamic>?> getUserSubscriptionloging({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> updateUserSubscription({
    required String subscription,
    required String authorization,
    required String payment,
  });
  // Future<Map<String, dynamic>?> getUserSubscriptionId({
  //   required String authtoken,
  // });
  Future<Map<String, dynamic>?> deleteUserSubscription({
    required String authtoken,
  });
}

class UserSubscribedRepositoryV1 extends UserSubscribedRepository {
  UserSubscribedRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createUserSubscription(
      {required String subscription,
      required String authorization,
      required String payment}) async {
    try {
      final body = {
        {"subscription": subscription, "payment": payment}
      };
      return api.postData(
          uri: Uri.parse(ApiConfig.createAndUpdateUserSubscription),
          headers: api.createHeaders(authtoken: authorization),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            return jsonMap;
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserSubscription({
    required String authtoken,
    String id = "",
    String accountId = "",
    String pageNo = "",
    String limit = "",
  }) {
    String url = ApiConfig.createAndUpdateUserSubscription;
    if (id != '') {
      url = url + "?id = ${id}";
    }
    if (accountId != '') {
      url = url + "?accountId = ${accountId}";
    }
    if (pageNo != '') {
      url = url + "?pageNo = ${pageNo}";
    }
    if (limit != '') {
      url = url + "?limit = ${limit}";
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
        });
  }

  @override
  Future<Map<String, dynamic>?> getUserSubscriptionloging(
      {required String authtoken}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.userSubscriptionByLogin),
        headers: api.createHeaders(authtoken: authtoken),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["success"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }

  // @override
  // Future<Map<String, dynamic>?> getUserSubscriptionId({required String authtoken}) {
  //   return api.getData(
  //       uri: Uri.parse(ApiConfig.createAndUpdateUserSubscription),
  //       headers: api.createHeaders(authtoken: authtoken),
  //       builder: (data){
  //         Map<String, dynamic> jsonMap = json.decode(data);
  //         if (jsonMap["authtoken"]!= null) {
  //           return jsonMap;
  //         } else {
  //           throw Exception('Failed..');
  //         }
  //       });
  // }
  @override
  Future<Map<String, dynamic>?> updateUserSubscription(
      {required String subscription,
      required String authorization,
      required String payment}) async {
    try {
      final body = {
        {"subscription": subscription, "payment": payment}
      };
      return api.putData(
          uri: Uri.parse(ApiConfig.createAndUpdateUserSubscription),
          headers: api.createHeaders(authtoken: authorization),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            return jsonMap;
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> deleteUserSubscription(
      {required String authtoken}) {
    return api.deleteData(
        uri: Uri.parse(ApiConfig.createAndUpdateUserSubscription),
        headers: api.createHeaders(authtoken: authtoken),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["authtoken"] != null) {

            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        });
  }
}

final userSubscribedRepositoryProvider = Provider<UserSubscribedRepositoryV1>(
    (ref) => UserSubscribedRepositoryV1(ApiClient()));
