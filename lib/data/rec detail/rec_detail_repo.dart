import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';

import '../../utils/config.dart';

abstract class RecRepository {
  Future<Map<String, dynamic>?> createRecDetail({
    required String authtoken,
    required String religion,
    required String otherReligion,
    required String denomination,
    required String otherDenomination,
    required String church,
    required String otherChurch,
    required String highestEducation,
    required String otherEducation,
    required String college,
    required String otherCollege,
    required String occupation,
    required String otherOccupation,
    required String occupationDetail,
    required String employedIn,
    required String workLocation,
    required String otherWorkLocation,
  });

  Future<Map<String, dynamic>?> updateRecDetail({
    required String authtoken,
    required String college,
    required String occupation,
    required String occupationDetail,
    required String workLocation,
    String? id,
  });

  // Future<Map<String, dynamic>?> getRecDetailById({
  //   required String authtoken,
  // });

  Future<Map<String, dynamic>?> getRecDetailByLoginAccount({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getRecDetail({
    required String authtoken,
    required String id,
    required String accountId,
    required String employedIn,
    required String occupation,
    required String highestEducation,
    required String religion,
    required String workLocation,
    required String pageNo,
    required String limit,
  });

  Future<Map<String, dynamic>?> deleteRecDetail({
    required String authtoken,
  });
}

class RecRepositoryV1 extends RecRepository {
  final ApiClient api;

  RecRepositoryV1(this.api);

  @override
  Future<Map<String, dynamic>?> createRecDetail({
    required String authtoken,
    required String religion,
    required String otherReligion,
    required String denomination,
    required String otherDenomination,
    required String church,
    required String otherChurch,
    required String highestEducation,
    required String otherEducation,
    required String college,
    required String otherCollege,
    required String occupation,
    required String otherOccupation,
    required String occupationDetail,
    required String employedIn,
    required String workLocation,
    required String otherWorkLocation,
  }) async {
    final body = {
      if (religion != "") "religion": religion,
      if (otherReligion != "") "otherReligion": otherReligion,
      if (denomination != "") "denomination": denomination,
      if (otherDenomination != "") "otherDenomination": otherDenomination,
      if (church != "") "church": church,
      if (otherChurch != "") "otherChurch": otherChurch,
      if (highestEducation != "") "highestEducation": highestEducation,
      if (otherEducation != "") "otherEducation": otherEducation,
      if (college != "") "college": college,
      if (otherCollege != "") "otherCollege": otherCollege,
      if (occupation != "") "occupation": occupation,
      if (otherOccupation != "") "otherOccupation": otherOccupation,
      if (workLocation != "") "workLocation": workLocation,
      if (otherWorkLocation != "") "otherWorkLocation": otherWorkLocation,
      "occupationDetail": occupationDetail,
      "employedIn": employedIn,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createUpdateRECDetails),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          return jsonMap;
        } else {
          return {"data": null};
          // throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> updateRecDetail({
    required String authtoken,
    required String college,
    required String occupation,
    required String occupationDetail,
    required String workLocation,
    String? id,
  }) {
    final body = {
      college: college,
      occupation: occupation,
      occupationDetail: occupationDetail,
      workLocation: workLocation,
      // authtoken: authtoken,
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createUpdateRECDetails + "/$id"),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
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

  // @override
  // Future<Map<String, dynamic>?> getRecDetailById({required String authtoken}) {
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.getuseridaccountURl),
  //     headers: api.createHeaders(authtoken: authtoken),
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
  Future<Map<String, dynamic>?> getRecDetailByLoginAccount(
      {required String authtoken}) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getRECDetailsByAccount),
      headers: api.createHeaders(authtoken: authtoken),
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

  @override
  Future<Map<String, dynamic>?> deleteRecDetail({required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createUpdateRECDetails),
      headers: api.createHeaders(authtoken: authtoken),
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

  @override
  Future<Map<String, dynamic>?> getRecDetail({
    required String authtoken,
    String id = "",
    String accountId = "",
    String employedIn = "",
    String occupation = "",
    String highestEducation = "",
    String religion = "",
    String workLocation = "",
    String pageNo = "",
    String limit = "",
  }) {
    String url = ApiConfig.createUpdateRECDetails;
    if (id != '') {
      url = url + "?id=${id}";
    }
    if (accountId != '') {
      url = url + "?accountId=${accountId}";
    }
    if (employedIn != '') {
      url = url + "?employedIn=${employedIn}";
    }
    if (occupation != '') {
      url = url + "?occupation=${occupation}";
    }
    if (highestEducation != '') {
      url = url + "?highestEducation=${highestEducation}";
    }
    if (religion != '') {
      url = url + "?religion=${religion}";
    }
    if (workLocation != '') {
      url = url + "?workLocation=${workLocation}";
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
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final recRepositoryProvider =
    Provider<RecRepository>((ref) => RecRepositoryV1(ApiClient()));
