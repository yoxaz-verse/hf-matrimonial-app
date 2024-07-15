import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../color.dart';
import 'common_button.dart';
import 'common_text.dart';

class CommonImagePicker extends ConsumerWidget {
  ImagePicker picker;
  void Function(File file) pickedImage;

  CommonImagePicker(
      {super.key, required this.picker, required this.pickedImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncState = ref.watch(businessCatDetailsControllerProvider);
    // controller() => ref.read(businessCatDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return StatefulBuilder(
      builder: (context, setState1) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          titlePadding: EdgeInsets.only(
            left: w * 0.055,
            right: w * 0.055,
            top: h * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
          insetPadding: EdgeInsets.only(
            left: w * 0.03,
            right: w * 0.03,
            top: h * 0.35,
            bottom: h * 0.35,
          ),
          contentPadding: EdgeInsets.only(
              left: w * 0.05, right: w * 0.05, bottom: h * 0.02, top: h * 0.02),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                      text: "Select Image",
                      style: juraTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,
                        color: AppColors.black.withOpacity(0.8),
                        size: h * 0.024),
                  )
                ],
              ),
            ],
          ),
          content: Container(
            height: h * 0.8,
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonButton(
                    containerwidth: w,
                    containerheight: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ])),
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    text: "Take Photo",
                    prefixicon: Icon(
                      Icons.camera_alt,
                      color: AppColors.white,
                      size: h * 0.03,
                    ),
                    textStyle: juraTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () async {
                      final pickedImg =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedImg != null) {
                        pickedImage(File(pickedImg.path));

                        //  debug
                        Navigator.pop(context);
                      }
                    }),
                CommonButton(
                    containerwidth: w,
                    containerheight: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ])),
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    text: "Choose From Gallery",
                    prefixicon: Icon(
                      Icons.photo_library_rounded,
                      color: AppColors.white,
                      size: h * 0.03,
                    ),
                    textStyle: juraTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () async {
                      final pickedImg =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedImg != null) {
                        pickedImage(File(pickedImg.path));

                        //    debug
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
