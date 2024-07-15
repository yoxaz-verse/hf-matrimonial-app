import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/utils/import_utils.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../registration page/registration_page_controller.dart';

class AddOtherDetailDialog extends ConsumerStatefulWidget {
  void Function(String text) onSubmit;


  AddOtherDetailDialog({super.key,required this.onSubmit});

  @override
  ConsumerState createState() => _AddOtherDetailDialogState();
}

class _AddOtherDetailDialogState extends ConsumerState<AddOtherDetailDialog> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      title: Column(

        children: [
          CommonText(
              text:
              'Add other',
              style: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ],
                    ).createShader(const Rect.fromLTRB(100, 0, 180, 100)),
                  fontSize: h * 0.025,
                  fontWeight: FontWeight.w600)),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       vertical: h * 0.005,horizontal: w*0.02),
          //   child: CommonDropdown(
          //     prefix: Icon(Icons.info,size: 10,),
          //     alignment: Alignment.center,
          //     dropdownselecttitle:
          //     widget.controller().getGenderStatus,
          //     onChangedsearch: (selectedValue) {
          //       widget.controller().changeGender(
          //           val: selectedValue!);
          //       
          //     },
          //     selectedItem:
          //     widget.controller().getGenderStatus,
          //     items: widget.controller().getGenderList,
          //     borderRadius:
          //     BorderRadius.circular(6),
          //     containerwidth: w,
          //     containerheight: h * 0.06,
          //     dropdownDecoratorProps:
          //     DropDownDecoratorProps(
          //       textAlign: TextAlign.center,
          //       dropdownSearchDecoration:
          //       InputDecoration(
          //         // prefix: Icon(Icons.info_outline,color: Colors.black26,),
          //         focusedBorder:
          //         UnderlineInputBorder(
          //             borderSide: BorderSide(
          //                 color: AppColors
          //                     .black,
          //                 width: 1)),
          //         disabledBorder:
          //         UnderlineInputBorder(
          //             borderSide: BorderSide(
          //                 color: AppColors
          //                     .black,
          //                 width: 1)),
          //         border: UnderlineInputBorder(
          //             borderSide: BorderSide(
          //                 color: AppColors
          //                     .black,
          //                 width: 1)),
          //         enabledBorder:
          //         UnderlineInputBorder(
          //             borderSide: BorderSide(
          //                 color: AppColors
          //                     .black.withOpacity(0.3),
          //                 width: 1)),
          //       ),
          //       textAlignVertical:
          //       TextAlignVertical.center,
          //       baseStyle: juraTextStyle(
          //           fontSize: h * 0.02,
          //           color: AppColors.black),
          //     ),
          //     clearButtonProps:
          //     const ClearButtonProps(),
          //     padding: EdgeInsets.zero,
          //     dropdownButtonProps:
          //     DropdownButtonProps(
          //       padding: EdgeInsets.zero,
          //       icon: Icon(
          //         Icons
          //             .keyboard_arrow_down_outlined,
          //         size: h * 0.03,
          //         color: AppColors.black,
          //       ),
          //     ),
          //     enabled: true,
          //     elevation: 0,
          //     isExpanded: false,
          //     selectedTextstyle: juraTextStyle(
          //         fontWeight: FontWeight.w500,
          //         color: AppColors.textColor,
          //         fontSize: h * 0.02),
          //     containercolor:
          //     Colors.transparent,
          //   ),
          //   // CommonDropdown(
          //   //   containerwidth: w,
          //   //   containercolor: AppColors.white,
          //   //   containerheight: h * 0.065,
          //   //   dropdownselecttitle:
          //   //       controller().getGenderStatus,
          //   //   selectedItem:
          //   //       controller().getGenderStatus,
          //   //   onChangedsearch: (selectedValue) {
          //   //     controller().changeGender(
          //   //         val: selectedValue!);
          //   //     
          //   //   },
          //   //   items: controller().getGenderList,
          //   //   dropdownDecoratorProps:
          //   //       DropDownDecoratorProps(
          //   //     dropdownSearchDecoration:
          //   //         const InputDecoration(
          //   //       focusedBorder:
          //   //           UnderlineInputBorder(
          //   //         borderSide: BorderSide(
          //   //             color:
          //   //                 AppColors.borderColor,
          //   //             width: 1),
          //   //       ),
          //   //       disabledBorder:
          //   //           UnderlineInputBorder(
          //   //               borderSide: BorderSide(
          //   //                   color: AppColors
          //   //                       .borderColor,
          //   //                   width: 1)),
          //   //       border: UnderlineInputBorder(
          //   //           borderSide: BorderSide(
          //   //               color: AppColors
          //   //                   .borderColor,
          //   //               width: 1)),
          //   //       enabledBorder:
          //   //           UnderlineInputBorder(
          //   //               borderSide: BorderSide(
          //   //                   color: AppColors
          //   //                       .borderColor,
          //   //                   width: 1)),
          //   //     ),
          //   //     baseStyle: juraTextStyle(
          //   //         fontSize: h * 0.015,
          //   //         color: AppColors.black),
          //   //   ),
          //   //   clearButtonProps:
          //   //       const ClearButtonProps(),
          //   //   dropdownButtonProps:
          //   //       DropdownButtonProps(
          //   //     icon: Icon(
          //   //       Icons
          //   //           .keyboard_arrow_down_outlined,
          //   //       size: h * 0.03,
          //   //       color: AppColors.black,
          //   //     ),
          //   //   ),
          //   //   enabled: true,
          //   //   elevation: 0,
          //   //   isExpanded: true,
          //   //   selectedTextstyle: juraTextStyle(
          //   //       fontWeight: FontWeight.w500,
          //   //       color: AppColors.textColor,
          //   //       fontSize: h * 0.02),
          //   //   border: null,
          //   // ),
          // ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      buttonPadding: EdgeInsets.zero,
      actionsPadding:
      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content:         Container(
        height: h*0.1,
        alignment: Alignment.center,
        child: TextInputField(
          enabled:true,
          // readonly: true,
          hintText: AppText.others,
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
          errorStyle: juraTextStyle(
              color: AppColors.red,
              fontSize: h * 0.025,
              fontWeight: FontWeight.w400),
          controller: textController,
          keyboardType: TextInputType.text,
          containerwidth: double.infinity,
          containercolor:
          AppColors.transparent,
          textCapitalization:
          TextCapitalization.none,
          obscureText: false,
          maxLines: 1,
          underline: true,
        ),
      )
      ,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
                containerwidth: w * 0.5,
                containerheight: h * 0.05,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: commonGradient(),
                ),
                text: AppText.submit,
                textStyle: juraTextStyle(
                  color: AppColors.white,
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  widget.onSubmit(textController.text);
                  Navigator.pop(context);
                }),
          ],
        ),
      ],
    );
  }
}
