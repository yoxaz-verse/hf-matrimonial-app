import 'package:heavenlymatrimony/application/subscribed%20user/subscribed_service.dart';
import 'package:heavenlymatrimony/data/family%20details/family_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class FamilyDetailsService {
  Future<Map<String, dynamic>?> createFamilyDetails({
    required String authToken,
    required String father,
    required String fatherOccupation,
    required String otherFatherOccupation,
    required String mother,
    required String motherOccupation,
    required String otherMotherOccupation,
    required String numberOfBrother,
    required String numberOfSister,
  });

  Future<Map<String, dynamic>?> updateFamilyDetails({
    required String father,
    required String mother,
    required String numberOfSister,
  });

  Future<Map<String, dynamic>?> getFamilyDetails({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> deleteFamilyDetails({
    required String authtoken,
  });
}

class FamilyDetailsServiceV1 extends FamilyDetailsService {
  FamilyDetailsServiceV1(this.familyDetailRepository);

  final FamilyDetailRepository familyDetailRepository;

  @override
  Future<Map<String, dynamic>?> createFamilyDetails(
      {    required String authToken,
        required String father,
        required String fatherOccupation,
        required String otherFatherOccupation,
        required String mother,
        required String motherOccupation,
        required String otherMotherOccupation,
        required String numberOfBrother,
        required String numberOfSister,}) {
    return familyDetailRepository.createFamilyDetails(
      father: father,
      fatherOccupation: fatherOccupation,
      mother: mother,
      motherOccupation: motherOccupation,
      numberOfBrother: numberOfBrother,
      numberOfSister: numberOfSister,
      authToken: authToken,otherFatherOccupation: otherFatherOccupation,otherMotherOccupation: otherMotherOccupation

    );
  }

  Future<Map<String, dynamic>?> updateFamilyDetails({
    required String father,
    required String mother,
    required String numberOfSister,
  }) {
    return familyDetailRepository.updateFamilyDetails(
        father: father, mother: mother, numberOfSister: numberOfSister);
  }

  Future<Map<String, dynamic>?> getFamilyDetails({required String authtoken}) {
    return familyDetailRepository.getFamilyDetails(authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> deleteFamilyDetails(
      {required String authtoken}) {
    return familyDetailRepository.deleteFamilyDetails(authtoken: authtoken);
  }
}

final familyDetailsServiceProvider =
    Provider.autoDispose<FamilyDetailsService>((ref) {
  final service = FamilyDetailsServiceV1(
    ref.watch(familydetailsRepositoryProvider),
  );
  return service;
});
