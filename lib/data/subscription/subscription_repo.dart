import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/data/api_client/api_client.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/config.dart';
import 'package:heavenlymatrimony/utils/globals.dart';

abstract class SubscriptionRepository {
  Future<Map<String, dynamic>?> createSubscription({
    required String name,
    required int interestPerMonth,
    required int price,
    required String description,
    required int duration,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updateSubscription({
    required String userid,
    required String name,
    required int interestPerMonth,
    required int price,
    required String description,
    required int duration,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> createUserSubscription({
    required String authtoken,
    required String subscriptionId,
    required String paymentId,
  });
  // Future<Map<String, dynamic>?> getById({
  //   required String userid,
  //   required String authtoken,
  // });
  Future<Map<String, dynamic>?> getAddOnSlot();
  Future<Map<String, dynamic>?> getAddOnInterest();
  Future<Map<String, dynamic>?> getAddOnView();
  Future<Map<String, dynamic>?> getAllSubscription({
    required String userid,
    required String authtoken,
  });

  Future<bool?> deleteSubscription({
    required String userId,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> createUserAddOnView({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });  Future<Map<String, dynamic>?> createUserAddOnInterest({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });  Future<Map<String, dynamic>?> createUserAddOnSlot({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });
}

class SubscriptionRepositoryV1 extends SubscriptionRepository {
  SubscriptionRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createSubscription(
      {required String name,
      required int interestPerMonth,
      required int price,
      required String description,
      required int duration,
      required String authtoken}) async {
    try {
      final body = {
        'name': name,
        'interestPerMonth': interestPerMonth,
        'price': price,
        'description': description,
        'duration': duration,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.getAllSubscription),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap['data'] != [] && jsonMap["data"] != null) {
            DialogServiceV1().showSnackBar(
                content: "Subscription Added Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            Navigator.of(Globals.navigatorKey.currentContext!).pop();
            return jsonMap;
          } else {
            return {"data": null};
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      //  
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> createUserSubscription({
    required String authtoken,
    required String subscriptionId,
    required String paymentId,
  }) async {
    try {
      final body = {"subscription": subscriptionId, "payment": paymentId};
      return api.postData(
        uri: Uri.parse(ApiConfig.createAndUpdateUserSubscription),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap['data'] != null) {
            DialogServiceV1().showSnackBar(
                content: "Subscription purchased Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            return {"data": null};
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      return null;
    }
  }



  @override
  Future<Map<String, dynamic>?> createUserAddOnView({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  })async {
    try {
      final body = {"AddOnView": addOnId, "payment": paymentId};
      return api.postData(
        uri: Uri.parse(ApiConfig.createAndUpdateUserAddOnView),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap['data'] != null) {
            // DialogServiceV1().showSnackBar(
            //     content: "Subscription purchased Successfully!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);
            // Navigator.of(Globals.navigatorKey.currentContext!).pop();
            return jsonMap;
          } else {
            return {"data": null};
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      return null;
    }
  }
  @override
  Future<Map<String, dynamic>?> createUserAddOnInterest({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  })async {
    try {
      final body = {"AddOnInterest": addOnId, "payment": paymentId};
      return api.postData(
        uri: Uri.parse(ApiConfig.createAndUpdateUserAddOnInterest),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap['data'] != null) {
            // DialogServiceV1().showSnackBar(
            //     content: "Subscription purchased Successfully!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);
            // Navigator.of(Globals.navigatorKey.currentContext!).pop();
            return jsonMap;
          } else {
            return {"data": null};
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      return null;
    }
  }  @override
  Future<Map<String, dynamic>?> createUserAddOnSlot({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  })async {
    try {
      final body = {"AddOnSlot": addOnId, "payment": paymentId};
      return api.postData(
        uri: Uri.parse(ApiConfig.createAndUpdateUserAddOnSlot),
        body: body,
        headers: api.createHeaders(
          authtoken: authtoken,
        ),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          if (jsonMap['data'] != null) {
            // DialogServiceV1().showSnackBar(
            //     content: "Subscription purchased Successfully!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);
            // Navigator.of(Globals.navigatorKey.currentContext!).pop();
            return jsonMap;
          } else {
            return {"data": null};
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> deleteSubscription(
      {required String userId, required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse("${ApiConfig.getAllSubscription}$userId"),
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        bool jsonMap = json.decode(data);
        DialogServiceV1().showSnackBar(
            content: "Subscription Deleted Successfully",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
        // Navigator.pop(Globals.navigatorKey.currentContext!);
        return jsonMap;
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllSubscription(
      {required String userid, required String authtoken}) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllSubscription),
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
  Future<Map<String, dynamic>?> getById(
      {required String userid, required String authtoken}) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getAllSubscription}?_id=$userid"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> updateSubscription(
      {required String userid,
      required String name,
      required int interestPerMonth,
      required int price,
      required String description,
      required int duration,
      required String authtoken}) {
    final body = {
      'userid': userid,
      'name': name,
      'interestPerMonth': interestPerMonth,
      'price': price,
      'description': description,
      'duration': duration,
    };
    return api.patchData(
      uri: Uri.parse("${ApiConfig.getAllSubscription}$userid"),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap != {}) {
          DialogServiceV1().showSnackBar(
              content: "Subscription Updated Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          Navigator.of(Globals.navigatorKey.currentContext!).pop();
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAddOnInterest() {
    return api.getData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnInterest),
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return {"data": null};
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAddOnView() {
    return api.getData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnView),
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return {"data": null};
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAddOnSlot() {
    return api.getData(
      uri: Uri.parse(ApiConfig.createGetUpdateAddOnSlot),
      headers: api.createHeaders(authtoken: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return {"data": null};
        }
      },
    );
  }
}

final subscriptionRepositoryProvider =
    Provider<SubscriptionRepository>((ref) => SubscriptionRepositoryV1(
          ApiClient(),
        ));
