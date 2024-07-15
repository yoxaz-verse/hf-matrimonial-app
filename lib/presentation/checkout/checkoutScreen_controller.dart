import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/payment/payment_service.dart';
import '../../application/subscription/subscription_service.dart';
import '../../application/validate/validate.dart';
import '../../utils/color.dart';
import '../../utils/globals.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import '../welcome_page/welcome_page.dart';
part 'checkoutScreen_controller.g.dart';

@riverpod
class CheckoutScreenController extends _$CheckoutScreenController {
  TextEditingController name = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController contact = new TextEditingController();
  TextEditingController email = new TextEditingController();
  late Razorpay _razorpay = Razorpay();
  bool _isAddViewChecked = false;
  bool get isAddViewChecked => _isAddViewChecked;
  bool _isAddSlotChecked = false;
  bool get isAddSlotChecked => _isAddSlotChecked;
  bool _isAddInterestChecked = false;
  bool get isAddInterestChecked => _isAddInterestChecked;
  int _subTotal = 0;
  int get subTotal => _subTotal;
  int _total = 0;
  String _paymentId = "";
  String get paymentId => _paymentId;
  int get total => _total;
  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  int _amount = 0;
  int get amount => _amount;
  String _subscriptionId = "";
  String get subscriptionId => _subscriptionId;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String authToken = '';
  int _selectedmethod = 0;
  int get selectedmethod => _selectedmethod;
  String? paymentKey;
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
    // _razorpay.clear();
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    await PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    await getPaymentKey();
    // await fetchAddonData();

    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  void toggleAddView(val) {
    state = const AsyncLoading();
    _isAddViewChecked = !_isAddViewChecked;
    state = const AsyncValue.data(null);
  }

  void toggleAddSlot(val) {
    state = const AsyncLoading();
    _isAddSlotChecked = !_isAddSlotChecked;
    state = const AsyncValue.data(null);
  }

  void toggleAddInterest(val) {
    state = const AsyncLoading();
    _isAddInterestChecked = !_isAddInterestChecked;
    state = const AsyncValue.data(null);
  }

  onPaymentval(val) {
    state = const AsyncLoading();
    _selectedmethod = val;
    state = const AsyncValue.data(null);
  }

  Future<void> onMakePaymentTap(
      {required BuildContext context,
      required int amount,
      required String subscriptionId}) async {
    state = const AsyncLoading();
    _isSubmit = true;
    // if (true) {
      if (amount != 0 && validate(name.text)==null && validatePhone(contact.text)==null && validateEmail(email.text)==null ) {
      _amount = amount;
      _subscriptionId = subscriptionId;
      openCheckOut(amount);

      /// create subscription directly without razorpay only for tessting
      // await onTabVerify();
    }

    state = const AsyncValue.data(null);
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

  void openCheckOut(amount) async {
    amount = amount * 100;
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
          "name:": name.text,
          'contact': contact.text,
          'email': email.text
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

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    //

    await onTabVerify(response);
    Navigator.pushAndRemoveUntil(Globals.navigatorKey.currentContext!,
        MaterialPageRoute(
      builder: (context) {
        return AfterBottomBar();
      },
    ), (route) => false);
    Navigator.push(Globals.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) {
      return WelcomeScreen();
    }));
    ref
        .read(afterBottomBarControllerProvider(startIndex: 0)
        .notifier)
        .onItemTapped(0);
    Fluttertoast.showToast(
        msg: "Payment Succesfull " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment fail " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "ExternalWallet " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  Future<void> onTabVerify(PaymentSuccessResponse response) async {
    state = const AsyncLoading();
    _isSubmit = true;

    _isLoading = true;

    Map<String, dynamic>? _PaymentamountResponse = await ref
        .read(paymentServiceProvider)
        .confirmPayment(
      authtoken: authToken,id: _paymentId,razorpay_order_id: response.orderId??"",razorpay_payment_id: response.paymentId??"");
    
print("sejfgskb ::: ${_PaymentamountResponse}");
    if (_PaymentamountResponse?["success"] ==true) {
      ref.read(subscriptionServiceProvider).createUserSubscription(
          authtoken: authToken,
          subscriptionId: _subscriptionId,
          paymentId: _paymentId);
      if (_isAddViewChecked) {
        ref.read(subscriptionServiceProvider).createUserAddOnView(
            authtoken: authToken,
            addOnId: _addOnViewData["_id"],
            paymentId: _paymentId);
      }
      if (_isAddSlotChecked) {
        ref.read(subscriptionServiceProvider).createUserAddOnSlot(
            authtoken: authToken,
            addOnId: _addOnSlotData["_id"],
            paymentId:_paymentId);
      }
      if (_isAddInterestChecked) {
        ref.read(subscriptionServiceProvider).createUserAddOnView(
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

  fetchAddonData() async {
    state = const AsyncLoading();
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

    
    
    

    state = const AsyncValue.data(null);
  }


}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final checkoutScreenControllerProvider = StateNotifierProvider<CheckoutScreenController, bool>((ref) => CheckoutScreenController());
//
// class CheckoutScreenController extends StateNotifier<bool> {
//   CheckoutScreenController() : super(false);
//
//
//
//   void toggle(bool val) {
//     state = val;
//   }
//
//   void select(val) {
//     _selectedValue = val;
//     state = false;
//   }
// }
