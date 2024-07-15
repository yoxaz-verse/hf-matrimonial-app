import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';
import '../../utils/config.dart';
import '../api_client/api_client.dart';

//you want to create,update and get

//create and update api are same

abstract class HomeRepository {
  Future<Map<String, dynamic>?> getAllUserCardsData({
    required String authtoken,
    required String lastKey,
    required int limit,
  });

  Future<Map<String, dynamic>?> getAllUserCardsDataOfNewMatches({
    required String authtoken,
    required String lastKey,
    required int limit,
  });

  Future<Map<String, dynamic>?> getAllUserCardsDataOfingMembers({
    required String authtoken,
    required String lastKey,
    required int limit,
  });

  Future<Map<String, dynamic>?> getUsersCardFullDetailsById({
    required String authtoken,
    required String accountId,
  });

  Future<Map<String, dynamic>?> getAllUserCardsDataBySearch({
    required String authtoken,
    required String accountId,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String country,
    required String state,
    required String profileId,
    required String lastKey,
    required int limit,
    required String name,
  });
}

class HomeRepositoryV1 implements HomeRepository {
  HomeRepositoryV1(this.api);
  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> getAllUserCardsData({
    required String authtoken,
    required String lastKey,
    required int limit,
  }) async {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getDetail}?lastKey=$lastKey&limit=$limit"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["data"] != null && jsonMap['data'] != []) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          return jsonMap;
        } else {
          return {"data": null};

          // throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllUserCardsDataOfNewMatches({
    required String authtoken,
    required String lastKey,
    required int limit,
  }) async {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getDetailNewMatches}?lastKey=$lastKey&limit=$limit"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["data"] != null && jsonMap['data'] != []) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          return jsonMap;
        } else {
          return {"data": null};

          // throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllUserCardsDataOfingMembers({
    required String authtoken,
    required String lastKey,
    required int limit,
  }) async {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getDetailMatchingMembers}?limit=${limit}&lastKey=${lastKey}"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["data"] != null && jsonMap['data'] != []) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          return jsonMap;
        } else {
          return {"data": null};

          // throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllUserCardsDataBySearch({
    required String authtoken,
    required String accountId,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String country,
    required String state,
    required String profileId,
    required String lastKey,
    required int limit,
    required String name,
  }) async {
    String url = ApiConfig.getDetailByAllParametersAndSearch;
    if (accountId != '') url = url + "accountId=${accountId}&";
    if (minAge != '') url = url + "minAge=${minAge}&";
    if (maxAge != '') url = url + "maxAge=${maxAge}&";
    if (minHeight != '') url = url + "minHeight=${minHeight}&";
    if (maxHeight != '') url = url + "maxHeight=${maxHeight}&";
    if (gender != '') url = url + "gender=${gender}&";
    if (martialStatus != '') url = url + "martialStatus=${martialStatus}&";
    if (religion != '') url = url + "religion=${religion}&";
    if (education != '') url = url + "education=${education}&";
    if (occupation != '') url = url + "occupation=${occupation}&";
    if (employedIn != '') url = url + "employedIn=${employedIn}&";
    if (country != '') url = url + "country=${country}&";
    if (state != '') url = url + "state=${state}&";
    if (profileId != '') url = url + "accountCustomId=${profileId}&";
    if(lastKey!='')url=url+"lastKey=${lastKey}&";
    if (limit != '') url = url + "limit=${limit}&";
    if (name != '') url = url + "name=${name}&";

    return api.getData(
      uri: Uri.parse(url),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["data"] != null && jsonMap['data'] != []) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap["error"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;
        } else {
          return {"data": null};
          // throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getUsersCardFullDetailsById({
    required String authtoken,
    required String accountId,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getDetailByAccountId}${accountId}"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != null) {
          return jsonMap;
        } else if (jsonMap['error'] != null || jsonMap['message'] != null) {
          DialogServiceV1().showSnackBar(
              content:
                  "${jsonMap['error'] ?? jsonMap['message'] ?? "Server Error"}",
              color: AppColors.red.withOpacity(0.7),
              textclr: AppColors.white);
          return {"data": null};
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }
}

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) => HomeRepositoryV1(
          ApiClient(),
        ));
