import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/add_on_interest/add_on_interest_repo.dart';

abstract class AddOnInterestService {
  Future<Map<String, dynamic>?> createAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
  });

  Future<Map<String, dynamic>?> updateAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
    required String id,
  });

  // Future<Map<String, dynamic>?> getAddOnInterestById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getAddOnInterest();

  Future<Map<String, dynamic>?> deleteAddOnInterest({
    required String authtoken,
    required String id,
  });
}

class AddOnInterestServiceV1 implements AddOnInterestService {
  AddOnInterestServiceV1(this.addOnInterestRepository);

  final AddOnInterestRepository addOnInterestRepository;

  Future<Map<String, dynamic>?> createAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
  }) async {
    return await addOnInterestRepository.createAddOnInterestDetail(
        authtoken: authtoken,
        name: name,
        interest: interest,
        price: price,
        description: description);
  }

  Future<Map<String, dynamic>?> updateAddOnInterestDetail({
    required String authtoken,
    required String name,
    required String interest,
    required String price,
    required String description,
    required String id,
  }) async {
    return await addOnInterestRepository.updateAddOnInterestDetail(
        authtoken: authtoken,
        name: name,
        interest: interest,
        price: price,
        description: description,
        id: id);
  }

  // Future<Map<String, dynamic>?> getAddOnInterestById({
  //   required String id,
  // }) async {
  //   return await addOnInterestRepository.getAddOnInterestById(
  //     id: id,
  //   );
  // }

  Future<Map<String, dynamic>?> getAddOnInterest() async {
    return await addOnInterestRepository.getAddOnInterest();
  }

  Future<Map<String, dynamic>?> deleteAddOnInterest({
    required String authtoken,
    required String id,
  }) async {
    return await addOnInterestRepository.deleteAddOnInterest(
        authtoken: authtoken, id: id);
  }
}

final addOnInterestServiceProvider =
    Provider.autoDispose<AddOnInterestService>((ref) {
  final service = AddOnInterestServiceV1(
    ref.watch(addOnInterestRepositoryProvider),
  );
  return service;
});
