import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/enquires/enquires_repo.dart';

abstract class EnquiresService {
  Future<Map<String, dynamic>?> createEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  });

  Future<Map<String, dynamic>?> getEnquires({
    required String authToken,
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  });

  Future<Map<String, dynamic>?> getEnquiresById({
    required String authToken,
    required String id,
  });

  Future<Map<String, dynamic>?> getAssignedEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> getActiveEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> getCloseEnquires({
    required String authToken,
  });

  Future<Map<String, dynamic>?> deleteEnquires({
    required String authToken,
  });
}

class EnquiresServiceV1 extends EnquiresService {
  EnquiresServiceV1(this.enquiresRepository);

  final EnquiresRepository enquiresRepository;

  @override
  Future<Map<String, dynamic>?> createEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
  }) {
    return enquiresRepository.createEnquires(
        name: name, email: email, phoneNumber: phoneNumber, message: message,);
  }

  @override
  Future<Map<String, dynamic>?> getEnquires({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
    required String authToken,
  }) {
    return enquiresRepository.getEnquires(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        message: message,
        authToken: '');
  }

  @override
  Future<Map<String, dynamic>?> getEnquiresById(
      {required String authToken, required String id}) {
    return enquiresRepository.getEnquiresById(authToken: authToken, id: id);
  }

  @override
  Future<Map<String, dynamic>?> getAssignedEnquires(
      {required String authToken}) {
    return enquiresRepository.getAssignedEnquires(authToken: authToken);
  }

  @override
  Future<Map<String, dynamic>?> getActiveEnquires({required String authToken}) {
    return enquiresRepository.getActiveEnquires(authToken: authToken);
  }

  @override
  Future<Map<String, dynamic>?> getCloseEnquires({required String authToken}) {
    return enquiresRepository.getCloseEnquires(authToken: authToken);
  }

  @override
  Future<Map<String, dynamic>?> deleteEnquires({required String authToken}) {
    return enquiresRepository.deleteEnquires(authToken: authToken);
  }
}

final enquiresServiceProvider = Provider.autoDispose((ref) {
  final service = EnquiresServiceV1(
    ref.watch(enquiresProvider),
  );
  return service;
});
