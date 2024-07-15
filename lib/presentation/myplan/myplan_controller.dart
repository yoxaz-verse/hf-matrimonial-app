import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/application/payment/payment_service.dart';
import 'package:heavenlymatrimony/application/subscription/subscription_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/data/subscribed%20user/subscribed_repo.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/family details/family_service.dart';

part 'myplan_controller.g.dart';

@riverpod
class MyPlanScreenController extends _$MyPlanScreenController {
  bool _isLoading = false;
  String? paymentKey;

  bool get isLoading => _isLoading;
  String authToken = '';
  String _validity = '';
  String get validity => _validity;
  String _planName = '';
  String get planName => _planName;

  String _paymentId = '';
  String get paymentId => _paymentId;
  bool _isAddContactChecked = false;

  bool get isAddContactChecked => _isAddContactChecked;
  bool _isProfileHighlighterChecked = false;
  bool get isProfileHighlighterChecked => _isProfileHighlighterChecked;
  Razorpay _razorpay = Razorpay();
  String _notSubscribed = '';
  int _index = 0;
  int get index => _index;
  int _amount = 0;
  int get amount => _amount;
  List<Map<String, dynamic>> _planDetails = [];
  List<Map<String, dynamic>> get planDetails => _planDetails;
  String get notSubscribed => _notSubscribed;
  Map<String, dynamic>? myPlanData;
  Map<String, dynamic> _addOnViewData = {};
  Map<String, dynamic> get addOnViewData => _addOnViewData;
  Map<String, dynamic> _addOnInterestData = {};
  Map<String, dynamic> get addOnInterestData => _addOnInterestData;
  Map<String, dynamic> _addOnSlotData = {};
  Map<String, dynamic> get addOnSlotData => _addOnSlotData;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    await PreferenceManagerUtils.getToken().then((value) async {
      authToken = value;
       await getMyPlan();
       await getPaymentKey();
       await fetchAddonData();
      print("seeyjfvhes :: ${_planDetails}");
    });
    // await Future.delayed(Duration(seconds: 5));
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> getMyPlan() async {
    state = const AsyncLoading();

    myPlanData = await ref
        .read(userSubscribedRepositoryProvider)
        .getUserSubscriptionloging(authtoken: authToken);
    if (myPlanData != null) {
      if (myPlanData?["data"] != null) {
        if (myPlanData?["data"]["currentSubscription"] != null) {
          
          if (myPlanData?["data"]?["currentSubscription"]?["name"] != null &&
              myPlanData?["data"]["currentSubscription"]?["name"] != '')
            _planDetails.add({
              'Name':
                  myPlanData!["data"]["currentSubscription"]["name"].toString(),
            });
          _planName =  myPlanData!["data"]["currentSubscription"]["name"].toString();
          if (myPlanData?["data"]["currentSubscription"]["interest"] != null &&
              myPlanData?["data"]["currentSubscription"]["interest"] != '')
            _planDetails.add({
              'Interest Quota': myPlanData!["data"]["currentSubscription"]
                      ["interest"]
                  .toString(),
            });

          if (myPlanData?["data"]["currentSubscription"]["view"] != null &&
              myPlanData?["data"]["currentSubscription"]["view"] != '')
            _planDetails.add({
              'Views Quota':
                  myPlanData!["data"]["currentSubscription"]["view"].toString(),
            });
          if (myPlanData?["data"]["currentSubscription"]["price"] != null &&
              myPlanData?["data"]["currentSubscription"]["price"] != '')
            _planDetails.add({
              'Price': myPlanData!["data"]["currentSubscription"]["price"]
                  .toString(),
            });
          if (myPlanData?["data"]["addOnInterestLeft"] != null &&
              myPlanData?["data"]["addOnInterestLeft"] != '')
            _planDetails.add({
              'Interest Left':
                  myPlanData!["data"]["addOnInterestLeft"].toString(),
            });
          if (myPlanData?["data"]["addOnViewLeft"] != null &&
              myPlanData?["data"]["addOnViewLeft"] != '')
            _planDetails.add({
              'Views Left': myPlanData!["data"]["addOnViewLeft"].toString(),
            });
          final dateFormatter = DateFormat("dd days");
          if (myPlanData?["data"]["subscriptionEndTime"] != null &&
              myPlanData?["data"]["subscriptionEndTime"] != '') {
            // int days = (DateTime.parse("2024-04-16T06:53:06.894Z").difference(DateTime.now()).inDays);
            int days = (DateTime.parse(myPlanData!["data"]["subscriptionEndTime"])
                    .difference(DateTime.now())
                    .inDays);
            int month = (days / 30).toInt();
            int remainingdays = (((days / 30) - (days / 30).toInt()) * 30).toInt();
            _planDetails.add({
              'Validity':
                  "${month != 0 ? "${month} month " : ""}${remainingdays != 0 ? "${remainingdays} days " : ""}"
                      .toString(),
            });
            _validity =   "${month != 0 ? "${month} month " : ""}${remainingdays != 0 ? "${remainingdays} days " : ""}"
                .toString();
          }
          ;
        }
      }
    } else {
      _notSubscribed = myPlanData?["error"] ?? "";
      
    }
    state = const AsyncValue.data(null);
  }

  void toggleAddContact(val) {
    state = const AsyncLoading();
    _isAddContactChecked = !_isAddContactChecked;
    state = const AsyncValue.data(null);
  }
  void openCheckOut(amount) async {
    amount = amount * 100;
    String? email;
    String? number = "";
    String? userID = "";
    String? name = "";
    await PreferenceManagerUtils.getProfEmail().then((value) {
      email = value;
    });
    await PreferenceManagerUtils.getProfMobileNo().then((value) {
      number = value;
    });
    await PreferenceManagerUtils.getProfEmail().then((value) {
      userID = value;
    });
    await PreferenceManagerUtils.getProfName().then((value) {
      name = value;
    });
    Map<String, dynamic>? _PaymentamountResponse = await ref
        .read(paymentServiceProvider)
        .createPayment(
        authtoken: authToken, amount: _amount.toString(), currency: "INR");
    if (_PaymentamountResponse?["data"]["_id"] != null) {
      _paymentId = _PaymentamountResponse?["data"]["_id"];
      Map<String, dynamic> option = {
        'key': paymentKey ?? "rzp_test_67LjOCZCdORHti",
        'amount': amount,
        'name': 'Matrimony',
        'notes': {
          'address': "Heavenly Matrimony",
        },
        'order_id':'${_PaymentamountResponse?["data"]["razorpay_order_id"]}',
        'theme': {
          'color': "#DEA900",
        },
        'prefill': {
          "name:": name ?? userID ?? "",
          'contact': number ?? userID ?? "",
          'email': email ?? userID ?? ""
        },
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(option);
      } catch (e, s) {}
    }else {
      DialogServiceV1().showSnackBar(
          content:
          "Payment Failed due to ${_PaymentamountResponse?["message"]}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    }
  }
  Future<void> getPaymentKey() async {
    state = const AsyncLoading();
    _isLoading = true;

    Map<String, dynamic>? paymentKeyResponse = await ref
        .read(paymentServiceProvider)
        .getPaymentKey(authtoken: authToken);

    if (paymentKeyResponse?["data"] != null &&
        paymentKeyResponse?["data"] != []) {
      paymentKey = paymentKeyResponse?["data"]["key_id"];
    } else {
      DialogServiceV1().showSnackBar(
          content:
              "Get Payment Key Failed due to ${paymentKeyResponse?["error"]}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    }

    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> onMakePaymentTap(
      {required int amount, required int index, required}) async {
    state = const AsyncLoading();
    if (true) {
      // if (amount != 0 && validate(name.text)==null && validate(address.text)==null && validatePhone(contact.text)==null && validateEmail(email.text)==null && selectedmethod!=0) {
      _amount = amount;
      _index = index;
      openCheckOut(amount);

      /// create subscription directly without razorpay only for tessting
      // await onBuyTap();
    }

    state = const AsyncValue.data(null);
  }

  fetchAddonData() async {
    state = const AsyncLoading();
    _isLoading = true;

    _addOnViewData.clear();
    _addOnInterestData.clear();
    _addOnSlotData.clear();

    Map<String, dynamic>? addOnViewResponse =
        await ref.read(subscriptionServiceProvider).getAddOnView();

    if (addOnViewResponse?["data"] != null &&
        addOnViewResponse?["data"]["addOnViews"].isNotEmpty) {
      _addOnViewData = addOnViewResponse?["data"]["addOnViews"][0];
    }

    Map<String, dynamic>? addOnInterestResponse =
        await ref.read(subscriptionServiceProvider).getAddOnInterest();

    if (addOnInterestResponse?["data"] != null &&
        addOnInterestResponse?["data"]["addOnInterests"].isNotEmpty) {
      _addOnInterestData = addOnInterestResponse?["data"]["addOnInterests"][0];
    }

    Map<String, dynamic>? addOnSlotResponse =
        await ref.read(subscriptionServiceProvider).getAddOnSlot();

    if (addOnSlotResponse?["data"] != null &&
        addOnSlotResponse?["data"]["addOnSlots"].isNotEmpty) {
      _addOnSlotData = addOnSlotResponse?["data"]["addOnSlots"][0];
    }




_isLoading = false;

    state = const AsyncValue.data(null);
  }

  // void openCheckOut(amount) async {
  //   amount = amount * 100;
  //
  //
  //   Map<String, dynamic> option = {
  //     'key': paymentKey ?? "rzp_test_67LjOCZCdORHti",
  //     'amount': amount,
  //     'name': 'Matrimony',
  //     'prefill': {
  //       "name:": name ?? userID ?? "",
  //       'contact': number ?? userID ?? "",
  //       'email': email ?? userID ?? ""
  //     },
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };
  //   try {
  //     _razorpay.open(option);
  //   } catch (e, s) {
  //
  //   }
  // }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    // 
   await onBuyTap(response);
    Navigator.pushAndRemoveUntil(Globals.navigatorKey.currentContext!,
        MaterialPageRoute(
      builder: (context) {
        return AfterBottomBar();
      },
    ), (route) => false);

    Fluttertoast.showToast(
        msg: "Payment Succesfull" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment fail" + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "ExternalWallet" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  Future<void> onBuyTap(PaymentSuccessResponse response) async {
    state = const AsyncLoading();

    _isLoading = true;

Map<String, dynamic>? _PaymentamountResponse = await ref
    .read(paymentServiceProvider)
    .confirmPayment(
authtoken: authToken,id: _paymentId,razorpay_order_id: response.orderId??"",razorpay_payment_id: response.paymentId??"");
_isLoading = false;

if (_PaymentamountResponse?["success"] ==true) {
      if (_index == 0) {
        ref.read(subscriptionServiceProvider).createUserAddOnView(
            authtoken: authToken,
            addOnId: _addOnViewData["_id"],
            paymentId:_paymentId);
      }
      if (_index == 1) {
        ref.read(subscriptionServiceProvider).createUserAddOnSlot(
            authtoken: authToken,
            addOnId: _addOnSlotData["_id"],
            paymentId: _paymentId);
      }
      if (_index == 2) {
        ref.read(subscriptionServiceProvider).createUserAddOnInterest(
            authtoken: authToken,
            addOnId: _addOnInterestData["_id"],
            paymentId: _paymentId);
      }
      DialogServiceV1().showSnackBar(
          content:
              "Payment Succesfull API ${_PaymentamountResponse?["data"]["_id"]}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    } else {
      DialogServiceV1().showSnackBar(
          content:
              "Payment Failed due to ${_PaymentamountResponse?["message"]}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    }

  }

  createAddOnview() {
    state = const AsyncLoading();
    // ref.read(subscriptionServiceProvider).createUserAddOnSlot(
    //     authtoken: authToken,
    //     addOnId: _addOnSlotData["_id"],
    //     paymentId: _PaymentamountResponse?["data"]["_id"]);

    state = const AsyncValue.data(null);
  }
  void toggleProfileHighlighter(val) {
    state = const AsyncLoading();
    _isProfileHighlighterChecked = !_isProfileHighlighterChecked;
    state = const AsyncValue.data(null);
  }
}
