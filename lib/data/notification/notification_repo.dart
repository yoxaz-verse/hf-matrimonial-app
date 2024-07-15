import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';

import '../../utils/config.dart';

abstract class NotificationRepository {
  Future<Map<String, dynamic>?> createNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  });

  Future<Map<String, dynamic>?> updateNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  });

  Future<Map<String, dynamic>?> getNotification({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAdminNotificationOfLoginUser({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getNotificationById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> deleteNotification({
    required String authtoken,
  });
}

class NotificationRepositoryV1 extends NotificationRepository {
  final ApiClient api;

  NotificationRepositoryV1(this.api);

  Future<Map<String, dynamic>?> createNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  }) async {
    final body = {
      "accountId": accountId,
      "title": title,
      "description": description,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createAndUpdateNotification),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> updateNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
    String? id = "",
  }) {
    final body = {
      accountId: accountId,
      title: title,
      description: description

      // authtoken: authtoken,
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createAndUpdateNotification + "{$id}"),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getNotification({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.createAndUpdateNotification),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAdminNotificationOfLoginUser({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getNotificationByAccount),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null && jsonMap["data"].isNotEmpty && jsonMap["data"].runtimeType == List<dynamic>) {
          return jsonMap;
        } else if (jsonMap["error"] != null ) {
          return {"data":null};
        } else {
          return {"data":null};
          // throw Exception('Failed..');
        }
      },
    );
  }

  // Future<Map<String, dynamic>?> getNotificationById({
  //   required String id,
  // }) {
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.notificationURl + "$id"),
  //     headers: api.createHeaders(authtoken: ""),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["data"] != null) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> deleteNotification(
      {required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createAndUpdateNotification),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final notificationRepositoryProvider = Provider<NotificationRepository>(
    (ref) => NotificationRepositoryV1(ApiClient()));
