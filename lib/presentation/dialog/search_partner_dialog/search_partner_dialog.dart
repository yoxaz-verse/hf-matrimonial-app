import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/br_detail/br_detail_controller.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import '../../../application/validate/validate.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_dropdown.dart';
import '../../../utils/common_components/dropdown/src/properties/clear_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

class SearchPartnerDialogScreen extends ConsumerWidget {
  final BrDetailController Function() controller;
  const SearchPartnerDialogScreen({
    Key? key,required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: h * 0.7,
          width: w,
          color: AppColors.white,
          child: Stack(
            children: [
              Positioned(
                bottom: h * 0.1,
                top: 0,
                right: -w * 0.01,
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
                left: -w * 0.01,
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
              Padding(
                padding:  EdgeInsets.all(h * 0.02),
                child: Align(
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
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(h * 0.01),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: CommonText(
                      text: AppText.search,
                      style: juraTextStyle(
                        fontSize: h * 0.032,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(h * 0.03),
                    child: Opacity(
                      opacity: 0.3,
                      child: Center(
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: h * 0.5,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: h * 0.35,
                right: 0,
                child: Container(
                  height: h * 0.27,
                  width: w,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      AppImg.rings,
                      fit: BoxFit.fill,
                      color: AppColors.white.withOpacity(0.02),
                      colorBlendMode: BlendMode.lighten,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h * 0.15,
                right: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.all(h * 0.045),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                        child: TextInputField(
                          textAlign: TextAlign.center,
                          center: true,
                          hintText: AppText.name,
                          counterStyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          errorText: controller().isSubmit == true
                              ? validate(controller().searchNameController.text)
                              : null,
                          errorStyle: juraTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          textstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: juraTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w500),
                          controller: controller().searchNameController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              blurRadius: h * 0.1,
                              blurStyle: BlurStyle.inner,
                            )
                          ],
                          containercolor: AppColors.white.withOpacity(0.8),
                          textCapitalization: TextCapitalization.none,
                          borderRadius: BorderRadius.circular(6),
                          underline: false,
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                        child: TextInputField(
                          textAlign: TextAlign.center,
                          center: true,
                          hintText: AppText.profileid,
                          counterStyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w600),
                          errorText: controller().isSubmit == true
                              ? validate(controller().profileIdController.text)
                              : null,
                          errorStyle: juraTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          lableStyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          textstyle: juraTextStyle(
                              color: AppColors.textColor,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          titletextstyle: juraTextStyle(
                              color: AppColors.black.withOpacity(0.1),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400),
                          hintStyle: juraTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w500),
                          controller: controller().profileIdController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              blurRadius: h * 0.1,
                              blurStyle: BlurStyle.inner,
                            )
                          ],
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none,
                          borderRadius: BorderRadius.circular(6),
                          underline: false,
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                        child:  CommonDropdown(
                          alignment: Alignment.center,
                          dropdownselecttitle: controller().getWorkLocation,
                          onChangedsearch: (selectedValue) {
                            controller().changeWorkLocation(val: selectedValue!);
                          },
                          selectedItem: controller().getWorkLocation,
                          items:  controller().getWorkLocationList,
                          borderRadius: BorderRadius.circular(6),
                          containerwidth: w,
                          containercolor: AppColors.white,
                          containerheight: h * 0.06,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: w*0.25),

                              hintStyle: juraTextStyle(
                                fontSize: h * 0.018,
                                color: AppColors.textGreyColor,
                              ),
                              hintText: AppText.age,
                              border: InputBorder.none,
                              fillColor: AppColors.white,
                              focusColor: AppColors.white,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            baseStyle: juraTextStyle(
                                fontSize: h * 0.02, color: AppColors.black),
                          ),
                          clearButtonProps: const ClearButtonProps(),
                          padding: EdgeInsets.zero,
                          dropdownButtonProps: DropdownButtonProps(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: h * 0.03,
                              color: AppColors.black,
                            ),
                          ),
                          enabled: true,
                          elevation: 0,
                          isExpanded: false,
                          selectedTextstyle: juraTextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                              fontSize: h * 0.02),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                        child: CommonDropdown(
                          alignment: Alignment.center,

                          dropdownselecttitle: controller().selectAge,
                          onChangedsearch: (selectedValue) {
                            controller().changeAge(val: selectedValue!);
                          },
                          selectedItem: controller().selectAge,
                          items: controller().getAgeList,
                          borderRadius: BorderRadius.circular(6),
                          containerwidth: w,
                          containercolor: AppColors.white,
                          containerheight: h * 0.06,
                          dropdownDecoratorProps: DropDownDecoratorProps(

                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: w*0.31),
                              // constraints: BoxConstraints.tight(Size.fromWidth(200)),
                              hintStyle: juraTextStyle(
                                fontSize: h * 0.018,
                                color: AppColors.textGreyColor,
                              ),
                              hintText: AppText.age,
                              border: InputBorder.none,
                              fillColor: AppColors.white,
                              focusColor: AppColors.white,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            baseStyle: juraTextStyle(
                                fontSize: h * 0.02, color: AppColors.black),
                          ),
                          clearButtonProps: const ClearButtonProps(),
                          padding: EdgeInsets.zero,
                          dropdownButtonProps: DropdownButtonProps(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: h * 0.03,
                              color: AppColors.black,
                            ),
                          ),
                          enabled: true,
                          elevation: 0,
                          isExpanded: false,
                          selectedTextstyle: juraTextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                              fontSize: h * 0.02),
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
                          containerheight: h * 0.055,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
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
                            controller().toggleSearch();
                            Navigator.pop(context);
                            // commonNavigator(
                            //     context: context,
                            //     child: BrDetailScreen(),
                            //     type: PageTransitionType.fade);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
