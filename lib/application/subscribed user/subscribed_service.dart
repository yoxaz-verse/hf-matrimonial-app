import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/subscribed user/subscribed_repo.dart';

abstract class userSubscribedService {
  Future<Map<String, dynamic>?> createUserSubscribed({
    required String subscription,
    required String authorization,
    required String payment,
  });

  Future<Map<String, dynamic>?> getUserSubscription(
      {required String authtoken,
      required String id,
      required String accountId,
      required String pageNo,
      required String limit});
  Future<Map<String, dynamic>?> getUserSubscriptionloging({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> updateUserSubscription({
    required String subscription,
    required String authorization,
    required String payment,
  });
  // Future<Map<String, dynamic>?> getUserSubscriptionId({
  //   required String authtoken,
  // });
  Future<Map<String, dynamic>?> deleteUserSubscription({
    required String authtoken,
  });
}

class userSubscribedServiceV1 extends userSubscribedService {
  userSubscribedServiceV1(this.userSubscribedRepository);

  final UserSubscribedRepository userSubscribedRepository;

  @override
  Future<Map<String, dynamic>?> createUserSubscribed(
      {required String subscription,
      required String authorization,
      required String payment}) {
    return userSubscribedRepository.createUserSubscription(
        subscription: subscription,
        authorization: authorization,
        payment: payment);
  }

  @override
  Future<Map<String, dynamic>?> getUserSubscription(
      {required String authtoken,
      required String id,
      required String accountId,
      required String pageNo,
      required String limit}) {
    return userSubscribedRepository.getUserSubscription(
        authtoken: authtoken,
        id: id,
        accountId: accountId,
        pageNo: pageNo,
        limit: limit);
  }

  @override
  Future<Map<String, dynamic>?> deleteUserSubscription(
      {required String authtoken}) {
    return userSubscribedRepository.deleteUserSubscription(
        authtoken: authtoken);
  }

  // @override
  // Future<Map<String, dynamic>?> getUserSubscriptionId({required String authtoken}) {
  //  return userSubscribedRepository.getUserSubscriptionId(authtoken: authtoken);
  // }

  @override
  Future<Map<String, dynamic>?> getUserSubscriptionloging(
      {required String authtoken}) {
    return userSubscribedRepository.getUserSubscriptionloging(
        authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> updateUserSubscription(
      {required String subscription,
      required String authorization,
      required String payment}) {
    return userSubscribedRepository.updateUserSubscription(
        subscription: subscription,
        authorization: authorization,
        payment: payment);
  }

  final userSubscribedServiceProvider =
      Provider.autoDispose<userSubscribedService>((ref) {
    final service = userSubscribedServiceV1(
      ref.watch(userSubscribedRepositoryProvider),
    );
    return service;
  });
}
