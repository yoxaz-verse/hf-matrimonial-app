import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/user/user_repo.dart';

abstract class UserService {
  Future<Map<String, dynamic>?> createUser({
    required String phoneNumber,
  });

  Future<Map<String, dynamic>?> getUser({
    required String authorization,
  });

  Future<Map<String, dynamic>?> updateUser({
    required String phoneCode,
    required String phoneNumber,
  });
}

class UserServiceV1 extends UserService {
  UserServiceV1(
    this.userRepository,
  );
  final UserRepository userRepository;
  @override
  Future<Map<String, dynamic>?> createUser({required String phoneNumber}) {
    return userRepository.createUser(phoneNumber: phoneNumber);
  }

  @override
  Future<Map<String, dynamic>?> getUser({
    required String authorization,
  }) {
    return userRepository.getUser(authorization: authorization);
  }

  @override
  Future<Map<String, dynamic>?> updateUser(
      {required String phoneCode, required String phoneNumber}) {
    return userRepository.updateUser(
        phoneCode: phoneCode, phoneNumber: phoneNumber);
  }
}

final userServiceProvider = Provider.autoDispose<UserService>((ref) {
  final service = UserServiceV1(
    ref.watch(userRepositoryProvider),
  );
  return service;
});
