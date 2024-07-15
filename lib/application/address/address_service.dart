import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/address/address_repo.dart';

abstract class AddressService {
  Future<Map<String, dynamic>?> createaddress({
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updateaddress({
    required String addessid,
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getaddress({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getaddressbyid({
  //   required String authtoken,
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getalladdress({
    required String authtoken,
  });
}

class AddressServiceV1 implements AddressService {
  AddressServiceV1(
    this.addressRepository,
  );

  final AddressRepository addressRepository;

  @override
  Future<Map<String, dynamic>?> createaddress({
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  }) async {
    return await addressRepository.createaddress(
      Address: Address,
      Distict: Distict,
      State: State,
      Country: Country,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> updateaddress({
    required String addessid,
    required String Address,
    required String Distict,
    required String State,
    required String Country,
    required String authtoken,
  }) async {
    return await addressRepository.updateaddress(
      Address: Address,
      Distict: Distict,
      State: State,
      Country: Country,
      addessid: addessid,
      authtoken: authtoken,
    );
  }

  @override
  Future<Map<String, dynamic>?> getaddress({
    required String authtoken,
  }) async {
    return await addressRepository.getaddress(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getalladdress({
    required String authtoken,
  }) async {
    return await addressRepository.getalladdress(
      authtoken: '',
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getaddressbyid({
  //   required String authtoken,
  //   required String id,
  // }) async {
  //   return await addressRepository.getaddressbyid(
  //     authtoken: authtoken,
  //     id: 'id',
  //   );
  // }
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(addressRepositoryProvider),
  );
  return service;
});
