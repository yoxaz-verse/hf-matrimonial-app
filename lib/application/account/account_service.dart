import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/account/account_repository.dart';
import '../../utils/config.dart';

abstract class AccountService {
  Future<Map<String, dynamic>?> createAccount({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String phoneNumber,
  });
  Future<Map<String, dynamic>?> applyForVerification({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> getAccountDetails({required String authtoken});
  Future<Map<String, dynamic>?> getAllAccountDetailsByLogin({required String authtoken});
  Future<Map<String, dynamic>?> logOut({required String authtoken});
  Future<Map<String, dynamic>?> registerWithSocial({
    required String name,
    required String email,
    required String phoneNo,
    required bool isGoogle,
    required bool isFacebook,
    required String gender,
  });
  Future<Map<String, dynamic>?> loginAccount({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>?> deleteAccount({required String authtoken});
  Future<User?> loginWithGoogle();
  Future<Map<String, dynamic>?> loginWithSocial({
    required String email,
  });
  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential?> signOutWithFacebook();
  Future<Map<String, dynamic>?> forgetPassword(
      {required String email,
      required String password,
      required String authtoken});

  Future<Map<String, dynamic>?> updatePassword(
      {required String email,
      required String newpassword,
      required String password,
      required String authtoken});
}

class AccountServiceV1 implements AccountService {
  AccountServiceV1(
    this.accountRepository,
  );

  final AccountRepository accountRepository;

  @override
  Future<Map<String, dynamic>?> createAccount({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    return await accountRepository.createAccount(
        name: name, email: email, password: password, phoneNumber: phoneNumber,gender: gender);
  }  @override
  Future<Map<String, dynamic>?> applyForVerification({
    required String authtoken,
  }) async {
    return await accountRepository.applyForVerification(authtoken: authtoken);
  }
  @override
  Future<Map<String, dynamic>?> deleteAccount({required String authtoken})  async {
    return await accountRepository.deleteAccount(authtoken: authtoken);
  }
  @override
  Future<Map<String, dynamic>?> getAccountDetails(
      {required String authtoken}) async {
    return await accountRepository.getAccountDetails(authtoken: authtoken);
  }    @override
  Future<Map<String, dynamic>?> getAllAccountDetailsByLogin({required String authtoken}) async {
    return await accountRepository.getAllAccountDetailsByLogin(authtoken: authtoken);
  }   @override
  Future<Map<String, dynamic>?> logOut(
      {required String authtoken}) async {
    return await accountRepository.logOut(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> loginAccount({
    required String email,
    required String password,
  }) async {
    return await accountRepository.loginAccount(
        email: email, password: password);
  }
  @override
  Future<User?> loginWithGoogle() async {
    return await accountRepository.loginWithGoogle();
  }
  @override
  Future<Map<String, dynamic>?> loginWithSocial({
    required String email,

  }) async {
    return await accountRepository.loginWithSocial(email: email);

  }
  // @override
  // Future<Map<String, dynamic>?> getUserId({
  //   required String authtoken,
  //   required String userId,
  // }) async {
  //   return await accountRepository.getUserId(
  //       authtoken: authtoken, userId: userId);
  // }

  // Future<Map<String, dynamic>?> getUserEmail({
  //   required String authtoken,
  //   required String email,
  // }) async {
  //   return await accountRepository.getUserEmail(
  //       authtoken: authtoken, email: email);
  // }

  // Future<Map<String, dynamic>?> updateEmail(
  //     {required String email,
  //     required String newemail,
  //     required String password,
  //     required String authtoken}) async {
  //   return await accountRepository.updateEmail(
  //       email: email,
  //       newemail: newemail,
  //       password: password,
  //       authtoken: authtoken);
  // }

  @override
  Future<Map<String, dynamic>?> updatePassword(
      {required String email,
      required String newpassword,
      required String password,
      required String authtoken}) async {
    return await accountRepository.updatePassword(
        email: email,
        newpassword: newpassword,
        password: password,
        authtoken: authtoken);
  }
  @override
  Future<Map<String, dynamic>?> registerWithSocial({
    required String name,
    required String email,
    required String phoneNo,
    required bool isGoogle,
    required bool isFacebook,
    required String gender,
  })async {
    return await accountRepository.registerWithSocial(name:name,email:email,phoneNo:phoneNo,isGoogle:isGoogle,isFacebook:isFacebook,gender:gender);
  }


  Future<Map<String, dynamic>?> forgetPassword(
      {required String email,
      required String password,
      required String authtoken}) async {
    return await accountRepository.forgetPassword(
        email: email, password: password, authtoken: authtoken);
  }


  @override
  Future<UserCredential?> signInWithFacebook() async {
    return await accountRepository.signInWithFacebook();
  }
  @override
  Future<UserCredential?> signOutWithFacebook() async {
    return await accountRepository.signOutWithFacebook();
  }
}

final accountServiceProvider = Provider.autoDispose<AccountService>((ref) {
  final service = AccountServiceV1(
    ref.watch(accountRepositoryProvider),
  );
  return service;
});
