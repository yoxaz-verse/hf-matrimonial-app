

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavenlymatrimony/presentation/dialog/addOtherDetail/add_other_detail_dialogue.dart';
import 'package:heavenlymatrimony/presentation/dialog/areYouSureDialogue/are_you_sure_dialogue.dart';
import 'package:heavenlymatrimony/presentation/dialog/loader_dialogue.dart';
import 'package:heavenlymatrimony/presentation/dialog/select_gender/select_gender_dialog.dart';
import 'package:heavenlymatrimony/presentation/dialog/userNotSubscribedDialogue/not_subscribed.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/globals.dart';
import '../../presentation/br_detail/br_detail_controller.dart';
import '../../presentation/deleteAccount/mailId/check_your_mail.dart';
import '../../presentation/dialog/dialog_screen.dart';
import '../../presentation/dialog/search_partner_dialog/search_partner_dialog.dart';

import '../../presentation/registration page/registration_page_controller.dart';
import '../../utils/common_components/common_image_picker.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });

  // Future<void> productAvailabilityDialog({required String date});
  Future<void> loaderDialogue();

  Future<void> checkMail();

  searchPartner({required BrDetailController Function() controller});

  Future<void> commonImagePicker({
    required ImagePicker picker,
    required void Function(File file) pickedImage,
  });
  Future<void> selectGenderDialog({required void Function(String selectedGenderId) onSubmit,required RegistrationPageController Function() controller});
  Future<void> singleButtonDialog({
    required String titleText,
    required String subtitleText,
    required String buttonText,
    required void Function() onYesPressed,

  });

  Future<void> areYouSureDialogue({
    required String titleText,
    required String subtitleText,
    required String yesText,
    required String noText,
    required void Function() onYesPressed,
    required void Function() onNoPressed
  });

  // Future<bool> handleLocationPermission();
  //
  // Future<void> orderConfirmAlertDialog();
  //
  // Future<void> selectDateDialog();
  //
  // Future<void> cancelBookingAlertDialog();
  //
  // Future<void> profileCreatedDialog({
  //   required void Function(bool verfied) profVerified,
  // });
  //
  // Future<void> reportImgTitleDialog();
  //
  // Future<void> commonImagePicker({
  //   required ImagePicker picker,
  //   required void Function(File file) pickedImage,
  // });
  //
  // Future<void> rentScreeningDialog();
  //
  // Future<void> businessRentScreeningDialog();
  //
  // Future<void> areYouSureDialog({
  //   required String titleText,
  //   required String subtitleText,
  //   required void Function() onYesPressed,
  //   required void Function() onNoPressed,
  // });
  //
  // Future<void> registerComplaintDialog();
}

class DialogServiceV1 implements DialogService {
  @override
  Future<void> checkMail() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CheckYourMail();
        }));
  }
  @override

  Future<void> readMoreTestimony({String text="", Widget? ImageWidget} ) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return DialogScreen(description: text,ImageWidget: ImageWidget,);
        }));
  }

  @override
  Future<void> searchPartner({required BrDetailController Function() controller}) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return  SearchPartnerDialogScreen(controller: controller,);
        }));
  }
  @override
  Future<void> selectGenderDialog({required void Function(String selectedGenderId) onSubmit,required RegistrationPageController Function() controller}) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return  SelectGenderDialog(onSubmit: onSubmit,controller: controller,);
        }));
  }



  @override
  Future<void> AddOtherDetailDialogue({required void Function(String selectedGenderId) onSubmit}) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AddOtherDetailDialog(onSubmit: onSubmit);
        }));
  }

  @override
  Future<void> commonImagePicker({
    required ImagePicker picker,
    required void Function(File file) pickedImage,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CommonImagePicker(
            picker: picker,
            pickedImage: pickedImage,
          );
        }));
  }

  @override
  Future<void> singleButtonDialog({
    required String titleText,
    required String subtitleText,
    required String buttonText,
     String? keyId,
    bool? barrierDismiss,
    bool? barrierTransperent,
    bool? backButtonCanDismiss,

    required void Function() onYesPressed,

  }) async {
    return (await showDialog(
barrierColor: barrierTransperent ==true ?Colors.transparent:null,
routeSettings: RouteSettings(name: keyId),
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: barrierDismiss??true,
        builder: (BuildContext context) {
          return SingleButtonDialogue(
            backButtonCanDismiss: backButtonCanDismiss??true,
            titleText: titleText,
keyId: keyId,
key: Key(keyId??""),
            onYesPressed: onYesPressed,
            subtitleText: subtitleText, buttonText: buttonText,
          );
        }));
  }
  @override
  Future<void> loaderDialogue() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoaderDialogue();
        }));
  }
  @override
  Future<void> areYouSureDialogue({
  bool? barriertransperent,
  required String titleText,
    required String subtitleText,
    required String yesText,
    required String noText,
    required void Function() onYesPressed,
    required void Function() onNoPressed
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        barrierColor: barriertransperent==true?AppColors.transparent:null,
        builder: (BuildContext context) {
          return AreYouSureDialogue(
            noText: noText,yesText: yesText,
            onNoPressed: onNoPressed,
            onYesPressed: onYesPressed,
            subtitleText: subtitleText, titleText: titleText,
          );
        }));
  }

  // @override
  // Future<void> selectDateDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return SelectDateDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> orderConfirmAlertDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return const OrderConfirmAlertDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> cancelBookingAlertDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return CancelBookingDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> reportImgTitleDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return ReportImgTitleDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> rentScreeningDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return RentScreeningDialog();
  //       }));
  // }

  // @override
  // Future<void> businessRentScreeningDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return const BusinessRentScreeningDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> profileCreatedDialog({
  //   required void Function(bool verfied) profVerified,
  // }) async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return ProfileCreated(
  //           profVerified: profVerified,
  //         );
  //       }));
  // }
  //
  // @override
  // Future<void> productAvailabilityDialog({
  //   required String date,
  // }) async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierColor: AppColors.transparent,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return ProductAvailabilityDialog(
  //           date: date,
  //         );
  //       }));
  // }
  //
  // @override
  // Future<void> registerComplaintDialog() async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return RegisterComplaintDialog();
  //       }));
  // }
  //
  // @override
  // Future<void> commonImagePicker({
  //   required ImagePicker picker,
  //   required void Function(File file) pickedImage,
  // }) async {
  //   return (await showDialog(
  //       context: Globals.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return CommonImagePicker(
  //           picker: picker,
  //           pickedImage: pickedImage,
  //         );
  //       }));
  // }

  @override
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  }) {
    if (Globals.navigatorKey.currentContext == null) {
      return;
    }
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: content,
        backgroundColor: color,
        textColor: textclr,
        fontSize:
            MediaQuery.of(Globals.navigatorKey.currentContext!).size.width *
                0.03);
  }

  ///permissions

  // @override
  // Future<bool> handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     showSnackBar(
  //         content: 'Location services are disabled. Please enable the services',
  //         color: AppColors.red,
  //         textclr: AppColors.white);
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       showSnackBar(
  //           content: 'Location permissions are denied',
  //           color: AppColors.red,
  //           textclr: AppColors.white);
  //
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     showSnackBar(
  //         content:
  //             'Location permissions are permanently denied, we cannot request permissions.',
  //         color: AppColors.red,
  //         textclr: AppColors.white);
  //
  //     return false;
  //   }
  //   return true;
  // }
}

final dialogServiceProvider = Provider<DialogService>(
  (ref) => DialogServiceV1(),
);
