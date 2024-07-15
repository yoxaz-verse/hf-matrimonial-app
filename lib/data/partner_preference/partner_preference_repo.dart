import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/config.dart';

abstract class PartnerPreferenceRepository {
  Future<Map<String, dynamic>?> createPartnerPreference({
    required String authtoken,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String otherMartialStatus,
    required String otherGender,
    required String martialStatus,
    required String religion,
    required String otherPreferredReligion,
    required String education,
    required String otherPreferredEducation,
    required String occupation,
    required String otherPreferredOccupation,
    required String others,
    required String state,
    required String country,
    // required String location,
  });


  Future<Map<String, dynamic>?> createLocation({
    required String country,
    required String state,
  });

  Future<Map<String, dynamic>?> updatePartnerPreference({
    required String authorization,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String others,
    required String country,
    required String state,
  });

  // Future<Map<String, dynamic>?> getPartnerPreferenceById({
  //   required String authorization,
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getPartnerPreferenceByLoginAccount({
    required String authorization,
  });

  Future<Map<String, dynamic>?> deletePartnerPreference({
    required String authorization,
  });

  Future<Map<String, dynamic>?> getPartnerPreference({
    required String authorization,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String others,
    required String country,
    required String state,
    required String pageNo,
    required String limit,
  });

  Future<Map<String, dynamic>?> getLocation({
    required String authtoken,
  });
}

class PartnerPreferenceRepositoryV1 extends PartnerPreferenceRepository {
  PartnerPreferenceRepositoryV1(this.api);
  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createPartnerPreference(
      {required String authtoken,
      required String minAge,
      required String maxAge,
      required String minHeight,
      required String maxHeight,
      required String gender,
      required String otherGender,
      required String martialStatus,
      required String otherMartialStatus,
      required String religion,
      required String otherPreferredReligion,
      required String education,
      required String otherPreferredEducation,
      required String occupation,
      required String otherPreferredOccupation,
      required String others,
      required String state,
      required String country,
      // required String location,
      }) async {
    try {
      final body = {

          if(minAge!='')"minAge": minAge,
          if(maxAge!='')"maxAge": maxAge,
          if(minHeight!='')"minHeight": minHeight,
          if(maxHeight!='')"maxHeight": maxHeight,
          if(gender!='')"Gender": gender,
          if(otherGender!='')"otherGender": otherGender,
          if(martialStatus!='')"MartialStatus": martialStatus,
          if(religion!='')"Religion": religion,
          if(otherPreferredReligion!='')"otherPreferredReligion": otherPreferredReligion,
          if(education!='')"Education": education,
          if(otherPreferredEducation!='')"otherPreferredEducation": otherPreferredEducation,
          if(occupation!='')"Occupation": occupation,
          if(otherPreferredOccupation!='')"otherPreferredOccupation": otherPreferredOccupation,


          if(otherMartialStatus!='')"otherMartialStatus": otherMartialStatus,
          if(others!='')"others": others,
          if(state!='')"state": state,
          if(country!='')"country": country,
          // if(location!='')"location": location,
      };
      return api.postData(
          uri: Uri.parse(ApiConfig.createUpdatePartnerPreferences),
          headers: api.createHeaders(authtoken: authtoken),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["success"] = true) {
              return jsonMap;
            } else {
              return {"data":null};
              throw Exception('Failed..');
            }
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> createLocation(
      {
        required String country,
        required String state,
      }) async {
    try {
      final body = {
        if(country!='')"country": country,
        if(state!='')"state": state,
      };
      return api.postData(
          uri: Uri.parse(ApiConfig.createLocation),
          headers: api.createHeaders(authtoken: ""),
          body: body,
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            if (jsonMap["success"] = true) {
              return jsonMap;
            } else {
              return {"data":null};
              throw Exception('Failed..');
            }
          });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> updatePartnerPreference(
      {required String authorization,
      required String minAge,
      required String maxAge,
      required String minHeight,
      required String maxHeight,
      required String gender,
      required String martialStatus,
      required String religion,
      required String education,
      required String occupation,
      required String others,
      required String country,
      required String state}) {
    return api.putData(
        uri: Uri.parse(ApiConfig.createUpdatePartnerPreferences),
        headers: api.createHeaders(authtoken: authorization),
        body: {
          {
            "minAge": minAge,
            "maxAge": maxAge,
            "minHeight": minHeight,
            "maxHeight": maxHeight,
            "Gender": gender,
            "MartialStatus": martialStatus,
            "Religion": religion,
            "Education": education,
            "Occupation": occupation,
            "others": others,
            "country": country,
            "state": state,
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
  // Future<Map<String, dynamic>?> getPartnerPreferenceById({
  //   required String authorization,
  //   required String id,
  // }) {
  //   return api.getData(
  //       uri: Uri.parse(ApiConfig.partnerPreferenceDetailURl + "{$id}"),
  //       headers: api.createHeaders(authtoken: authorization),
  //       builder: (data) {
  //         Map<String, dynamic> jsonMap = json.decode(data);
  //         if (jsonMap["Authorization"] != null) {
  //           return jsonMap;
  //         } else {
  //           throw Exception('Failed..');
  //         }
  //       });
  // }

  @override
  Future<Map<String, dynamic>?> getPartnerPreferenceByLoginAccount(
      {required String authorization}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.getPartnerPreferencesByAccount),
        headers: api.createHeaders(authtoken: authorization),
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
  Future<Map<String, dynamic>?> getLocation(
      {required String authtoken}) {
    return api.getData(
        uri: Uri.parse(ApiConfig.getAllLocation),
        headers: api.createHeaders(authtoken: authtoken),
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
  Future<Map<String, dynamic>?> deletePartnerPreference(
      {required String authorization}) {
    return api.deleteData(
        uri: Uri.parse(ApiConfig.createUpdatePartnerPreferences),
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
  Future<Map<String, dynamic>?> getPartnerPreference({
    required String authorization,
    String gender = "",
    String martialStatus = "",
    String religion = "",
    String education = "",
    String occupation = "",
    String employedIn = "",
    String others = "",
    String country = "",
    String state = "",
    String pageNo = "",
    String limit = "",
  }) {
    String url = ApiConfig.createUpdatePartnerPreferences;
    if (gender != '') {
      url = url + "?gender=${gender}";
    }
    if (martialStatus != '') {
      url = url + "?martialStatus=${martialStatus}";
    }
    if (religion != '') {
      url = url + "?religion=${religion}";
    }
    if (education != '') {
      url = url + "?education=${education}";
    }
    if (occupation != '') {
      url = url + "?occupation=${occupation}";
    }
    if (employedIn != '') {
      url = url + "?employedIn=${employedIn}";
    }
    if (others != '') {
      url = url + "?others=${others}";
    }
    if (country != '') {
      url = url + "?country=${country}";
    }
    if (state != '') {
      url = url + "?state=${state}";
    }
    if (pageNo != '') {
      url = url + "?pageNo=${pageNo}";
    }
    if (limit != '') {
      url = url + "?limit=${limit}";
    }

    return api.getData(
        uri: Uri.parse(url),
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

final partnerPreferenceProvider =
    Provider((ref) => PartnerPreferenceRepositoryV1(ApiClient()));
