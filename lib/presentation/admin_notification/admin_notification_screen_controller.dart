import 'dart:async';

import 'package:heavenlymatrimony/application/notification/notification_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/shared_pref/shared_pref.dart';
import '../../utils/color.dart';
import '../error/error_screen.dart';

part 'admin_notification_screen_controller.g.dart';

@riverpod
class AdminNotificationScreenController
    extends _$AdminNotificationScreenController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _title = "";

  String get title => _title;
  String _description = "";

  String get description => _description;
  String authToken = "";
  List<Map<String,dynamic>> _adminNotificationDataList = [];
  List<Map<String,dynamic>> get adminNotificationDataList => _adminNotificationDataList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    // await Future.delayed(Duration(seconds: 2));
    await PreferenceManagerUtils.getToken().then((authtoken) async {
      await PreferenceManagerUtils.getUserName().then((userName) async {
        _title = title;
        _description = description;
        authToken = authtoken;
        await getNotification();
      });
    });
    _isLoading = false;

    state = const AsyncValue.data(null);
  }

  //error time =>>> something was wrong page calling code

  //   try {
  //     state = const AsyncLoading();
  //      _isLoading = true;
  //
  //     await Future.delayed(Duration(seconds: 2));
  //     throw Exception('Opps! \n Something Was Wrong ');
  //   } catch (error, stackTrace) {
  //     ErrorScreen(
  //         text: error.toString(),
  //         backgroundColor: AppColors.white,
  //         color: AppColors.red
  //     );
  //     rethrow;
  //
  //   }
  // }
  Future<void> getNotification() async {
    state = const AsyncLoading();

    Map<String,dynamic>? data = await ref
        .read(notificationServiceProvider)
        .getAdminNotificationOfLoginUser(authtoken: authToken);
    if(data!=null && data["data"]!=null && data["data"].isNotEmpty){
      data["data"].forEach((item){
        _adminNotificationDataList.add(item);
      });
      
    }
    state = const AsyncValue.data(null);

  }
}
