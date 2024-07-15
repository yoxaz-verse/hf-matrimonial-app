import 'package:flutter/material.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/inbox/inbox_service.dart';


part 'send_interest_screen_controller.g.dart';

@riverpod
class SendInterestScreenController extends _$SendInterestScreenController{
  bool _isLoading= true;
  bool get isLoading => _isLoading;
  String authToken = "";
  List<Map<String,dynamic>> _inboxDataList = [];
  List<Map<String,dynamic>> get inboxDataList => _inboxDataList;
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await  PreferenceManagerUtils.getToken().then((token) async {
      authToken = token;
      await getInboxData();

    });
    _isLoading=false;
    state = const AsyncValue.data(null);
  }

  getInboxData() async {
    state = const AsyncLoading();
    Map<String,dynamic>? inboxData =
    await ref.read(inboxServiceProvider).getInterestSent(
      authtoken: authToken,
    );
    if(inboxData!=null && inboxData["data"]!=null && inboxData["data"]["interests"]!=null && inboxData["data"]["interests"].isNotEmpty){
      
      inboxData["data"]["interests"].forEach((item){
        _inboxDataList.add(item);
      });
      
    }
    state = const AsyncValue.data(null);
  }

}
