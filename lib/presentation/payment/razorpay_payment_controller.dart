import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavenlymatrimony/application/subscription/subscription_service.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import 'package:heavenlymatrimony/presentation/welcome_page/welcome_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/payment/payment_service.dart';
import '../../application/validate/validate.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/globals.dart';
import '../br_detail/br_detail.dart';
import '../bride/b_fullDetails/bride_Full_Details.dart';

part 'razorpay_payment_controller.g.dart';

@riverpod
class razorpayController extends _$razorpayController {
  TextEditingController amtController = TextEditingController();

  late Razorpay _razorpay = Razorpay();

  Map<String, dynamic>? _PaymentamountResponse;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  String? paymentKey ;


  String authtoken = "";

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await PreferenceManagerUtils.getToken().then((value) {
      authtoken = value;
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    await getPaymentKey();
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> getPaymentKey() async {
    state = const AsyncLoading();
    _isLoading = true;

    Map<String, dynamic>? paymentKeyResponse = await ref
        .read(paymentServiceProvider)
        .getPaymentKey(authtoken: authtoken);

    if (paymentKeyResponse?["data"] != null &&
        paymentKeyResponse?["data"] != []) {
      paymentKey = paymentKeyResponse?["data"]["key_id"];
    } else {
      DialogServiceV1().showSnackBar(
          content:
              "Get Payment Key Failed due to ${_PaymentamountResponse?["error"]}",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
    }

    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> onMakePaymentTap({required BuildContext context,required int amount}) async {
    state = const AsyncLoading();
    _isSubmit = true;
    if (amount!=0) {

      openCheckOut(amount);

    }

    if (validate(amtController.text) == null) {
      // commonNavigator(
      //     context: context,
      //     //todo : accountId
      //
      //     child: BrideDetails(
      //       accountId: '235232',
      //     ),
      //     type: PageTransitionType.fade);
      // if (amount!=0) {
      if (amtController.text.toString().isNotEmpty) {

          // int amount = int.parse(
          //     amtController.text.toString());
         openCheckOut(amount);

      }
    }
    state = const AsyncValue.data(null);
  }

  void openCheckOut(amount) async {
    amount = amount * 100;
    var option = {
      'key': paymentKey ?? "rzp_test_67LjOCZCdORHti",
      'amount': amount,
      'name': 'Matrimony',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(option);
    } catch (e) {
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {

    // 
    onTabVerify();
    Navigator.pushAndRemoveUntil(Globals.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) {return AfterBottomBar();
    },), (route) => false);
    Navigator.push(Globals.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) {return WelcomeScreen();}));

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

  Future<void> onTabVerify() async {
    state = const AsyncLoading();
    _isSubmit = true;

    if (validate(amtController.text) == null) {
      _isLoading = true;

      _PaymentamountResponse = await ref
          .read(paymentServiceProvider)
          .createPayment(
              authtoken: authtoken, amount: amtController.text, currency: "INR");
    }

    if (_PaymentamountResponse?["data"]["_id"] != null) {
      // ref.read(subscriptionServiceProvider).createUserSubscription(authtoken: authtoken, subscriptionId: subscriptionId, paymentId: paymentId)
      DialogServiceV1().showSnackBar(
          content: "Payment Succesfull API ${_PaymentamountResponse?["data"]["_id"]}",
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

  void onCarouselPageChanged(int page, CarouselPageChangedReason reason) {
    
  }
}
