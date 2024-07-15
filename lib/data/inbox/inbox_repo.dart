import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/utils/color.dart';

import '../../utils/config.dart';
import '../api_client/api_client.dart';

//you want to create,update and get

//create and update api are same

abstract class InboxRepository {
  Future<Map<String, dynamic>?> getUsersDetailsByLoginId({
    required String authtoken,
  }); Future<Map<String, dynamic>?> getInterestRecived({
    required String authtoken,
  });Future<Map<String, dynamic>?> getInterestSent({
    required String authtoken,
  });
}

class InboxRepositoryV1 implements InboxRepository {
  InboxRepositoryV1(this.api);
  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> getUsersDetailsByLoginId({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getNotificationByAccount),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = {"data": json.decode(data)};

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getInterestRecived({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getReceivedInterest),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);


        if (jsonMap['data'] != null && jsonMap["data"].isNotEmpty) {
          return jsonMap;
        }else if (jsonMap['error'] != null) {
          DialogServiceV1().showSnackBar(content: "${jsonMap['error']}", color: AppColors.black, textclr: AppColors.white);
          return {"data":null};
        } else {
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }@override
  Future<Map<String, dynamic>?> getInterestSent({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getSendedInterest),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);


        if (jsonMap['data'] != null && jsonMap["data"].isNotEmpty) {
          return jsonMap;
        }else if (jsonMap['error'] != null) {
          DialogServiceV1().showSnackBar(content: "${jsonMap['error']}", color: AppColors.black, textclr: AppColors.white);
          return {"data":null};
        } else {
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }
}

final inboxRepositoryProvider =
    Provider<InboxRepository>((ref) => InboxRepositoryV1(
          ApiClient(),
        ));
