import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/inbox/inbox_service.dart';
import '../../data/shared_pref/shared_pref.dart';
import '../../utils/color.dart';

part 'inbox_page_controller.g.dart';

@riverpod
class InboxPageController extends _$InboxPageController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController demoname = TextEditingController();
  Map<String, dynamic>? userresponse;

  List<Map<String, dynamic>> _inboxDataList = [];
  List<Map<String, dynamic>> get inboxDataList => _inboxDataList;
  String authToken = "";
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await PreferenceManagerUtils.getToken().then((token) async {
      authToken = token;
      await getInboxData();
    });

    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  getInboxData() async {
    state = const AsyncLoading();
    Map<String, dynamic>? inboxData =
        await ref.read(inboxServiceProvider).getInterestRecived(
              authtoken: authToken,
            );
    if (inboxData != null &&
        inboxData["data"] != null &&
        inboxData["data"]["interests"] != null &&
        inboxData["data"]["interests"].isNotEmpty) {
      inboxData["data"]["interests"].forEach((item) {
        _inboxDataList.add(item);
      });
    }
    state = const AsyncValue.data(null);
  }
  // getNotificationData() async {
  //   state = const AsyncLoading();
  //   await PreferenceManagerUtils.getToken().then((value) {
  //     authToken = value;
  //   });
  //   try {
  //     Map<String, dynamic>? userresponse =
  //     await ref.read(inboxServiceProvider).getUsersDetailsByLoginId(
  //       authtoken: authToken,
  //     );
  //     if (userresponse?["data"] != null) {
  //       demoname.text = userresponse?["data"][0]["title"];
  //
  //
  //       // descriptionCome error occurred please try again in some time...",
  //       color:
  //       AppColors.red.withOpacity(0.7);
  //       textclr:
  //       AppColors.white;
  //     }
  //   } catch (e, s) {
  //
  //     DialogServiceV1().showSnackBar(
  //         content: "Server error $e",
  //         color: AppColors.red.withOpacity(0.7),
  //         textclr: AppColors.white);
  //   }
  //
  //   state = const AsyncValue.data(null);
  // }

  String calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age.toString();
  }
}
