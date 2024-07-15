import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/config.dart';
import '../api_client/api_client.dart';

abstract class UserRepository {
  Future<Map<String, dynamic>?> createUser({
    required String phoneNumber,
  });

  Future<Map<String, dynamic>?> getUser({
    required String authorization,
  });

  Future<Map<String, dynamic>?> updateUser({
    required String phoneCode,
    required String phoneNumber,
  });
}

class UserRepositoryV1 extends UserRepository {
  UserRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createUser({
    required String phoneNumber,
  }) async {
    try {
      final body = {
        {"phoneNumber": phoneNumber}
      };
      return api.postData(
          uri: Uri.parse(ApiConfig.createAndUpdateUser),
          headers: api.createHeaders(authtoken: ""),
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
  Future<Map<String, dynamic>?> getUser({required String authorization}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.getAllUser),
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

  @override
  Future<Map<String, dynamic>?> updateUser({
    required String phoneCode,
    required String phoneNumber,
  }) {
    return api.putData(
        uri: Uri.parse(ApiConfig.createAndUpdateUser),
        headers: api.createHeaders(authtoken: ""),
        body: {
          {"phoneCode": phoneCode, "phoneNumber": phoneNumber}
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
}

final userRepositoryProvider =
    Provider<UserRepositoryV1>((ref) => UserRepositoryV1(ApiClient()));
