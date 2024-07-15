import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/notification/notification_repo.dart';

abstract class NotificationService {
  Future<Map<String, dynamic>?> createNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  });

  Future<Map<String, dynamic>?> updateNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  });

  Future<Map<String, dynamic>?> getNotification({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAdminNotificationOfLoginUser({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getNotificationById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> deleteNotification({
    required String authtoken,
  });
}

class NotificationServiceV1 implements NotificationService {
  NotificationServiceV1(this.notificationRepository);

  final NotificationRepository notificationRepository;

  Future<Map<String, dynamic>?> createNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  }) async {
    return await notificationRepository.createNotification(
        authtoken: authtoken,
        accountId: accountId,
        title: title,
        description: description);
  }

  Future<Map<String, dynamic>?> updateNotification({
    required String authtoken,
    required List<String> accountId,
    required String title,
    required String description,
  }) async {
    return await notificationRepository.updateNotification(
        authtoken: authtoken,
        accountId: accountId,
        title: title,
        description: description);
  }

  Future<Map<String, dynamic>?> getNotification({
    required String authtoken,
  }) async {
    return await notificationRepository.getNotification(authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> getAdminNotificationOfLoginUser({
    required String authtoken,
  }) async {
    return await notificationRepository.getAdminNotificationOfLoginUser(
        authtoken: authtoken);
  }

  // Future<Map<String, dynamic>?> getNotificationById({
  //   required String id,
  // }) async {
  //   return await notificationRepository.getNotificationById(id: id);
  // }

  Future<Map<String, dynamic>?> deleteNotification({
    required String authtoken,
  }) async {
    return await notificationRepository.deleteNotification(
        authtoken: authtoken);
  }
}

final notificationServiceProvider =
    Provider.autoDispose<NotificationService>((ref) {
  final service = NotificationServiceV1(
    ref.watch(notificationRepositoryProvider),
  );
  return service;
});
