import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/bride/b_fullDetails/bride_Full_Details.dart';
import 'package:heavenlymatrimony/presentation/payment/razorpay_payment_controller.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';
import 'package:page_transition/page_transition.dart';
import '../../application/validate/validate.dart';
import '../br_detail/br_detail.dart';
import '../error/error_screen.dart';
import '../shimmers/razorpay_Screen_shimmer.dart';

class RazorpayScreen extends ConsumerStatefulWidget {
  const RazorpayScreen({super.key});

  @override
  ConsumerState createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends ConsumerState<RazorpayScreen> {
  void dispose() {
    super.dispose();
  }

  // void initState() {
  //   super.initState();
  //   _razorpay = Razorpay();
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  // }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(razorpayControllerProvider);
    controller() => ref.read(razorpayControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: AppColors.white,
        suffixicon: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
            // commonNavigator(
            //     context: context,
            //     child: SubscrptionScreen(),
            //     type: PageTransitionType.fade);
          },
        ),
      ),
      body: asyncState.when(
          data: (data) => Stack(
                children: [
                  Positioned(
                    bottom: h * 0.1,
                    top: 0,
                    right: -w * 0.04,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: appNameText(
                            heavenly: AppText.heavenly.toUpperCase(),
                            matrimony: AppText.appName.toUpperCase(),
                            containerHeight: h * 0.085,
                            containerWidth: w,
                            heavenlyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.019),
                                fontSize: h * 0.052,
                                fontWeight: FontWeight.w500),
                            matrimonyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.019),
                                fontSize: h * 0.032,
                                fontWeight: FontWeight.w500))),
                  ),
                  Positioned(
                    bottom: h * 0.1,
                    top: 0,
                    left: -w * 0.04,
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: appNameText(
                            heavenly: AppText.heavenly.toUpperCase(),
                            matrimony: AppText.appName.toUpperCase(),
                            containerHeight: h * 0.085,
                            containerWidth: w,
                            heavenlyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.019),
                                fontSize: h * 0.052,
                                fontWeight: FontWeight.w500),
                            matrimonyStyle: juraTextStyle(
                                color: AppColors.black.withOpacity(0.019),
                                fontSize: h * 0.032,
                                fontWeight: FontWeight.w500))),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: h * 0.13,
                      width: w * 0.40,
                      child: Image.asset(
                        AppImg.topRing,
                        fit: BoxFit.fill,
                        color: AppColors.white.withOpacity(0.02),
                        colorBlendMode: BlendMode.lighten,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.07,
                    left: -w * 0.01,
                    child: Column(
                      children: [
                        Image.asset(
                          AppImg.bottomRing,
                          fit: BoxFit.fill,
                          height: h * 0.17,
                          width: w * 0.5,
                          color: AppColors.white.withOpacity(0.02),
                          colorBlendMode: BlendMode.lighten,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CommonText(
                          text: AppText.razorpay,
                          textAlign: TextAlign.center,
                          style: juraTextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: h * 0.035,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.23,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                          child: Container(
                            child: TextInputField(
                              enabled: true,
                              borderRadius: BorderRadius.circular(5),
                              containerborder:
                                  Border.all(color: AppColors.gray),
                              hintText: AppText.amountpay,
                              hintStyle: juraTextStyle(
                                  color: AppColors.gray,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w400),
                              textstyle: juraTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w400),
                              titletextstyle: juraTextStyle(
                                  color: AppColors.grey,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w400),
                              errorText: controller().isSubmit == true
                                  ? validate(controller().amtController.text)
                                  : null,
                              errorStyle: juraTextStyle(
                                  color: AppColors.red,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400),
                              controller: controller().amtController,
                              keyboardType: TextInputType.number,
                              containerwidth: w,
                              containercolor: AppColors.transparent,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              maxLines: 1,
                              // borderColor: AppColors.gray,
                              underline: false,
                            ),
                            // child: TextFormField(
                            //   cursorColor: AppColors.black,
                            //   autofocus: false,
                            //   keyboardType: TextInputType.number,
                            //   style: TextStyle(color: AppColors.black),
                            //   decoration: InputDecoration(
                            //     labelText: AppText.amountpay,
                            //     labelStyle: TextStyle(
                            //         fontSize: h * 0.03, color: AppColors.black),
                            //     border: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: AppColors.black,
                            //         width: h * 0.01,
                            //       ),
                            //     ),
                            //     errorStyle: TextStyle(
                            //         color: AppColors.red, fontSize: h * 0.15),
                            //   ),
                            //   controller: controller().amtController,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter Amount to be paid';
                            //     }
                            //     return null;
                            //   },
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Center(
                          child: CommonButton(
                              containerwidth: w * 0.4,
                              containerheight: h * 0.05,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.015)),
                              text: AppText.makepayment,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.005),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  gradient: commonGradient()),
                              textStyle: juraTextStyle(
                                color: AppColors.white,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                              onPressed: () {
                                controller().onMakePaymentTap(context: context,amount: 100);
                              }
                              //   commonNavigator(
                              //       context: context,
                              //       child: BrideDetails(),

                              //       type: PageTransitionType.fade);
                              //   // if (controller().amtController.text.toString().isNotEmpty) {
                              //   //   setState(() {
                              //   //     int amount = int.parse(
                              //   //         controller().amtController.text.toString());
                              //   //     controller().openCheckOut(amount);
                              //   //   });
                              //   //   controller().onTabVerify(context);
                              //   // }
                              // }),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            if (controller().isLoading) {
              return RazorpayScreenShimmer();
            }
          }),
    );
  }
}
