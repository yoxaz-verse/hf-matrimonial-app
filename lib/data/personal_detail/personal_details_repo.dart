import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/utils/color.dart';

import '../../utils/config.dart';
import '../api_client/api_client.dart';

//create and update api are same
abstract class PersonalDetailsRepository {
  Future<Map<String, dynamic>?> createDetails({
    required String authtoken,
    required String name,
    required String about,
    // required String age,
    required String DOB,
    required String height,
    required String OtherMartialStatus,
    required String weight,
    required String MartialStatus,
    required String OtherGender,
    required String OtherPhysicalStatus,
    required String PhysicalStatus,
    required String Gender,
    required String district,
    required String state,
    required String country,
    required List<String> image,

    required String Address,

  });
  Future<Map<String, dynamic>?> addImagesPersonalDetails({
    required String authtoken,
    required List image,
  });
  Future<Map<String, dynamic>?> createProfileImage({
    required String authtoken,
    required String image,
  });
  Future<Map<String, dynamic>?> updateDetails({
    required String authtoken,
    required String id,
    required String name,
    required String about,
    required String age,
    required String DOB,
    required String height,
    required String weight,
    required String MartialStatus,
    required String PhysicalStatus,
    required String Gender,
    required String Address,
    required String district,
    required String state,
    required String country,
    required String image,
  });
  Future<Map<String, dynamic>?> getPersDetailByLoginAccount(
      {required String authtoken});
  // Future<Map<String, dynamic>?> getdetailsbyid({
  //   required String authtoken,
  //   String id,
  //   String accountId,
  //   String account,
  //   String BodyType,
  //   String complexion,
  //   String MartialStatus,
  //   String PhysicalStatus,
  //   String Gender,
  //   String pageNo,
  //   String limit,
  // });

  Future<Map<String, dynamic>?> getalldetails({
    required String authtoken,
    required String id,
  });
}

class PersonalDetailsRepositoryV1 implements PersonalDetailsRepository {
  PersonalDetailsRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createDetails({
    required String authtoken,
    required String name,
    required String about,
    // required String age,
    required String DOB,
    required String height,
    required String weight,
    required String MartialStatus,
    required String OtherMartialStatus,
    required String OtherPhysicalStatus,
    required String PhysicalStatus,
    required String Gender,
    required String OtherGender,
    required String Address,
    required String district,
    required String state,
    required String country,
    required List<String> image,
  }) {
    final body = {
      "name": name,
      "about": about,
      // "age": age,
      "DOB": DOB,
      "height": height.toString(),
      "weight": weight.toString(),


      if(Gender!="")"Gender": Gender,
      if(OtherGender!="")"otherGender": OtherGender,
      if(MartialStatus!="")"MartialStatus": MartialStatus,
      if(OtherMartialStatus!="")"otherMartialStatus": OtherMartialStatus,
      if(PhysicalStatus!="")"PhysicalStatus": PhysicalStatus,
      if(OtherPhysicalStatus!="")"otherPhysicalStatus": OtherPhysicalStatus,

      "Address": Address,
      "Distict": district,
      "State": state,
      "Country": country,

    };

    return api.multiImagePartData(
      imagepath: image,
      imageparam: 'image',
      uri: Uri.parse(ApiConfig.createUpdatePersonalDetails),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["success"] == true) {

          return jsonMap;
        } else if(jsonMap["error"]!=null){
          DialogServiceV1().showSnackBar(content: "${jsonMap["error"]}", color: AppColors.black, textclr: AppColors.white);
          return jsonMap;

        }
        else{
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> createProfileImage({
    required String authtoken,
    required String image,
  }) {
    final body = {};

    return api.multipartData(
      imagepath: image,
      imageparam: 'image',
      uri: Uri.parse(ApiConfig.addProfileImage),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["success"] == true) {

          return jsonMap;
        } else {
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> addImagesPersonalDetails({
    required String authtoken,
    required List image,
  }) {
    final body = {};
    return api.multiImagePartData(
      imagepath: image,
      imageparam: 'image',
      uri: Uri.parse(ApiConfig.addPersonalDetailImages),
      body: body,
      headers: api.createHeaders(
        authtoken: authtoken,
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        if (jsonMap["success"] == true) {
          return jsonMap;
        } else {
          return {"data":null};
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> updateDetails({
    required String authtoken,
    required String id,
    required String name,
    required String about,
    required String age,
    required String DOB,
    required String height,
    required String weight,
    required String MartialStatus,
    required String PhysicalStatus,
    required String Gender,
    required String Address,
    required String district,
    required String state,
    required String country,
    required String image,
  }) {
    final body = {
      "id": id,
      // "user_id": user_id,
      "name": name,
      "about": about,
      "age": age,
      "DOB": DOB,
      "height": height,
      "weight": weight,
      "MartialStatus": MartialStatus,
      "PhysicalStatus": PhysicalStatus,
      "Gender": Gender,
      "Address": Address,
      "Distict": district,
      "State": state,
      "Country": country,
      "image": image,
    };

    return api.postData(
      uri: Uri.parse("${ApiConfig.createUpdatePersonalDetails}$id"),
      body: body,
      headers: api.createHeaders(
        authtoken: "",
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap["status"] == true) {

          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getdetails({
  //   required String authtoken,
  //   required String id,
  // }) {
  //   return api.getData(
  //     uri: Uri.parse("${ApiConfig.personalDetailURl}$id"),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = {"data": json.decode(data)};
  //
  //       if (jsonMap['data'] != []) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> getalldetails(
      {required String authtoken, required String id}) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.createUpdatePersonalDetails}$id"),
      headers: api.createHeaders(authtoken: authtoken),
      builder: (data) {
        Map<String, dynamic> jsonMap = {"data": json.decode(data)};

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  // @override
  // Future<Map<String, dynamic>?> getdetailsbyid({
  //   required String authtoken,
  //   String id = "",
  //   String accountId = "",
  //   String account = "",
  //   String BodyType = "",
  //   String complexion = "",
  //   String MartialStatus = "",
  //   String PhysicalStatus = "",
  //   String Gender = "",
  //   String pageNo = "",
  //   String limit = "",
  // }) {
  //   String url = ApiConfig.personalDetailURl;
  //   if (id != '') {
  //     url = "$url?id=$id";
  //   }
  //   if (accountId != '') {
  //     url = "$url?accountId=$accountId";
  //   }
  //   if (account != '') {
  //     url = "$url?accountId=$account";
  //   }
  //   if (BodyType != '') {
  //     url = "$url?employedIn=$BodyType";
  //   }
  //   if (complexion != '') {
  //     url = "$url?occupation=$complexion";
  //   }
  //   if (MartialStatus != '') {
  //     url = "$url?highestEducation=$MartialStatus";
  //   }
  //   if (PhysicalStatus != '') {
  //     url = "$url?religion=$PhysicalStatus";
  //   }
  //   if (Gender != '') {
  //     url = "$url?workLocation=$Gender";
  //   }
  //   if (pageNo != '') {
  //     url = "$url?pageNo=$pageNo";
  //   }
  //   if (limit != '') {
  //     url = "$url?limit=$limit";
  //   }
  //
  //   return api.getData(
  //     uri: Uri.parse(url),
  //     headers: api.createHeaders(authtoken: authtoken),
  //     builder: (data) {
  //       Map<String, dynamic> jsonMap = json.decode(data);
  //       if (jsonMap["id"] != null) {
  //         return jsonMap;
  //       } else {
  //         throw Exception('Failed..');
  //       }
  //     },
  //   );
  // }

  @override
  Future<Map<String, dynamic>?> getPersDetailByLoginAccount(
      {required String authtoken}) {
    return api.getData(
      uri: Uri.parse(ApiConfig.getPersonalDetailsByAccount),
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
}

final personalDetailsRepositoryProvider =
    Provider<PersonalDetailsRepository>((ref) => PersonalDetailsRepositoryV1(
          ApiClient(),
        ));
