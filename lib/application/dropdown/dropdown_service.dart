import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/dropdown/dropdown_repo.dart';

abstract class DropDownService {
  Future<Map<String, dynamic>?> getallMaritialStatus({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllCollege({
    required String authtoken,
  });


  Future<Map<String, dynamic>?> getallPhysicalStatus({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallGender({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllStates({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallDenomination({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallDenominationByReligion({
    required String authtoken,
    required String religionId,
  });

  Future<Map<String, dynamic>?> getallChurch({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallReligion({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallEducation({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallOccupation({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallEmployedIn();

  Future<Map<String, dynamic>?> getallWorkLocation({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllCountry({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllStateByCountryId({
    required String authtoken,
    required String countryId,
  });
}

class DropDownServiceV1 implements DropDownService {
  DropDownServiceV1(
    this.dropDownRepository,
  );

  final DropDownRepository dropDownRepository;

  @override
  Future<Map<String, dynamic>?> getallMaritialStatus({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallMaritialStatus(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getAllCollege({
    required String authtoken,
  }) async {
    return await dropDownRepository.getAllCollege(authtoken: authtoken);
  }  @override
  Future<Map<String, dynamic>?> getAllStates({
    required String authtoken,
  }) async {
    return await dropDownRepository.getAllStates(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallPhysicalStatus({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallPhysicalStatus(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallDenomination({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallDenomination(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallDenominationByReligion(
      {required String authtoken, required String religionId}) async {
    return await dropDownRepository.getallDenominationByReligion(
        authtoken: authtoken, religionId: religionId);
  }

  @override
  Future<Map<String, dynamic>?> getallChurch({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallChurch(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallGender({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallGender(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallReligion({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallReligion(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallEducation({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallEducation(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallOccupation({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallOccupation(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getallEmployedIn() async {
    return await dropDownRepository.getallEmployedIn();
  }

  @override
  Future<Map<String, dynamic>?> getallWorkLocation({
    required String authtoken,
  }) async {
    return await dropDownRepository.getallWorkLocation(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getAllCountry({ required String authtoken,}) async {
    return await dropDownRepository.getAllCountry( authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> getAllStateByCountryId({ required String authtoken,  required String countryId,}) async {
    return await dropDownRepository.getAllStateByCountryId( authtoken: authtoken, countryId : countryId);
  }
}

final DropDownServiceProvider = Provider.autoDispose<DropDownService>((ref) {
  final service = DropDownServiceV1(
    ref.watch(DropDownRepositoryProvider),
  );
  return service;
});
