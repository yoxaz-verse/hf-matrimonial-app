import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/interest/interest_repo.dart';

abstract class InterestService {
  Future<Map<String, dynamic>?> createInterest({
    required String reason,
    required String receiverId,
    required String authtoken,
  });
  Future<Map<String, dynamic>?> updateInterest({
    required String reason,
    required String receiverId,
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getInterestById({
  //   required String userid,
  //   required String authtoken,
  // });

  Future<Map<String, dynamic>?> getsendedInterest({
    required String userid,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getreceivedInterest({
    required String userid,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getInterest({
    required String authtoken,
    String id = "",
    String senderId = "",
    String receiverId = "",
    String pageNo = "",
    String limit = "",
  });
  Future<bool?> deleteInterest({
    required String userId,
    required String authtoken,
  });
}

class InterestServiceV1 implements InterestService {
  InterestServiceV1(
    this.interestRepository,
  );

  final InterestRepository interestRepository;

  @override
  Future<Map<String, dynamic>?> createInterest(
      {required String reason,
      required String receiverId,
      required String authtoken}) async {
    return interestRepository.createInterest(
      reason: reason,
      receiverId: receiverId,
      authtoken: authtoken,
    );
  }

  @override
  Future<bool?> deleteInterest(
      {required String userId, required String authtoken}) async {
    return interestRepository.deleteInterest(
      userId: userId,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getInterest({
    required String authtoken,
    String id = "",
    String senderId = "",
    String receiverId = "",
    String pageNo = "",
    String limit = "",
  }) {
    return interestRepository.getInterest(
      id: id,
      senderId: senderId,
      receiverId: receiverId,
      pageNo: pageNo,
      limit: limit,
      authtoken: authtoken,
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getInterestById(
  //     {required String userid,
  //       required String authtoken})async{
  //   return interestRepository.getInterestById(
  //     userid: userid,
  //     authtoken: authtoken,
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> getsendedInterest(
      {required String userid, required String authtoken}) async {
    return interestRepository.getsendedInterest(
      userid: userid,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getreceivedInterest(
      {required String userid, required String authtoken}) {
    return interestRepository.getreceivedInterest(
      userid: userid,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> updateInterest(
      {required String reason,
      required String receiverId,
      required String authtoken}) {
    return interestRepository.updateInterest(
      reason: reason,
      receiverId: receiverId,
      authtoken: authtoken,
    );
  }
}

final interestServiceProvider = Provider.autoDispose<InterestService>((ref) {
  final service = InterestServiceV1(
    ref.watch(interestRepositoryProvider),
  );
  return service;
});
