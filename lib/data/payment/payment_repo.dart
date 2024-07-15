import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';

import '../../utils/config.dart';

abstract class PaymentRepository {
  Future<Map<String, dynamic>?> createPayment({
    required String authtoken,
    required String amount,
    required String currency,
  });

  Future<Map<String, dynamic>?> confirmPayment({
    required String authtoken,
    required String razorpay_payment_id,
    required String razorpay_order_id,
    required String id,
  });

  Future<Map<String, dynamic>?> deletePayment({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getPaymentKey({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getPaymentOfLoginUser({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> getAllPayment({
    required String authtoken,
  });
}

class PaymentRepositoryV1 extends PaymentRepository {
  final ApiClient api;

  PaymentRepositoryV1(this.api);

  Future<Map<String, dynamic>?> createPayment({
    required String authtoken,
    required String amount,
    required String currency,
  }) async {
    final body = {
      "amount": amount,
      "currency": currency,
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createAndConfirmPayment),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          return jsonMap;
        } else {
          return {"data":null};
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getPaymentKey({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getPaymentKey),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> confirmPayment({
    required String authtoken,
    required String razorpay_payment_id,
    required String razorpay_order_id,
    required String? id,
  }) {
    final body = {
      "_id": id,
      "razorpay_payment_id": razorpay_payment_id,
      "razorpay_order_id": razorpay_order_id
      // authtoken: authtoken,
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createAndConfirmPayment ),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return jsonMap;
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> deletePayment({required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createAndConfirmPayment),
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

  // Future<Map<String, dynamic>?> getPaymentById({
  //   required String authtoken,
  //   required String id,
  // }){
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.paymentURl+"{$id}"),
  //     headers: api.createHeaders(authtoken:authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["_id"] != null) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  Future<Map<String, dynamic>?> getPaymentOfLoginUser({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getPaymentByAccount),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["_id"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAllPayment({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.createAndConfirmPayment),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["_id"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final paymentRepositoryProvider =
    Provider<PaymentRepository>((ref) => PaymentRepositoryV1(ApiClient()));
