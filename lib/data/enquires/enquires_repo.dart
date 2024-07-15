import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

abstract class EnquiresRepository {
  Future<Map<String, dynamic>?> createEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  });

  Future<Map<String, dynamic>?> getEnquires({
    required String authToken,
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  });

  Future<Map<String, dynamic>?> getEnquiresById({
    required String authToken,
    required String id,
  });

  Future<Map<String, dynamic>?> getAssignedEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> getActiveEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> getCloseEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> deleteEnquires({
    required String authToken,
  });
}

class EnquiresRepositoryV1 extends EnquiresRepository {
  EnquiresRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  }) async {
    try {
      final body = {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "message": message

      };
      return api.postData(
          uri: Uri.parse(ApiConfig.createEnquire),
          headers: api.createHeaders(authtoken: ''),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["data"] != null) {
              return jsonMap;
            } else {
              throw Exception('Failed...');
            }
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
    required String authToken,
  }) {
    return api.getData(
        uri: Uri.parse(ApiConfig.createEnquire),
        headers: api.createHeaders(authtoken: ''),
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
  Future<Map<String, dynamic>?> getEnquiresById(
      {required String authToken, required String id}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.createEnquire + "{$id}"),
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["authorization"] != null) {
              return jsonMap;
            } else {
              throw Exception('Failed..');
            }
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> getAssignedEnquires({
    required String authToken,
  }) {
    return api.getData(
        uri: Uri.parse(ApiConfig.assignedEnquire),
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["authorization"] != null) {
              return jsonMap;
            } else {
              throw Exception('Failed..');
            }
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> getActiveEnquires({required String authToken}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.activeEnquire),
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["authorization"] != null) {
              return jsonMap;
            } else {
              throw Exception('Failed..');
            }
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> getCloseEnquires({required String authToken}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.closedEnquire),
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["authorization"] != null) {
              return jsonMap;
            } else {
              throw Exception('Failed..');
            }
          }
        });
  }

  @override
  Future<Map<String, dynamic>?> deleteEnquires({required String authToken}) {
    return api.deleteData(
        uri: Uri.parse(ApiConfig.createEnquire),
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap["authorization"] != null) {
            return jsonMap;
          } else {
            throw Exception("Failed..");
          }
        });
  }
}

final enquiresProvider = Provider((ref) => EnquiresRepositoryV1(ApiClient()));
