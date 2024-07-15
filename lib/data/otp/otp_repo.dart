import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/color.dart';

import '../../utils/config.dart';

abstract class OtpRepository {
  Future<Map<String, dynamic>?> createOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
  });
  Future<Map<String, dynamic>?> verifyOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  });
  Future<Map<String, dynamic>?> createForgetPasswordOtp({
    required String email,
  });
  Future<Map<String, dynamic>?> verifyForgetPasswordOtp({
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  });
}

class OtpRepositoryV1 extends OtpRepository {
  final ApiClient api;

  OtpRepositoryV1(this.api);

  @override
  Future<Map<String, dynamic>?> createOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
  }) async {
    final body = {
      "phoneNumber": phoneNumber,
      "email": email,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createOtp),
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
  Future<Map<String, dynamic>?> verifyOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  }) async {
    //0a1213b1-be56-402b-ae35-e0d28830a4c4
    final body = {
      "phoneNumber": phoneNumber,
      "email": email,
      "phoneOtp": phoneOtp,
      "emailOtp": emailOtp,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.verifyOtp),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap['data']["message"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> createForgetPasswordOtp({
    required String email,
  }) async {
    final body = {
      // "phoneCode": "+91",
      // "phoneNumber": phoneNumber,
      "email": email,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createForgotPasswordOtp),
      headers: api.createHeaders(authtoken: ''),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data']["message"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap['data']["message"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> verifyForgetPasswordOtp({
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  }) async {
    final body = {
      // "phoneNumber": phoneNumber,
      "email": email,
      // "phoneOtp": phoneOtp,
      "emailOtp": emailOtp,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.verifyForgotPasswordOtp),
      headers: api.createHeaders(authtoken: ''),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          if (jsonMap['data'] == true) {
            DialogServiceV1().showSnackBar(
                content: "Otp verified successfully!!!",
                color: AppColors.black,
                textclr: AppColors.white);
          }
          return jsonMap;
        } else {
          return jsonMap;
          throw Exception('Failed..');
        }
      },
    );
  }
}

final otpRepositoryProvider =
    Provider<OtpRepository>((ref) => OtpRepositoryV1(ApiClient()));
