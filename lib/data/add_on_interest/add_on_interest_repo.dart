import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';

import '../../utils/config.dart';

abstract class AddOnInterestRepository {
  Future<Map<String, dynamic>?> createAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
  });
  Future<Map<String, dynamic>?> updateAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
    required String id,
  });

  // Future<Map<String, dynamic>?> getAddOnInterestById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getAddOnInterest();

  Future<Map<String, dynamic>?> deleteAddOnInterest({
    required String authtoken,
    required String id,
  });
}

class AddOnInterestRepositoryV1 extends AddOnInterestRepository {
  final ApiClient api;
  AddOnInterestRepositoryV1(this.api);

  Future<Map<String, dynamic>?> createAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
  }) async {
    final body = {
      "name": name,
      "interest": interest,
      "price": price,
      "description": description,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnInterest),
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

  @override
  Future<Map<String, dynamic>?> updateAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
    required String id,
  }) {
    final body = {
      name: name,
      interest: interest,
      price: price,
      description: description,
      id: id,
      // authtoken: authtoken,
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnInterest + "{$id}"),
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

  // Future<Map<String, dynamic>?> getAddOnInterestById({
  //   required String id,
  // }) {
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.addOnInterestDetailURl + "{$id}"),
  //     headers: api.createHeaders(authtoken: ""),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["success"] == true) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  Future<Map<String, dynamic>?> getAddOnInterest() {
    return api.getData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnInterest),
      headers: api.createHeaders(authtoken: ""),
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

  @override
  Future<Map<String, dynamic>?> deleteAddOnInterest({
    required String authtoken,
    required String id,
  }) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnInterest + "{$id}"),
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

final addOnInterestRepositoryProvider = Provider<AddOnInterestRepository>(
    (ref) => AddOnInterestRepositoryV1(ApiClient()));
