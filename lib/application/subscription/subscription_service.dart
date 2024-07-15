import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/subscription/subscription_repo.dart';

abstract class SubscriptionService {
  Future<Map<String, dynamic>?> createSubscription({
    required String name,
    required int interestPerMonth,
    required int price,
    required String description,
    required int duration,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> createUserSubscription({
    required String authtoken,
    required String subscriptionId,
    required String paymentId,
  });


  Future<Map<String, dynamic>?> createUserAddOnView({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });  Future<Map<String, dynamic>?> createUserAddOnInterest({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });  Future<Map<String, dynamic>?> createUserAddOnSlot({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  });
  Future<Map<String, dynamic>?> updateSubscription({
    required String userid,
    required String name,
    required int interestPerMonth,
    required int price,
    required String description,
    required int duration,
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getById({
  //   required String userid,
  //   required String authtoken,
  // });
  Future<Map<String, dynamic>?> getAddOnSlot();
  Future<Map<String, dynamic>?> getAddOnInterest();
  Future<Map<String, dynamic>?> getAddOnView();
  Future<Map<String, dynamic>?> getAllSubscription({
    required String userid,
    required String authtoken,
  });

  Future<bool?> deleteSubscription({
    required String userId,
    required String authtoken,
  });
}

class SubscriptionServiceV1 implements SubscriptionService {
  SubscriptionServiceV1(
    this.subscriptionRepository,
  );

  final SubscriptionRepository subscriptionRepository;

  @override
  Future<Map<String, dynamic>?> createSubscription(
      {required String name,
      required int interestPerMonth,
      required int price,
      required String description,
      required int duration,
      required String authtoken}) async {
    return subscriptionRepository.createSubscription(
      name: name,
      interestPerMonth: interestPerMonth,
      price: price,
      description: description,
      duration: duration,
      authtoken: authtoken,
    );
  }

  @override
  Future<bool?> deleteSubscription(
      {required String userId, required String authtoken}) async {
    return subscriptionRepository.deleteSubscription(
      userId: userId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllSubscription(
      {required String userid, required String authtoken}) async {
    return subscriptionRepository.getAllSubscription(
      userid: userid,
      authtoken: authtoken,
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getById(
  //     {required String userid, required String authtoken}) async {
  //   return subscriptionRepository.getById(
  //     userid: userid,
  //     authtoken: authtoken,
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> updateSubscription(
      {required String userid,
      required String name,
      required int interestPerMonth,
      required int price,
      required String description,
      required int duration,
      required String authtoken}) async {
    return subscriptionRepository.updateSubscription(
      userid: userid,
      name: name,
      interestPerMonth: interestPerMonth,
      price: price,
      description: description,
      duration: duration,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> createUserSubscription({
    required String authtoken,
    required String subscriptionId,
    required String paymentId,
  }) async {
    return subscriptionRepository.createUserSubscription(
      paymentId: paymentId,
      subscriptionId: subscriptionId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> createUserAddOnView({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  }) async {
    return subscriptionRepository.createUserAddOnView(
      paymentId: paymentId,
      addOnId: addOnId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> createUserAddOnInterest({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  }) async {
    return subscriptionRepository.createUserAddOnInterest(
      paymentId: paymentId,
      addOnId: addOnId,
      authtoken: authtoken,
    );
  }  @override
  Future<Map<String, dynamic>?> createUserAddOnSlot({
    required String authtoken,
    required String addOnId,
    required String paymentId,
  }) async {
    return subscriptionRepository.createUserAddOnSlot(
      paymentId: paymentId,
      addOnId: addOnId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getAddOnInterest() async {
    return await subscriptionRepository.getAddOnInterest();
  }

  @override
  Future<Map<String, dynamic>?> getAddOnView() async {
    return await subscriptionRepository.getAddOnView();
  }

  @override
  Future<Map<String, dynamic>?> getAddOnSlot() async {
    return await subscriptionRepository.getAddOnSlot();
  }
}

final subscriptionServiceProvider =
    Provider.autoDispose<SubscriptionService>((ref) {
  final service = SubscriptionServiceV1(
    ref.watch(subscriptionRepositoryProvider),
  );
  return service;
});
