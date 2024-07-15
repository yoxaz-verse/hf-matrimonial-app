import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/personal_detail/personal_details_repo.dart';

abstract class PersonalDetailsService {
  Future<Map<String, dynamic>?> createDetails({
    required String authtoken,
    required String name,
    required String about,
    // required String age,
    required String DOB,
    required String height,
    required String weight,
    required String MartialStatus,
    required String PhysicalStatus,
    required String OtherGender,
    required String OtherMartialStatus,
    required String Gender,
    required String Address,    required String OtherPhysicalStatus,
    required String district,
    required String state,
    required String country,
    required List<String> image,

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

  Future<Map<String, dynamic>?> getPersDetailByLoginAccount({
    required String authtoken,
  });

  // Future<Map<String, dynamic>?> getdetailsbyid({
  //   required String authtoken,
  //   required String id,
  // });


  Future<Map<String, dynamic>?> getalldetails({
    required String authtoken,
    required String id,
  });
  Future<Map<String, dynamic>?> addImagesPersonalDetails({
    required String authtoken,
    required List image,
  });
}

class PersonalDetailsServiceV1 implements PersonalDetailsService {
  PersonalDetailsServiceV1(
    this.personalDetailsRepository,
  );

  final PersonalDetailsRepository personalDetailsRepository;

  @override
  Future<Map<String, dynamic>?> createDetails({
    required String authtoken,
    required String name,
    required String about,
    // required String age,
    required String DOB,
    required String OtherGender,
    required String height,
    required String weight,
    required String OtherMartialStatus,
    required String MartialStatus,
    required String PhysicalStatus,
    required String Gender,    required String OtherPhysicalStatus,
    required String Address,
    required String district,
    required String state,
    required String country,
    required List<String> image,

  }) async {
    return await personalDetailsRepository.createDetails(
      name: name,
      about: about,
      // age: age,
      DOB: DOB,
      height: height,OtherGender: OtherGender,
      weight: weight,
      MartialStatus: MartialStatus,
      PhysicalStatus: PhysicalStatus,
      Gender: Gender,
      Address: Address,OtherPhysicalStatus: OtherPhysicalStatus,
      district: district,OtherMartialStatus: OtherMartialStatus,
      state: state,
      image: image,
      country: country,
      authtoken: authtoken,
    );
  }
  @override
  Future<Map<String, dynamic>?> createProfileImage({
    required String authtoken,
    required String image,
  }) async {
    return await personalDetailsRepository.createProfileImage(
    image: image,
      authtoken: authtoken,
    );
  }  @override
  Future<Map<String, dynamic>?> addImagesPersonalDetails({
    required String authtoken,
    required List image,
  }) async {
    return await personalDetailsRepository.addImagesPersonalDetails(
    image: image,
      authtoken: authtoken,
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
  }) async {
    return await personalDetailsRepository.updateDetails(
      id: id,
      name: name,
      about: about,
      age: age,
      DOB: DOB,
      height: height,
      weight: weight,
      MartialStatus: MartialStatus,
      PhysicalStatus: PhysicalStatus,
      Gender: Gender,
      Address: Address,
      authtoken: authtoken,
      district: district,
      state: state,
      country: country,
      image: image,
    );
  }

  @override
  Future<Map<String, dynamic>?> getalldetails(
      {required String authtoken, required String id}) async {
    return await personalDetailsRepository.getalldetails(
      authtoken: authtoken,
      id: id,
    );
  }

  @override
  Future<Map<String, dynamic>?> getPersDetailByLoginAccount({
    required String authtoken,
  }) async {
    return await personalDetailsRepository.getPersDetailByLoginAccount(
        authtoken: authtoken);
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
  // }) async {
  //   return await personalDetailsRepository.getdetailsbyid(
  //       id: id,
  //       accountId: accountId,
  //       account: account,
  //       MartialStatus: MartialStatus,
  //       PhysicalStatus: PhysicalStatus,
  //       Gender: Gender,
  //       pageNo: pageNo,
  //       limit: limit,
  //       authtoken: authtoken);
  // }
}

final personalDetailsServiceProvider =
    Provider.autoDispose<PersonalDetailsService>((ref) {
  final service = PersonalDetailsServiceV1(
    ref.watch(personalDetailsRepositoryProvider),
  );
  return service;
});
