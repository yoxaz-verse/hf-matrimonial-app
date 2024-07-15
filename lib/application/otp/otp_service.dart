import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/otp/otp_repo.dart';

abstract class OtpService {
  Future<Map<String, dynamic>?> createOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
  });

  Future<Map<String, dynamic>?> verifyOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  });  Future<Map<String, dynamic>?> createForgetPasswordOtp({

    // required String phoneNumber,
    required String email,
  });

  Future<Map<String, dynamic>?> verifyForgetPasswordOtp({
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  });
}

class OtpServiceV1 implements OtpService {
  OtpServiceV1(this.otpRepository);

  final OtpRepository otpRepository;

  Future<Map<String, dynamic>?> createOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
  }) async {
    return await otpRepository.createOtp(
        authtoken: authtoken, phoneNumber: phoneNumber, email: email);
  }

  Future<Map<String, dynamic>?> verifyOtp({
    required String authtoken,
    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  }) async {
    return await otpRepository.verifyOtp(
      authtoken: authtoken,
      phoneNumber: phoneNumber,
      email: email,
      phoneOtp: phoneOtp,
      emailOtp: emailOtp,
    );
  }
  Future<Map<String, dynamic>?> createForgetPasswordOtp({

    // required String phoneNumber,
    required String email,
  }) async {
    return await otpRepository.createForgetPasswordOtp(
         email: email);
  }

  Future<Map<String, dynamic>?> verifyForgetPasswordOtp({

    required String phoneNumber,
    required String email,
    required String phoneOtp,
    required String emailOtp,
  }) async {
    return await otpRepository.verifyForgetPasswordOtp(

      phoneNumber: phoneNumber,
      email: email,
      phoneOtp: phoneOtp,
      emailOtp: emailOtp,
    );
  }
}

final otpServiceProvider = Provider.autoDispose<OtpService>((ref) {
  final service = OtpServiceV1(
    ref.watch(otpRepositoryProvider),
  );
  return service;
});
