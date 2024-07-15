import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/home_screen/home_screen_repo.dart';
import 'package:heavenlymatrimony/data/home_screen/home_screen_repo.dart';
import 'package:heavenlymatrimony/data/home_screen/home_screen_repo.dart';
import 'package:heavenlymatrimony/data/home_screen/home_screen_repo.dart';

abstract class HomeService {
  Future<Map<String, dynamic>?> getAllUserCardsData({
    required String authtoken,
    required String lastKey,
    required int limit,
  });
  Future<Map<String, dynamic>?> getAllUserCardsDataOfNewMatches({
    required String authtoken,
    required String lastKey,
    required int limit,
  });

  Future<Map<String, dynamic>?> getUsersCardFullDetailsById({
    required String authtoken,
    required String accountId,
  });
  Future<Map<String, dynamic>?> getAllUserCardsDataOfingMembers({
    required String authtoken,
    required String lastKey,
    required int limit,
  });
  Future<Map<String, dynamic>?> getAllUserCardsDataBySearch({
    required String authtoken,
    required String accountId,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String country,
    required String state,
    required String profileId,
    required String lastKey,
    required int limit,
    required String name,
  });
}

class HomeServiceV1 implements HomeService {
  HomeServiceV1(
    this.homeRepository,
  );

  final HomeRepository homeRepository;

  @override
  Future<Map<String, dynamic>?> getAllUserCardsData({
    required String authtoken,
    required String lastKey,
    required int limit,clip
  }) async {
    return homeRepository.getAllUserCardsData(
      lastKey: lastKey,
      limit: limit,
      authtoken: authtoken,
    );
  }   @override
  Future<Map<String, dynamic>?> getAllUserCardsDataOfNewMatches({
    required String authtoken,
    required String lastKey,
    required int limit,
  }) async {
    return homeRepository.getAllUserCardsDataOfNewMatches(
      lastKey: lastKey,
      limit: limit,
      authtoken: authtoken,
    );
  }
  Future<Map<String, dynamic>?> getAllUserCardsDataOfingMembers({
    required String authtoken,
    required String lastKey,
    required int limit,
  }) async {
    return homeRepository.getAllUserCardsDataOfingMembers(
      lastKey: lastKey,
      limit: limit,
      authtoken: authtoken,
    );
  }


  @override
  Future<Map<String, dynamic>?> getAllUserCardsDataBySearch({
    required String authtoken,
    required String accountId,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String country,
    required String state,
    required String profileId,
    required String lastKey,
    required int limit,
    required String name,
  }) async {
    return homeRepository.getAllUserCardsDataBySearch(authtoken: authtoken, accountId: accountId, minAge: minAge, maxAge: maxAge, minHeight: minHeight, maxHeight: maxHeight, gender: gender, martialStatus: martialStatus, religion: religion, education: education, occupation: occupation, employedIn: employedIn, country: country, state: state, profileId: profileId, lastKey: lastKey, limit: limit, name: name);
  }

  @override
  Future<Map<String, dynamic>?> getUsersCardFullDetailsById({
    required String authtoken,
    required String accountId,
  }) async {
    return homeRepository.getUsersCardFullDetailsById(
      authtoken: authtoken,
      accountId: accountId,
    );
  }
}

final homeServiceProvider = Provider.autoDispose<HomeService>((ref) {
  final service = HomeServiceV1(
    ref.watch(homeRepositoryProvider),
  );
  return service;
});
