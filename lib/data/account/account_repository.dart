import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';
import '../../utils/config.dart';
import '../api_client/api_client.dart';

abstract class AccountRepository {
  Future<Map<String, dynamic>?> createAccount({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String phoneNumber,
  });
  Future<Map<String, dynamic>?> loginWithSocial({
    required String email,
  });
  Future<Map<String, dynamic>?> getAccountDetails({required String authtoken});

  Future<Map<String, dynamic>?> loginAccount({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>?> applyForVerification({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> registerWithSocial({
    required String name,
    required String email,
    required String phoneNo,
    required bool isGoogle,
    required bool isFacebook,
    required String gender,

  });
  Future<Map<String, dynamic>?> getAllAccountDetailsByLogin({required String authtoken});
  Future<Map<String, dynamic>?> logOut({required String authtoken});

  Future<Map<String, dynamic>?> updateAccount({
    required String name,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> forgetPassword({
    required String email,
    required String password,
    required String authtoken,
  });
  Future<User?> loginWithGoogle();
  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential?> signOutWithFacebook();
  Future<Map<String, dynamic>?> deleteAccount({required String authtoken});
  Future<Map<String, dynamic>?> updatePassword(
      {required String email,
      required String newpassword,
      required String password,
      required String authtoken});
}

class AccountRepositoryV1 extends AccountRepository {
  final ApiClient api;

  AccountRepositoryV1(this.api);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Map<String, dynamic>?> createAccount({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String phoneNumber,
  }) async {
    final body = {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "Gender": gender
    };
    return api.postData(
      uri: Uri.parse(ApiConfig.createAndDeleteAccount),
      headers: api.createHeaders(authtoken: ''),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['data'] != null) {
          return jsonMap;
        } else if (jsonMap['error'] != null) {
          return jsonMap;
        } else {
          return jsonMap;
        }
      },
    );
  }


  @override
  Future<Map<String, dynamic>?> applyForVerification({
    required String authtoken,
  }) async {
    final body = {};
    return api.postData(
      uri: Uri.parse(ApiConfig.profileVerification),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap['success'] == true) {
          DialogServiceV1().showSnackBar(content: "Verification request sent successfully", color: AppColors.black, textclr: AppColors.white);
          return jsonMap;
        } else {
          return {"data":null};
        }
      },
    );
  }
  @override
  Future<Map<String, dynamic>?> registerWithSocial({
    required String name,
    required String email,
    required String phoneNo,
    required bool isGoogle,
    required bool isFacebook,
    required String gender,

  }) async {
    try {
      final body = {
        "name": name,
        "email": email,
        "phoneNumber": phoneNo,
        "isGoogle": isGoogle,
        "isFacebook": isFacebook,
        "Gender":gender
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.signupSocialAccount),
        body: body,
        headers: api.createHeaders(authtoken: ''),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['success'] == true) {
            DialogServiceV1().showSnackBar(
                content: "User Registered Successfully!!",
                color: AppColors.colorPrimary..withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else if (jsonMap['error'] != null || jsonMap['message'] != null) {
            DialogServiceV1().showSnackBar(
                content: jsonMap['error']??jsonMap['message']??"Server Error",
                color: AppColors.colorPrimary..withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            return {"data":null};
            return jsonMap;
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      // log("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        'email': email,
        'password': password,
      };

      return api.postData(
        uri: Uri.parse(ApiConfig.loginAccount),
        body: body,
        headers: api.createHeaders(authtoken: ''),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap["data"] != null) {
            DialogServiceV1().showSnackBar(
                content: "User Logged-in Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else if (jsonMap["error"] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      return null;
    }
  }

  // @override
  // Future<Map<String, dynamic>?> getUserId(
  //     {required String authtoken, required String userId}) {
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.getuseridaccountURl + "?userId={$userId}"),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["userId"] != null) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> getAccountDetails({required String authtoken}) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAccountDetails),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else {
          return jsonMap;
          throw Exception('Failed..');
        }
      },
    );
  }  @override
  Future<Map<String, dynamic>?> getAllAccountDetailsByLogin({required String authtoken}) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getAllAccountDetailsByLogin),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else {
          DialogServiceV1().showSnackBar(content: jsonMap["errror"], color: AppColors.black, textclr: AppColors.white);
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }
  @override
  Future<Map<String, dynamic>?> logOut({required String authtoken}){
    return api.postData(
      body: {},
      uri: Uri.parse(ApiConfig.logOutAccount),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getUserEmail({
  //   required String authtoken,
  //   required String email,
  // }) {
  //   return api.getData(
  //     uri: Uri.parse(ApiConfig.getemailaccountURl + "?email={$email}"),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["email"] != null) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }
  @override
  Future<User?> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);

      User? user = result.user;

      // log('userdata $user');

      // log(" =============: RES123 :=============  ${googleSignInAuthentication.accessToken}");

      // log(" =============: RES123ger :=============  ${googleSignInAuthentication.idToken}");

      // log('userdatatoken  ${googleSignInAuthentication.accessToken}');

      if (result != null) {
        // DialogServiceV1().showSnackBar(
        //     content: "User Logged-in Successfully!!",
        //     color: AppColors.colorPrimary.withOpacity(0.7),
        //     textclr: AppColors.white);

        // PreferenceManagerUtils.setIsLogin(true);
        //
        // PreferenceManagerUtils.setIsIndividual(index == 0 ? 1 : 2);
        //
        // Navigator.pushAndRemoveUntil(
        //     Globals.navigatorKey.currentContext!,
        //     PageTransition(
        //         child: index == 0 ? BottomBar(index: 0) : const AdminPanel(),
        //         type: PageTransitionType.rightToLeftWithFade,
        //         duration: const Duration(milliseconds: 400)),
        //     (Route<dynamic> route) => false);
        return user;
      } else {
        DialogServiceV1().showSnackBar(
            content: "User Logged-in Failed!!",
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);

        return null;
      }
    }

    return null;
  }

  @override
  Future<Map<String, dynamic>?> loginWithSocial({
    required String email,

  }) async {
    try {
      final body = {
       'email': email,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.loginSocialAccount),
        body: body,
        headers: api.createHeaders(authtoken: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['data'] != null) {
            DialogServiceV1().showSnackBar(
                content: "User Logged-in Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            PreferenceManagerUtils.setIsLogin(true);
            PreferenceManagerUtils.setToken(jsonMap["data"]['token']);
            PreferenceManagerUtils.setProfileId(
                (jsonMap["data"]["Account"]["acc_Id"]?? jsonMap["data"]["Account"]["acc_id"]??"").toString());
            PreferenceManagerUtils.setProfMobileNo(jsonMap["data"]
            ["Account"]["userId"]["phoneNumber"]);
            PreferenceManagerUtils.setUserName(
                jsonMap["data"]["Account"]["name"]);
            PreferenceManagerUtils.setProfEmail(
                jsonMap["data"]["Account"]["email"]);
            PreferenceManagerUtils.setUserId(jsonMap["data"]['Account']['_id']);
            return jsonMap;
          }else if (jsonMap['error'] != null) {
            DialogServiceV1().showSnackBar(
                content: "${jsonMap["error"]}",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            return {"data":null};
            // throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      // log("eeeee $e ");

      return null;
    }
  }
  @override
  Future<Map<String, dynamic>?> updateAccount(
      {required String name, required String authtoken}) {
    final body = {
      name: name,
      // authtoken: authtoken,
    };
    return api.putData(
      uri: Uri.parse(ApiConfig.createAndDeleteAccount),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  // Future<Map<String, dynamic>?> updateEmail(
  //     {required String email,
  //     required String newemail,
  //     required String password,
  //     required String authtoken}) {
  //   final body = {
  //     email: email,
  //     newemail: newemail,
  //     password: password,
  //     authtoken: authtoken,
  //   };
  //   return api.patchData(
  //     uri: Uri.parse(ApiConfig.updateemailURl),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     body: body,
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["success"] == true) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  Future<Map<String, dynamic>?> updatePassword(
      {required String email,
      required String newpassword,
      required String password,
      required String authtoken}) {
    final body = {
      "email": email,
      "newpassword": newpassword,
      "password": password
    };
    return api.patchData(
      uri: Uri.parse(ApiConfig.updatePassword),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else if (jsonMap["error"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap["error"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return {"data": null};
        } else if (jsonMap["message"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap["message"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return {"data": null};
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> forgetPassword(
      {required String email,
      required String password,
      required String authtoken}) {
    final body = {"email": email, "password": password};
    return api.patchData(
      uri: Uri.parse(ApiConfig.forgotPassword),
      headers: api.createHeaders(authtoken: authtoken),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          DialogServiceV1().showSnackBar(
              content: "Password changed successfully",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;
        } else {
          return {"data": null};
          throw Exception('Failed..');
        }
      },
    );
  }


  @override
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email'],
      loginBehavior: LoginBehavior.webOnly,
    );
    User user;
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
      FacebookAuthProvider.credential(result.accessToken!.token);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  @override
  Future<UserCredential?> signOutWithFacebook() async {
    await FacebookAuth.instance.logOut();
    return null;
  }
  @override
  Future<Map<String, dynamic>?> deleteAccount({required String authtoken}) {
    return api.deleteData(
      uri: Uri.parse(ApiConfig.createAndDeleteAccount),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["data"] != null) {
          return jsonMap;
        } else if(jsonMap["error"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap["error"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;
        }else if(jsonMap["message"] != null) {
          DialogServiceV1().showSnackBar(
              content: "${jsonMap["message"]}",
              color: AppColors.black,
              textclr: AppColors.white);
          return jsonMap;

        } else {
        DialogServiceV1().showSnackBar(
            content: "Server Error",
            color: AppColors.black,
            textclr: AppColors.white);
        return jsonMap;

        }
      },
    );
  }

}

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepositoryV1(ApiClient()));
