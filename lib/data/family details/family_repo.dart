import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/config.dart';
import '../api_client/api_client.dart';

abstract class FamilyDetailRepository {
  Future<Map<String, dynamic>?> createFamilyDetails({
    required String authToken,
    required String father,
    required String fatherOccupation,
    required String otherFatherOccupation,
    required String mother,
    required String motherOccupation,
    required String otherMotherOccupation,
    required String numberOfBrother,
    required String numberOfSister,
  });

  Future<Map<String, dynamic>?> updateFamilyDetails({
    required String father,
    required String mother,
    required String numberOfSister,
  });

  Future<Map<String, dynamic>?> getFamilyDetails({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> deleteFamilyDetails({
    required String authtoken,
  });
}

class FamilyDetailRepositoryV1 extends FamilyDetailRepository {
  final ApiClient api;

  FamilyDetailRepositoryV1(this.api);

  @override
  Future<Map<String, dynamic>?> createFamilyDetails({
    required String authToken,
    required String father,
    required String fatherOccupation,
    required String otherFatherOccupation,
    required String mother,
    required String motherOccupation,
    required String otherMotherOccupation,
    required String numberOfBrother,
    required String numberOfSister,
  }) async {
    try {
      final body = {
        "father": father,
        if (fatherOccupation != "") "fatherOccupation": fatherOccupation,
        if (otherFatherOccupation != "")
          "otherFatherOccupation": otherFatherOccupation,
        if (mother != "") "motherOccupation": motherOccupation,
        if (otherMotherOccupation != "")
          "otherMotherOccupation": otherMotherOccupation,
        "mother": mother,
        "numberOfBrother": numberOfBrother,
        "numberOfSister": numberOfSister,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.createUpdateFamilyDetails),
        body: body,
        headers: api.createHeaders(authtoken: authToken),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          return jsonMap;
        },
      );
    } catch (e) {
      // throw _determineError(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateFamilyDetails({
    required String father,
    required String mother,
    required String numberOfSister,
  }) {
    final body = {
      "father": father,
      "mother": mother,
      "numberOfSister": numberOfSister
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createUpdateFamilyDetails),
      headers: api.createHeaders(authtoken: ""),
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

  Future<Map<String, dynamic>?> getFamilyDetails({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getFamilyDetailsByAccount),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> deleteFamilyDetails({
    required String authtoken,
  }) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createUpdateFamilyDetails),
      headers: api.createHeaders(authtoken: authtoken),
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
}

final familydetailsRepositoryProvider =
    Provider((ref) => FamilyDetailRepositoryV1(ApiClient()));
