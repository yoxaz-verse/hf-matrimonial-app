import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/checkout/checkoutScreen.dart';
import 'package:heavenlymatrimony/presentation/plan/plan.dart';
import 'package:heavenlymatrimony/presentation/subsription/subscription_screen_controller.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_listview.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:heavenlymatrimony/utils/images.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/text.dart';
import '../error/error_screen.dart';
import '../shimmers/subscription_shimmer.dart';

class SubscrptionScreen extends ConsumerWidget {
  SubscrptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(subscriptionScreenControllerProvider);
    controller() => ref.read(subscriptionScreenControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller().isLoading==true?SubscriptionShimmer():SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.005, bottom: h * 0.001),
                  child: Center(
                    child: Container(
                      height: h * 0.9,
                      width: w * 0.95,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(h * 0.024),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Positioned(
                              top: h * 0.05,
                              left: w * 0.6,
                              child: Image.asset(
                                AppImg.ringbg,
                                height: h * 0.1,
                                width: w * 0.380,
                              ),
                            ),
                            Positioned(
                              bottom: h * 0.01,
                              left: w * 0.03,
                              child: Image.asset(
                                AppImg.ringbg,
                                height: h * 0.2,
                                width: w * 0.6,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: h * 0.075,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: h * 0.02,
                                      ),
                                      Image.asset(
                                        AppImg.bottom2_3,
                                        color: AppColors.gradient1,
                                        height: h * 0.05,
                                      ),
                                      SizedBox(
                                        width: h * 0.02,
                                      ),
                                      CommonText(
                                          text: AppText.subscription,
                                          style: juraTextStyle(
                                            fontSize: h * 0.034,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  controller().subscripDataList.isNotEmpty
                                      ? CommonListView(
                                          itemCount: controller().subscripDataList.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: false,
                                          padding: EdgeInsets.all(8),
                                          width: w,
                                          height: h * 0.718,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                plandetail(planData: controller().subscripDataList[index]),
                                                SizedBox(
                                                  height: h * 0.02,
                                                ),
                                                CommonButton(
                                                  containerwidth: w * 0.4,
                                                  containerheight: h * 0.06,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.01),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.010),
                                                    gradient: commonGradient(),
                                                  ),
                                                  text: AppText.payNow,
                                                  textStyle: juraTextStyle(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: h * 0.024,
                                                  ),
                                                  onPressed: () {
                                                    commonNavigator(
                                                        context: context,
                                                        child: CheckOutScreen(planData: controller().subscripDataList[index]),
                                                        type: PageTransitionType
                                                            .fade);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: h * 0.05,
                                                ),
                                              ],
                                            );
                                          },
                                        )
                                      : Container(
                                    height: h * 0.7,
                                        width: w * 0.6,
                                        child: Center(
                                          child: CommonText(
                                            text: AppText.noData,
                                            style: juraTextStyle(
                                              color: AppColors.gradient1,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          // bottomNavigationBar: AfterBottomBar(),

    );
  }
}
