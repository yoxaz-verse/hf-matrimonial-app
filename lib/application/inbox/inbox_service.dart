import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/inbox/inbox_repo.dart';

abstract class InboxService {
  Future<Map<String, dynamic>?> getUsersDetailsByLoginId({
    required String authtoken,
  });  Future<Map<String, dynamic>?> getInterestRecived({
    required String authtoken,
  }); Future<Map<String, dynamic>?> getInterestSent({
    required String authtoken,
  });
}

class InboxServiceV1 implements InboxService {
  InboxServiceV1(
    this.inboxRepository,
  );

  final InboxRepository inboxRepository;

  @override
  Future<Map<String, dynamic>?> getUsersDetailsByLoginId({
    required String authtoken,
  }) async {
    return inboxRepository.getUsersDetailsByLoginId(
      authtoken: authtoken,
    );
  }  @override
  Future<Map<String, dynamic>?> getInterestRecived({
    required String authtoken,
  }) async {
    return inboxRepository.getInterestRecived(
      authtoken: authtoken,
    );
  }@override
  Future<Map<String, dynamic>?> getInterestSent({
    required String authtoken,
  }) async {
    return inboxRepository.getInterestSent(
      authtoken: authtoken,
    );
  }
}

final inboxServiceProvider = Provider.autoDispose<InboxService>((ref) {
  final service = InboxServiceV1(
    ref.watch(inboxRepositoryProvider),
  );
  return service;
});
