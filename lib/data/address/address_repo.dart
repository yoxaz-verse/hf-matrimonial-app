import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';
import '../../utils/config.dart';
import '../api_client/api_client.dart';

//you want to create,update and get

//create and update api are same

abstract class AddressRepository {
  Future<Map<String, dynamic>?> createaddress({
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updateaddress({
    required String addessid,
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getaddress({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getalladdress({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getaddressbyid({
  //   required String authtoken,
  //   required String id,
  // });

  Future<bool?> deleteUserAddress({
    required String addId,
    required String authtoken,
  });
}

class AddressRepositoryV1 implements AddressRepository {
  AddressRepositoryV1(this.api);
  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createaddress({
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  }) {
    final body = {
      "Address": Address,
      "Distict": Distict,
      "State": State,
      "Country": Country,
    };

    return api.postData(
      uri: Uri.parse(ApiConfig.createAndUpdateAddress),
      body: body,
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["status"] == true) {

          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> updateaddress({
    required String addessid,
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
    // required String id,
  }) {
    final body = {
      "Address": Address,
      "Distict": Distict,
      "State": State,
      "Country": Country,
    };

    return api.putData(
      uri: Uri.parse(ApiConfig.getAllAddress),
      body: body,
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["status"] == true) {

          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getaddress({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.createAndUpdateAddress),
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
  Future<Map<String, dynamic>?> getalladdress({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllAddress),
      headers: api.createHeaders(authtoken: authtoken),
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

  // @override
  // Future<Map<String, dynamic>?> getaddressbyid({
  //   required String authtoken,
  //   required String id,
  // }) {
  //   return api.getData(
  //     uri: Uri.parse("${ApiConfig.addressURl}$id"),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = {"data": json.decode(data)};
  //
  //       if (jsonMap['data'] != []) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  @override
  Future<bool?> deleteUserAddress({
    required String addId,
    required String authtoken,
  }) {
    return api.deleteData(
      uri: Uri.parse("${ApiConfig.createAndUpdateAddress}$addId"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        bool jsonMap = json.decode(data);
        DialogServiceV1().showSnackBar(
            content: "Address Deleted Successfully",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
        // Navigator.pop(Globals.navigatorKey.currentContext!);
        return jsonMap;
      },
    );
  }
}

final addressRepositoryProvider =
    Provider<AddressRepository>((ref) => AddressRepositoryV1(
          ApiClient(),
        ));
