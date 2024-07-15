import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/config.dart';
import '../api_client/api_client.dart';

abstract class DropDownRepository {
  Future<Map<String, dynamic>?> getallMaritialStatus({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllCollege({
    required String authtoken,
  });  Future<Map<String, dynamic>?> getAllStates({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallPhysicalStatus({
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

  Future<Map<String, dynamic>?> getallGender({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallReligion({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallEducation({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getallEmployedIn();

  Future<Map<String, dynamic>?> getallOccupation({
    required String authtoken,
  });

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

class DropDownRepositoryV1 implements DropDownRepository {
  DropDownRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> getallMaritialStatus({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllMartialStatus),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }


  @override
  Future<Map<String, dynamic>?> getAllCollege({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllCollege),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  } @override
  Future<Map<String, dynamic>?> getAllStates({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllStates),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallPhysicalStatus({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllPhysicalStatus),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallDenomination({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllDenomination),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallDenominationByReligion({
    required String authtoken,
    required String religionId,
  }) {
    return api.getData(
      uri: Uri.parse(
          "${ApiConfig.getDenominationByReligion}?religion=${religionId}"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallChurch({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllChurch),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != [] && jsonMap["data"] != null) {
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallGender({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllGender),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallReligion({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllReligion),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallEducation({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllEducation),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallOccupation({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllOccupation),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallEmployedIn() {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllEmploymentType),
      headers: api.createHeaders(authtoken: ''),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getallWorkLocation({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllLocation),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllCountry({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllCountry),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> getAllStateByCountryId({
    required String authtoken,
    required String countryId,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.getAllStateByCountryId}$countryId"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final DropDownRepositoryProvider =
    Provider<DropDownRepository>((ref) => DropDownRepositoryV1(
          ApiClient(),
        ));
