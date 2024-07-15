import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/rec%20detail/rec_detail_repo.dart';

abstract class RecDetailService {
  Future<Map<String, dynamic>?> createRecDetail({
    required String authtoken,
    required String religion,
    required String otherReligion,
    required String denomination,
    required String otherDenomination,
    required String church,
    required String otherChurch,
    required String highestEducation,
    required String otherEducation,
    required String college,
    required String otherCollege,
    required String occupation,
    required String otherOccupation,
    required String occupationDetail,
    required String employedIn,
    required String workLocation,
    required String otherWorkLocation,
  });

  Future<Map<String, dynamic>?> updateRecDetail({
    required String authtoken,
    required String college,
    required String occupation,
    required String occupationDetail,
    required String workLocation,
    required String id,
  });
  Future<Map<String, dynamic>?> deleteRecDetail({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getRecDetailById({
  //   required String authtoken,
  // });

  Future<Map<String, dynamic>?> getRecDetailByLoginAccount({
    required String authtoken,
  });
}

class RecDetailServiceV1 implements RecDetailService {
  RecDetailServiceV1(
    this.recRepository,
  );

  final RecRepository recRepository;

  @override
  Future<Map<String, dynamic>?> createRecDetail({
    required String authtoken,
    required String religion,
    required String otherReligion,
    required String denomination,
    required String otherDenomination,
    required String church,
    required String otherChurch,
    required String highestEducation,
    required String otherEducation,
    required String college,
    required String otherCollege,
    required String occupation,
    required String otherOccupation,
    required String occupationDetail,
    required String employedIn,
    required String workLocation,
    required String otherWorkLocation,
  }) async {
    return await recRepository.createRecDetail(authtoken: authtoken, religion: religion, otherReligion: otherReligion, denomination: denomination, otherDenomination: otherDenomination, church: church, otherChurch: otherChurch, highestEducation: highestEducation, otherEducation: otherEducation, college: college, otherCollege: otherCollege, occupation: occupation, otherOccupation: otherOccupation, occupationDetail: occupationDetail, employedIn: employedIn, workLocation: workLocation, otherWorkLocation: otherWorkLocation);
  }

  @override
  Future<Map<String, dynamic>?> updateRecDetail({
    required String authtoken,
    required String college,
    required String occupation,
    required String occupationDetail,
    required String workLocation,
    required String id,
  }) async {
    return await recRepository.updateRecDetail(
        authtoken: authtoken,
        college: college,
        occupation: occupation,
        occupationDetail: occupationDetail,
        workLocation: workLocation,
        id: id);
  }

  Future<Map<String, dynamic>?> deleteRecDetail({
    required String authtoken,
  }) async {
    return await recRepository.deleteRecDetail(authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> getRecDetailByLoginAccount({
    required String authtoken,
  }) async {
    return await recRepository.getRecDetailByLoginAccount(authtoken: authtoken);
  }

//   Future<Map<String, dynamic>?> getRecDetailById({
//     required String authtoken,
//   }) async {
//     return await recRepository.getRecDetailById(authtoken: authtoken);
//   }
}

final recDetailServiceProvider = Provider.autoDispose<RecDetailService>((ref) {
  final service = RecDetailServiceV1(
    ref.watch(recRepositoryProvider),
  );
  return service;
});
