import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/search_partner_screen/search_partner_screen_controller.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_appbar.dart';
import 'package:heavenlymatrimony/utils/common_components/text_input_field.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_dropdown.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/common_components/common_text.dart';
import '../../utils/common_components/dropdown/src/properties/clear_button_props.dart';
import '../../utils/common_components/dropdown/src/properties/dropdown_button_props.dart';
import '../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';
import '../br_detail/br_detail.dart';
import '../error/error_screen.dart';
import '../shimmers/search_screen_shimmer.dart';

class SearchPartnerScreen extends ConsumerStatefulWidget {
  const SearchPartnerScreen({super.key});

  @override
  ConsumerState createState() => _SearchPartnerScreenState();
}

class _SearchPartnerScreenState extends ConsumerState<SearchPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(searchPartnerScreenControllerProvider);
    controller() => ref.read(searchPartnerScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        centerTitle: false,
        padding: EdgeInsets.only(right: w * 0.04),
        leadingicon: false,
        backgroundColor: Colors.white,
        suffixicon: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // commonNavigator(
            //     context: context,
            //     child:BrDetailScreen(),
            //     type: PageTransitionType.fade);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: h * 0.03,
        ),
      ),
      body: asyncState.when(
          data: (data) => Stack(
                alignment: Alignment.topCenter,
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
                            containerHeight: h * 0.084,
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
                            containerHeight: h * 0.084,
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
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: h * 0.10,
                      width: w * 0.40,
                      child: Image.asset(
                        AppImg.rimage,
                        fit: BoxFit.fill,
                        color: AppColors.white.withOpacity(0.02),
                        colorBlendMode: BlendMode.lighten,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.14),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: h * 0.02, bottom: h * 0.01),
                        height: h * 0.3,
                        width: w,
                        child: Image.asset(
                          AppImg.btring,
                          fit: BoxFit.fill,
                          color: AppColors.white.withOpacity(0.02),
                          colorBlendMode: BlendMode.lighten,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: h * 0.02),
                    child: Column(
                      children: [
                        CommonText(
                          text: AppText.search,
                          textAlign: TextAlign.center,
                          style: juraTextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: h * 0.038,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.10),
                    height: h * 0.53,
                    width: h * 0.40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.05),
                          blurRadius: 2,
                          spreadRadius: 4,
                        ),
                      ],
                      color: AppColors.bcolor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: h * 0.03),
                        TextInputField(
                          hintText: AppText.name,
                          controller: controller().name,
                          underline: false,
                          borderRadius: BorderRadius.circular(5),
                          containerheight: h * 0.07,
                          errorStyle: TextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          textstyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          counterStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.03,
                              fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.8,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none,
                          prefix: Padding(
                            padding: EdgeInsets.only(right: w * 0.28),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        TextInputField(
                          hintText: AppText.profileid,
                          controller: controller().profileid,
                          underline: false,
                          borderRadius: BorderRadius.circular(5),
                          containerheight: h * 0.07,
                          errorStyle: TextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          textstyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          counterStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.03,
                              fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.8,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none,
                          prefix: Padding(
                            padding: EdgeInsets.only(right: w * 0.26),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        CommonDropdown(
                          alignment: Alignment.center,
                          containerheight: h * 0.07,
                          containerwidth: w * 0.8,
                          containercolor: AppColors.white,
                          onChangedsearch: (selectedValue) {
                            
                          },
                          items: const [AppText.male, AppText.female],
                          dropdownselecttitle: AppText.job,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1)),
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                            ),
                            baseStyle: juraTextStyle(
                                fontSize: h * 0.024, color: AppColors.black),
                          ),
                          clearButtonProps: ClearButtonProps(),
                          dropdownButtonProps: DropdownButtonProps(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: h * 0.03,
                              color: AppColors.black,
                            ),
                          ),
                          enabled: true,
                          elevation: 0,
                          isExpanded: true,
                          selectedTextstyle: juraTextStyle(fontWeight: FontWeight.w500,
                              color: AppColors.textColor, fontSize: h * 0.02),
                          prefix: Padding(
                            padding: EdgeInsets.only(right: w * 0.30),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        CommonDropdown(
                          alignment: Alignment.center,
                          containerheight: h * 0.07,
                          containerwidth: w * 0.8,
                          containercolor: AppColors.white,
                          onChangedsearch: (selectedValue) {
                            
                          },
                          items: const [
                            AppText.age,
                          ],
                          dropdownselecttitle: AppText.age,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1)),
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1)),
                            ),
                            baseStyle: juraTextStyle(
                                fontSize: h * 0.024, color: AppColors.black),
                          ),
                          clearButtonProps: ClearButtonProps(),
                          dropdownButtonProps: DropdownButtonProps(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: h * 0.03,
                              color: AppColors.black,
                            ),
                          ),
                          enabled: true,
                          elevation: 0,
                          isExpanded: true,
                          selectedTextstyle: juraTextStyle(fontWeight: FontWeight.w500,
                              color: AppColors.textColor, fontSize: h * 0.02),
                          prefix: Padding(
                            padding: EdgeInsets.only(right: w * 0.30),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        CommonButton(
                            prefixicon: Icon(
                              Icons.search_outlined,
                              color: AppColors.white,
                              size: h * 0.03,
                            ),
                            containerwidth: w * 0.4,
                            containerheight: h * 0.05,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: commonGradient(),
                            ),
                            text: AppText.Search,
                            textStyle: juraTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              commonNavigator(
                                  context: context,
                                  child: BrDetailScreen(),
                                  type: PageTransitionType.fade);
                            }),
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
              return SearchPartnerScreenShimmer();
            }
          }),
    );
  }
}
