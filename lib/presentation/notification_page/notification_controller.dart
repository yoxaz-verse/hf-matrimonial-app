import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/admin_notification/admin_notification_screen_controller.dart';
import 'package:heavenlymatrimony/presentation/inbox/inbox_page_controller.dart';
import 'package:heavenlymatrimony/presentation/send_interest_page/send_interest_screen_controller.dart';
import 'package:heavenlymatrimony/presentation/send_interest_reason/send_interest_reason_controller.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/inbox/inbox_service.dart';
import '../../application/notification/notification_services.dart';


part 'notification_controller.g.dart';

@riverpod
class notificationController extends _$notificationController{

  bool _isLoading= false;
  bool get isLoading => _isLoading;
  int _inboxCount = 0;
  int get inboxCount =>_inboxCount;
  int _sentInterestCount = 0;
  int get sentInterestCount =>_sentInterestCount;

  int _adminCount = 0;
  int get adminCount =>_adminCount;
String authToken = '';
  @override

  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await PreferenceManagerUtils.getToken().then((token) async {
      authToken = token;
      await getCountData();

    });
    _isLoading=false;
    state = const AsyncValue.data(null);
  }
getCountData() async {

    //admin api
  Map<String,dynamic>? data = await ref
      .read(notificationServiceProvider)
      .getAdminNotificationOfLoginUser(authtoken: authToken);
  if(data!=null && data["data"]!=null && data["data"]!=null && data["data"].isNotEmpty){
    _adminCount = data["data"].length;
  }
  // send interest api
  Map<String,dynamic>? sentInterestData =
  await ref.read(inboxServiceProvider).getInterestSent(
    authtoken: authToken,
  );
  if(sentInterestData!=null && sentInterestData["data"]!=null && sentInterestData["data"]["interests"]!=null && sentInterestData["data"]["interests"].isNotEmpty){
    print("sdfkjbjkde :: ${sentInterestData}");

    _sentInterestCount = sentInterestData["data"]["interests"].length;
  }


  // inbox api
  Map<String,dynamic>? inboxData =
  await ref.read(inboxServiceProvider).getInterestRecived(
    authtoken: authToken,
  );
  if(inboxData!=null && inboxData["data"]!=null && inboxData["data"]["interests"]!=null && inboxData["data"]["interests"].isNotEmpty){
    _inboxCount = inboxData["data"]["interests"].length;
  }


}


}
