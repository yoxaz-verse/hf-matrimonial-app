import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../application/dialog/dialog_service.dart';
import '../../application/subscription/subscription_service.dart';
import '../../utils/color.dart';
part 'subscription_screen_controller.g.dart';

@riverpod
class SubscriptionScreenController extends _$SubscriptionScreenController {
  //data called in chackout screen
  TextEditingController termsAndConditionScreenController =
      TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController interestPerMonthController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String authToken = '';

  Map<String, dynamic>? subscripData;
 List<Map<String,dynamic>?> _subscripDataList =[];
 List<Map<String,dynamic>?> get subscripDataList => _subscripDataList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await PreferenceManagerUtils.getToken().then((value) async {
      authToken = value;
    });
    await getSubscriptionDetailsData();

    _isLoading = false;

    state = const AsyncValue.data(null);
  }

  Future<void> getSubscriptionDetailsData() async {
    state = const AsyncLoading();

    subscripData = await ref
        .read(subscriptionServiceProvider)
        .getAllSubscription(authtoken: authToken, userid: '');
      
    if (subscripData != null) {
      
      if(subscripData?["data"] != [] && subscripData?["data"] != null && subscripData?["data"].isNotEmpty) {
        subscripData?["data"]["subscriptions"].forEach((item){
          _subscripDataList.add(item);
      
        });
      }
    } else {
      
      ref.read(dialogServiceProvider).showSnackBar(
          content: subscripData?["error"].toString()??"Server error occured",
          color: AppColors.yellow.withOpacity(0.9),
          textclr: AppColors.black);
    }

    state = const AsyncValue.data(null);
  }
}
