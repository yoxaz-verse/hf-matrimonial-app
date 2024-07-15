import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/partner_preference/partner_preference_repo.dart';

abstract class PartnerPreferenceService {
  Future<Map<String, dynamic>?> createPartnerPreference({
    required String authtoken,
    required String minAge,
    required String maxAge,
    required String minHeight,
    required String maxHeight,
    required String gender,
    required String otherMartialStatus,
    required String otherGender,
    required String martialStatus,
    required String religion,
    required String otherPreferredReligion,
    required String education,
    required String otherPreferredEducation,
    required String occupation,
    required String otherPreferredOccupation,
    required String others,
    required String state,
    required String country,
  // required String location,
  });

  Future<Map<String, dynamic>?> createLocation({
    required String country,
    required String state,
  });

  Future<Map<String, dynamic>?> getLocation({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updatePartnerPreference({
    required String authorization,
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
    required String others,
    required String country,
    required String state,
  });

  // Future<Map<String, dynamic>?> getPartnerPreferenceById({
  //   required String authorization,
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getPartnerPreferenceByLoginAccount({
    required String authorization,
  });

  Future<Map<String, dynamic>?> deletePartnerPreference({
    required String authorization,
  });

  Future<Map<String, dynamic>?> getPartnerPreference({
    required String authorization,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String others,
    required String country,
    required String state,
    required String pageNo,
    required String limit,
  });
}

class PartnerPreferenceServiceV1 extends PartnerPreferenceService {
  PartnerPreferenceServiceV1(this.partnerPreferenceRepository);

  final PartnerPreferenceRepository partnerPreferenceRepository;

  @override
  Future<Map<String, dynamic>?> createPartnerPreference(
      {
        required String authtoken,
        required String minAge,
        required String maxAge,
        required String minHeight,
        required String maxHeight,
        required String gender,
        required String otherGender,
        required String martialStatus,
        required String religion,
        required String otherPreferredReligion,
        required String education,
        required String otherPreferredEducation,
        required String otherMartialStatus,
        required String occupation,
        required String otherPreferredOccupation,
        required String others,
        required String state,
        required String country,
     // required  String location,
      }) {
    return partnerPreferenceRepository.createPartnerPreference(
      minAge: minAge,
      maxAge: maxAge,
      minHeight: minHeight,
      maxHeight: maxHeight,
      gender: gender,
      martialStatus: martialStatus,
      religion: religion,
      education: education,
      occupation: occupation,
      others: others,
      state: state,
      country: country,
      // location: location,
      authtoken: authtoken,otherGender: otherGender,otherPreferredEducation: otherPreferredEducation,otherPreferredOccupation: otherPreferredOccupation,otherPreferredReligion: otherPreferredReligion,otherMartialStatus: otherMartialStatus
    );
  }

  Future<Map<String, dynamic>?> createLocation({
    required String country,
    required String state,
  }) {
    return partnerPreferenceRepository.createLocation(
      country: country,
      state: state,
    );
  }

  Future<Map<String, dynamic>?> getLocation({
    required String authtoken,
  }) {
    return partnerPreferenceRepository.getLocation(
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> updatePartnerPreference(
      {required String authorization,
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
      required String others,
      required String country,
      required String state}) {
    return partnerPreferenceRepository.updatePartnerPreference(
        authorization: authorization,
        minAge: minAge,
        maxAge: maxAge,
        minHeight: minHeight,
        maxHeight: maxHeight,
        gender: gender,
        martialStatus: martialStatus,
        religion: religion,
        education: education,
        occupation: occupation,
        others: others,
        country: country,
        state: state);
  }

  // @override
  // Future<Map<String, dynamic>?> getPartnerPreferenceById({
  //   required String authorization,
  //   required String id,
  // }) {
  //   return partnerPreferenceRepository.getPartnerPreferenceById(
  //       authorization: authorization, id: id);
  // }

  @override
  Future<Map<String, dynamic>?> getPartnerPreferenceByLoginAccount(
      {required String authorization}) {
    return partnerPreferenceRepository.getPartnerPreferenceByLoginAccount(
        authorization: authorization);
  }

  @override
  Future<Map<String, dynamic>?> deletePartnerPreference(
      {required String authorization}) {
    return partnerPreferenceRepository.deletePartnerPreference(
        authorization: authorization);
  }

  @override
  Future<Map<String, dynamic>?> getPartnerPreference({
    required String authorization,
    required String gender,
    required String martialStatus,
    required String religion,
    required String education,
    required String occupation,
    required String employedIn,
    required String others,
    required String country,
    required String state,
    required String pageNo,
    required String limit,
  }) {
    return partnerPreferenceRepository.getPartnerPreference(
        authorization: authorization,
        gender: gender,
        martialStatus: martialStatus,
        religion: religion,
        education: education,
        occupation: occupation,
        employedIn: employedIn,
        others: others,
        country: country,
        state: state,
        pageNo: pageNo,
        limit: limit);
  }
}

final partnerPreferenceServiceProvider =
    Provider.autoDispose<PartnerPreferenceService>((ref) {
  final service = PartnerPreferenceServiceV1(
    ref.watch(partnerPreferenceProvider),
  );
  return service;
});
