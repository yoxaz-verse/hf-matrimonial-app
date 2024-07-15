import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heavenlymatrimony/application/account/account_service.dart';
import 'package:heavenlymatrimony/application/family%20details/family_service.dart';
import 'package:heavenlymatrimony/application/partner_preference/partner_preference_service.dart';
import 'package:heavenlymatrimony/application/rec%20detail/rec_detail_services.dart';
import 'package:heavenlymatrimony/data/shared_pref/shared_pref.dart';
import 'package:heavenlymatrimony/presentation/profile_page/profile_page_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/dialog/dialog_service.dart';
import '../../application/dropdown/dropdown_service.dart';
import '../../application/personal_detail/personal_details_service.dart';
import '../../data/family details/family_repo.dart';
import '../../utils/color.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/globals.dart';
import '../../utils/text.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar.dart';
import '../bottom_bar/after_bottom_bar/after_bottom_bar_controller.dart';
import '../registration moblie/registration_moblie.dart';
import 'my_account_screen.dart';

part 'my_account_screen_controller.g.dart';

@riverpod
class MyAccountScreenController extends _$MyAccountScreenController {
  /// Is Edit => this is set to ttrue for hiding delete and edit buttons
  bool _isEdit = true;

  bool get isEdit => _isEdit;

  /// IS New Acc
  bool _isNewAcc = false;

  bool get isNewAcc => _isNewAcc;

  /// for checking new acc
  bool _isPDNull = false;
  bool _isRECNull = false;
  bool _isFDNull = false;
  bool _isPPrefNull = false;

  bool _personalDetailCompleted = false;
  bool get personalDetailCompleted => _personalDetailCompleted;
  bool _RECDetailCompleted = false;
  bool get RECDetailCompleted => _RECDetailCompleted;
  bool _familyDetailCompleted = false;
  bool get familyDetailCompleted => _familyDetailCompleted;
  bool _partPrefsDetailCompleted = false;
  bool get partPrefsDetailCompleted => _partPrefsDetailCompleted;

  /// loading
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isPDEdit = false;

  bool get isPDEdit => _isPDEdit;

  bool _isRECDEdit = false;

  bool get isRECDEdit => _isRECDEdit;

  bool _isFDEdit = false;

  bool get isFDEdit => _isFDEdit;

  bool _isPPrefEdit = false;

  bool get isPPrefEdit => _isPPrefEdit;

  String _userId = "UserID Not Found";
  bool _isOtherPartPrefMartialStatus = false;
  bool get isOtherPartPrefMartialStatus => _isOtherPartPrefMartialStatus;
  String get userId => _userId;
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController martialStatus = TextEditingController();
  TextEditingController physicalStatus = TextEditingController();
  TextEditingController personalDetailState = TextEditingController();
  TextEditingController personalDetailCountry = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController denomination = TextEditingController();
  TextEditingController church = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController workLocation = TextEditingController();
  TextEditingController college = TextEditingController();

  TextEditingController numberOfBrothers = TextEditingController();
  TextEditingController numberOfSisters = TextEditingController();
  TextEditingController partPrefGender = TextEditingController();
  TextEditingController partPrefReligion = TextEditingController();
  TextEditingController partPrefEducation = TextEditingController();
  TextEditingController partPrefOccupation = TextEditingController();
  TextEditingController partPrefCountry = TextEditingController();
  TextEditingController partPrefState = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController collageInstistuteController = TextEditingController();
  TextEditingController occupationdetails = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController fatherOccupation = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController motherOccupation = TextEditingController();
  TextEditingController others = TextEditingController();
  TextEditingController preferredAgeFromController = TextEditingController();
  TextEditingController preferredAgeToController = TextEditingController();
  TextEditingController preferredHeightFromController = TextEditingController();
  TextEditingController preferredHeightToController = TextEditingController();
  TextEditingController preferredOtherMartialStatusController =
      TextEditingController();

  final List<String> employedIn = [
    AppText.government,
    AppText.private,
    AppText.business,
    AppText.defense,
    AppText.selfEmployed
  ];
  final Set<String> _selectedReasons = {};

  int _selectMartialStatusRadio = 0;

  int get selectMartialStatusRadio => _selectMartialStatusRadio;
  String _userName = "Username Not Set";

  String get userName => _userName;
  int _selectEmployedInRadio = 0;

  int get selectEmployedInRadio => _selectEmployedInRadio;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  final bool _isRecdetailverified = false;

  bool get isRecdetailverified => _isRecdetailverified;

  String Id = "";

  //number of brothers
  final List<String> _numberOfBrothers = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  List<String> get numberOfBrothersCat => _numberOfBrothers;
  String _selectNumberOfBrothers = '0';

  String get getNumberOfBrothers => _selectNumberOfBrothers;

  //number of sisters
  final List<String> _numberOfSisters = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  List<String> get numberOfSistersCat => _numberOfSisters;
  String _selectNumberOfSisters = '0';

  String get getNumberOfSisters => _selectNumberOfSisters;

  final List<Map<String, dynamic>> _employedInList = [];

  List<Map<String, dynamic>> get employedInList => _employedInList;

  //martialList
  final List<String> _martialList = [];

  List<String> get getMarStatusList => _martialList;

  bool _isDenominationLoaded = false;

  bool get isDenominationLoaded => _isDenominationLoaded;
  bool _isStateLoaded = false;

  bool get isStateLoaded => _isStateLoaded;
  bool _isCountrySelected = false;

  bool get isCountrySelected => _isCountrySelected;

  bool _isReligionSelected = false;

  bool get isReligionSelected => _isReligionSelected;
  bool _isPartPrefCountrySelected = false;

  bool get isPartPrefCountrySelected => _isPartPrefCountrySelected;

  bool _isPartPrefStateLoaded = false;

  bool get isPartPrefStateLoaded => _isPartPrefStateLoaded;

  // String _selectGenderStatus = AppText.gender;
  //
  // String get getGenderStatus => _selectGenderStatus;

  String authToken = "";

  /// personel details
  String genderID = '';
  String martialStatusID = '';
  String physicalStatusID = '';
  String personalDetailCountryID = '';

  String otherGender = '';
  String otherMartialStatus = '';
  String otherPhysicalStatus = '';

  /// REC
  String religionID = '';
  String churchID = '';
  String denominationID = '';
  String educationID = '';
  String collegeID = '';
  String occupationID = '';
  String workLocationID = '';

  /// family detail
  String fatherOccupationID = '';
  String motherOccupationID = '';

  /// partner preference
  String partnerPrefReligionID = '';
  String genderPartPrefID = '';
  String martialStatusPartPrefID = '';
  String physicalStatusPartPrefID = '';
  String educationPartPrefID = '';
  String occupationPartPrefID = '';
  FocusNode _focusGenderNode = FocusNode();
  FocusNode get getFocusGenderNode => _focusGenderNode;
  FocusNode _focusmartialStatusNode = FocusNode();
  FocusNode get getFocusmartialStatusNode => _focusmartialStatusNode;
  FocusNode _focusphysicalStatusNode = FocusNode();
  FocusNode get getFocusphysicalStatusNode => _focusphysicalStatusNode;
  FocusNode _focuspersonalDetailCountryNode = FocusNode();
  FocusNode get getFocuspersonalDetailCountryNode =>
      _focuspersonalDetailCountryNode;
  FocusNode _focuspersonalDetailStateNode = FocusNode();
  FocusNode get getFocuspersonalDetailStateNode =>
      _focuspersonalDetailStateNode;
  FocusNode _focusreligionNode = FocusNode();
  FocusNode get getFocusreligionNode => _focusreligionNode;
  FocusNode _focusdenominationNode = FocusNode();
  FocusNode get getFocusdenominationNode => _focusdenominationNode;
  FocusNode _focuschurchNode = FocusNode();
  FocusNode get getFocuschurchNode => _focuschurchNode;
  FocusNode _focuseducationNode = FocusNode();
  FocusNode get getFocuseducationNode => _focuseducationNode;
  FocusNode _focusoccupationNode = FocusNode();
  FocusNode get getFocusoccupationNode => _focusoccupationNode;
  FocusNode _focusworkLocationNode = FocusNode();
  FocusNode get getFocusworkLocationNode => _focusworkLocationNode;
  FocusNode _focuscollegeNode = FocusNode();
  FocusNode get getFocuscollegeNode => _focuscollegeNode;
  FocusNode _focusfatherOccupationNode = FocusNode();
  FocusNode get getFocusfatherOccupationNode => _focusfatherOccupationNode;
  FocusNode _focusmotherOccupationNode = FocusNode();
  FocusNode get getFocusmotherOccupationNode => _focusmotherOccupationNode;
  FocusNode _focuspartPrefGenderNode = FocusNode();
  FocusNode get getFocuspartPrefGenderNode => _focuspartPrefGenderNode;
  FocusNode _focuspartPrefReligionNode = FocusNode();
  FocusNode get getFocuspartPrefReligionNode => _focuspartPrefReligionNode;
  FocusNode _focuspartPrefEducationNode = FocusNode();
  FocusNode get getFocuspartPrefEducationNode => _focuspartPrefEducationNode;
  FocusNode _focuspartPrefOccupationNode = FocusNode();
  FocusNode get getFocuspartPrefOccupationNode => _focuspartPrefOccupationNode;
  FocusNode _focuspartPrefCountryNode = FocusNode();
  FocusNode get getFocuspartPrefCountryNode => _focuspartPrefCountryNode;
  FocusNode _focuspartPrefStateNode = FocusNode();
  FocusNode get getFocuspartPrefStateNode => _focuspartPrefStateNode;

  Map<String, dynamic>? userRecDetailsResponse;
  Map<String, dynamic>? userFamilyDetailsResponse;
  Map<String, dynamic>? personalDetailsResponse;
  Map<String, dynamic>? genderDataResponse;
  Map<String, dynamic>? countryDataResponse;
  Map<String, dynamic>? getAllStatesResponse;
  Map<String, dynamic>? stateDataResponse;
  Map<String, dynamic>? partnerPrefsStateDataResponse;
  Map<String, dynamic>? locationDataResponse;
  Map<String, dynamic>? religionDataResponse;
  Map<String, dynamic>? employedInData;
  Map<String, dynamic>? educationDataResponse;
  Map<String, dynamic>? martialDataResponse;
  Map<String, dynamic>? collegeDataResponse;
  Map<String, dynamic>? occupationDataResponse;
  Map<String, dynamic>? denominationDataResponse;
  Map<String, dynamic>? churchDataResponse;
  Map<String, dynamic>? workLocationDataResponse;
  Map<String, dynamic>? physicalDataResponse;
  Map<String, dynamic>? getPersonalDetailResponse;

  ImagePicker imagePicker = ImagePicker();
  File? selectedImage;
  final List<String> _personalDetailImageList = [];
  List<String> get personalDetailImageList => _personalDetailImageList;
  final List<String> _personalDetailImageListCompressed = [];
  List<String> get personalDetailImageListCompressed =>
      _personalDetailImageListCompressed;
  ProfilePageScreenController Function()? _controller;
  File? compressdFile;
  String _imgUrl = '';

  String get imgUrl => _imgUrl;

  String _imgName = '';

  String get imgName => _imgName;

  final bool _isSubmit = false;

  bool get isSubmit => _isSubmit;
  final bool _fromRegister = false;
  bool get fromRegister => _fromRegister;

  @override
  FutureOr<void> build(
      {bool fromRegister = false,
      ProfilePageScreenController Function()? controller}) async {
    state = const AsyncLoading();
    _isLoading = true;

    _controller = controller;
    dob = TextEditingController(text: formatDateTime(_selectedDate));
    await PreferenceManagerUtils.getProfileId().then((value) {
      _userId = value;
    });
    await PreferenceManagerUtils.getUserName().then((value) {
      _userName = value;
      name.text = value;
    });
    await PreferenceManagerUtils.getToken().then((value) async {
      authToken = value;
    });
    await getAllDropDowns();
    await getAlldetails();
    print("sdkbbjk $_personalDetailCompleted $RECDetailCompleted $familyDetailCompleted $partPrefsDetailCompleted");
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  changeFocusGenderNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusGenderNode!.hasFocus}");

    _focusGenderNode?.unfocus();
    print("focusNode1 $_focusGenderNode");
    state = const AsyncValue.data(null);
  }

  changeFocusmartialStatusNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusmartialStatusNode!.hasFocus}");

    _focusmartialStatusNode?.unfocus();
    print("focusNode1 $_focusmartialStatusNode");
    state = const AsyncValue.data(null);
  }

  changeFocusphysicalStatusNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusphysicalStatusNode!.hasFocus}");

    _focusphysicalStatusNode?.unfocus();
    print("focusNode1 $_focusphysicalStatusNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspersonalDetailCountryNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspersonalDetailCountryNode!.hasFocus}");

    _focuspersonalDetailCountryNode?.unfocus();
    print("focusNode1 $_focuspersonalDetailCountryNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspersonalDetailStateNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspersonalDetailStateNode!.hasFocus}");

    _focuspersonalDetailStateNode?.unfocus();
    print("focusNode1 $_focuspersonalDetailStateNode");
    state = const AsyncValue.data(null);
  }

  changeFocusreligionNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusreligionNode!.hasFocus}");

    _focusreligionNode?.unfocus();
    print("focusNode1 $_focusreligionNode");
    state = const AsyncValue.data(null);
  }

  changeFocusdenominationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusdenominationNode!.hasFocus}");

    _focusdenominationNode?.unfocus();
    print("focusNode1 $_focusdenominationNode");
    state = const AsyncValue.data(null);
  }

  changeFocuschurchNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuschurchNode!.hasFocus}");

    _focuschurchNode?.unfocus();
    print("focusNode1 $_focuschurchNode");
    state = const AsyncValue.data(null);
  }

  changeFocuseducationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuseducationNode!.hasFocus}");

    _focuseducationNode?.unfocus();
    print("focusNode1 $_focuseducationNode");
    state = const AsyncValue.data(null);
  }

  changeFocusoccupationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusoccupationNode!.hasFocus}");

    _focusoccupationNode?.unfocus();
    print("focusNode1 $_focusoccupationNode");
    state = const AsyncValue.data(null);
  }

  changeFocusworkLocationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusworkLocationNode!.hasFocus}");

    _focusworkLocationNode?.unfocus();
    print("focusNode1 $_focusworkLocationNode");
    state = const AsyncValue.data(null);
  }

  changeFocuscollegeNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuscollegeNode!.hasFocus}");

    _focuscollegeNode?.unfocus();
    print("focusNode1 $_focuscollegeNode");
    state = const AsyncValue.data(null);
  }

  changeFocusfatherOccupationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusfatherOccupationNode!.hasFocus}");

    _focusfatherOccupationNode?.unfocus();
    print("focusNode1 $_focusfatherOccupationNode");
    state = const AsyncValue.data(null);
  }

  changeFocusmotherOccupationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focusmotherOccupationNode!.hasFocus}");

    _focusmotherOccupationNode?.unfocus();
    print("focusNode1 $_focusmotherOccupationNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspartPrefGenderNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefGenderNode!.hasFocus}");

    _focuspartPrefGenderNode?.unfocus();
    print("focusNode1 $_focuspartPrefGenderNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspartPrefReligionNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefReligionNode!.hasFocus}");

    _focuspartPrefReligionNode?.unfocus();
    print("focusNode1 $_focuspartPrefReligionNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspartPrefEducationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefEducationNode!.hasFocus}");

    _focuspartPrefEducationNode?.unfocus();
    print("focusNode1 $_focuspartPrefEducationNode");
    state = const AsyncValue.data(null);
  }

  changeFocuspartPrefOccupationNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefOccupationNode!.hasFocus}");

    _focuspartPrefOccupationNode?.unfocus();
    print("focusNode1 $_focuspartPrefOccupationNode");
    state = const AsyncValue.data(null);
  }

  changefocuspartPrefCountryNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefCountryNode!.hasFocus}");

    _focuspartPrefCountryNode?.unfocus();
    print("focusNode1 $_focuspartPrefCountryNode");
    state = const AsyncValue.data(null);
  }

  changefocuspartPrefStateNode() async {
    state = const AsyncLoading();
    print("focusNode ${_focuspartPrefStateNode!.hasFocus}");

    _focuspartPrefStateNode?.unfocus();
    print("focusNode1 $_focuspartPrefStateNode");
    state = const AsyncValue.data(null);
  }

  Future<void> getAlldetails() async {
    /// Get Data
    await getPersonalDetailsData();
    await getFamilyDetailsData();
    await getRecData();
    await getPartnerPrefData();
  }

  Future<void> getAllDropDowns() async {
    // /// Drop Down
    getGenderDropDown();
    getMartialDropDown();
    getPhysicalDropDown();
    getCollegeDropDown();
    getDenominationDropDown();
    getCountry();
    getReligionDropDown();
    getAllStates();
    getChurchDropDown();
    getEducationDropDown();
    getOccupationDropDown();
    getWorkLocationDropDown();
    getEmployedIn();
  }

  ///============================================================================ get data by sections
  Future<void> getFamilyDetailsData() async {
    state = const AsyncLoading();

    Map<String, dynamic>? famData = await ref
        .read(familyDetailsServiceProvider)
        .getFamilyDetails(authtoken: authToken);
    if (famData != null) {
      if (famData["data"] != null) {
        fatherName.text = famData['data']["father"] ?? "";
        motherName.text = famData['data']["mother"] ?? "";
        if (famData['data']["fatherOccupation"]["name"] != null &&
            famData['data']["fatherOccupation"]["name"] != "") {
          fatherOccupation.text = famData['data']["fatherOccupation"]["name"]!;
        }
        if (famData['data']["motherOccupation"]["name"] != null &&
            famData['data']["motherOccupation"]["name"] != "") {
          motherOccupation.text = famData['data']["motherOccupation"]["name"]!;
        }

        _selectNumberOfBrothers =
            (famData['data']["numberOfBrother"] ?? 0).toString();
        _selectNumberOfSisters =
            (famData['data']["numberOfSister"] ?? 0).toString();
        motherOccupation.text =
            famData['data']["motherOccupation"]["name"] ?? "";
        fatherOccupationID = getIdFromNameValidateList(
                occupationDataResponse?["data"]?["Occupations"] ?? [],
                fatherOccupation.text) ??
            "";
        motherOccupationID = getIdFromNameValidateList(
                occupationDataResponse?["data"]?["Occupations"] ?? [],
                motherOccupation.text) ??
            "";
        _familyDetailCompleted =
            famData["data"]["isFamilyDetailCompleted"] != ""
                ? famData["data"]["isFamilyDetailCompleted"] ?? false
                : false;
      }
    } else {
      _isFDNull = true;
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getPersonalDetailsData() async {
    state = const AsyncLoading();
    try {
      Map<String, dynamic>? persData = await ref
          .read(personalDetailsServiceProvider)
          .getPersDetailByLoginAccount(authtoken: authToken);
      getPersonalDetailResponse = persData;
      if (persData != null) {
        if (persData["data"] != null) {
          name.text =
              persData["data"]["name"] != null && persData["data"]["name"] != ""
                  ? persData["data"]["name"].toString()
                  : userName;
          _userName = persData["data"]["name"].toString();
          dob.text = persData["data"]["DOB"].toString();
          age.text = persData["data"]["age"].toString();
          height.text = persData["data"]["height"].toString();
          weight.text = persData["data"]["weight"].toString();
          martialStatus.text =
              (persData["data"]["MartialStatus"]["name"] != null &&
                      persData["data"]["MartialStatus"]["name"].isNotEmpty)
                  ? persData["data"]["MartialStatus"]["name"].toString()
                  : AppText.maritalStatus;
          gender.text = (persData["data"]["Gender"]["name"] != null &&
                  persData["data"]["Gender"]["name"].isNotEmpty)
              ? persData["data"]["Gender"]["name"].toString()
              : AppText.gender;
          physicalStatus.text =
              (persData["data"]["PhysicalStatus"]["name"] != null &&
                      persData["data"]["PhysicalStatus"]["name"].isNotEmpty)
                  ? persData["data"]["PhysicalStatus"]["name"].toString()
                  : AppText.physicalStatus;

          if (persData["data"]["profileImage"]["path"] != null) {
            _imgUrl = persData["data"]["profileImage"]["path"];
            _imgName = persData["data"]["profileImage"]["imageName"];
          }

          personalDetailCountry.text =
              (persData["data"]?["Country"]?["name"] != null &&
                      persData["data"]?["Country"]?["name"].isNotEmpty)
                  ? persData["data"]["Country"]["name"]
                  : AppText.country;
          if (personalDetailCountry.text != AppText.country) {
            await getState();
            personalDetailState.text =
                (persData["data"]?["State"]?["name"] != null &&
                        persData["data"]?["State"]?["name"].isNotEmpty)
                    ? (persData["data"]?["State"]?["name"] ?? AppText.state)
                    : AppText.state;
          }

          aboutController.text = persData["data"]["about"] != null
              ? persData["data"]["about"]
              : '';
          address.text = persData["data"]["Address"] != null
              ? persData["data"]["Address"]
              : '';
          district.text = persData["data"]["Distict"] != null
              ? persData["data"]["Distict"]
              : '';
          martialStatusID = getIdFromNameValidateList(
                  martialDataResponse?["data"]?["martialStatus"] ?? [],
                  martialStatus.text) ??
              "";
          physicalStatusID = getIdFromNameValidateList(
                  physicalDataResponse!["data"]?["physicalStatus"] ?? [],
                  physicalStatus.text) ??
              "";
          genderID = getIdFromNameValidateList(
                  genderDataResponse?["data"]?["genders"] ?? [], gender.text) ??
              "";
          _personalDetailCompleted =
              persData["data"]["isPersonalDetailCompleted"] != ""
                  ? persData["data"]["isPersonalDetailCompleted"] ?? false
                  : false;
        }
      } else {
        _isPDNull = true;
      }
    } catch (e) {}
    state = const AsyncValue.data(null);
  }

  Future<void> getPartnerPrefData() async {
    state = const AsyncLoading();

    Map<String, dynamic>? partPrefData = await ref
        .read(partnerPreferenceServiceProvider)
        .getPartnerPreferenceByLoginAccount(authorization: authToken);

    if (partPrefData != null) {
      if (partPrefData["data"] != null) {
        preferredAgeFromController.text =
            (partPrefData["data"]["preferredAge"]["minAge"] != null)
                ? partPrefData["data"]["preferredAge"]["minAge"].toString()
                : AppText.age;
        preferredAgeToController.text =
            (partPrefData["data"]["preferredAge"]["maxAge"] != null)
                ? partPrefData["data"]["preferredAge"]["maxAge"].toString()
                : AppText.age;
        preferredHeightFromController.text = (partPrefData["data"]
                    ["preferredHeight"]["minHeight"] !=
                null)
            ? partPrefData["data"]["preferredHeight"]["minHeight"].toString()
            : AppText.height;
        preferredHeightToController.text = (partPrefData["data"]
                    ["preferredHeight"]["maxHeight"] !=
                null)
            ? partPrefData["data"]["preferredHeight"]["maxHeight"].toString()
            : AppText.height;
        others.text = (partPrefData["data"]["others"] != null &&
                partPrefData["data"]["others"] != '')
            ? partPrefData["data"]["others"].toString()
            : '';

        partPrefReligion.text =
            (partPrefData["data"]["preferredReligion"]["name"] != null &&
                    partPrefData["data"]["preferredReligion"]["name"] != ""
                ? partPrefData["data"]["preferredReligion"]["name"]
                : AppText.previousReligion);
        partnerPrefReligionID = getIdFromNameValidateList(
                religionDataResponse?["data"]?["Religions"] ?? [],
                partPrefReligion.text) ??
            "";
        partPrefEducation.text =
            (partPrefData["data"]["preferredEducation"]["name"] != null &&
                    partPrefData["data"]["preferredEducation"]["name"] != ""
                ? partPrefData["data"]["preferredEducation"]["name"]
                : AppText.education);
        educationPartPrefID = getIdFromNameValidateList(
                educationDataResponse?["data"]["educations"] ?? [],
                partPrefEducation.text) ??
            "";

        //maritial status radio buttons
        if (partPrefData["data"]["MartialStatus"]["name"] != null &&
            partPrefData["data"]["MartialStatus"]["name"] != "") {
          _selectMartialStatusRadio = (getIndexFromName(
                      martialDataResponse?["data"]?["martialStatus"] ?? [],
                      partPrefData["data"]["MartialStatus"]["name"]) ??
                  -1) +
              1;
        }
        if (partPrefData["data"]["Gender"]["name"] != null &&
            partPrefData["data"]["Gender"]["name"] != "") {
          partPrefGender.text = partPrefData["data"]["Gender"]["name"];
          genderPartPrefID = getIdFromNameValidateList(
                  genderDataResponse?["data"]?["genders"] ?? [],
                  partPrefGender.text) ??
              "";
        }

        partPrefOccupation.text =
            (partPrefData["data"]["preferredOccupation"]["name"] != null &&
                    partPrefData["data"]["preferredOccupation"]["name"] != ""
                ? partPrefData["data"]["preferredOccupation"]["name"]
                : AppText.occupation);
        occupationPartPrefID = getIdFromNameValidateList(
                occupationDataResponse?["data"]?["Occupations"] ?? [],
                partPrefOccupation.text) ??
            "";
        partPrefCountry.text =
            (partPrefData["data"]["preferredLocation"]["country"] != null &&
                    partPrefData["data"]["preferredLocation"]["country"] != ""
                ? partPrefData["data"]["preferredLocation"]["country"]
                : AppText.country);
        if (partPrefCountry.text != AppText.country) {
          await getPartnerPrefState();

          partPrefState.text =
              (partPrefData["data"]["preferredLocation"]["state"] != null &&
                      partPrefData["data"]["preferredLocation"]["state"] != ""
                  ? partPrefData["data"]["preferredLocation"]["state"]
                  : AppText.state);
        }

        _partPrefsDetailCompleted =
            partPrefData["data"]["isPreferenceDetailCompleted"] != ""
                ? partPrefData["data"]["isPreferenceDetailCompleted"] ?? false
                : false;
      }
    } else {
      _isPPrefNull = true;
    }
    toggleNewAcc();
    state = const AsyncValue.data(null);
  }

  Future<void> getEmployedIn() async {
    state = const AsyncLoading();

    employedInData = await ref.read(DropDownServiceProvider).getallEmployedIn();

    if (employedInData != null) {
      if (employedInData?["data"] != null &&
          employedInData?["data"]["employmentTypes"].isNotEmpty) {
        for (Map<String, dynamic> element in employedInData?["data"]
            ["employmentTypes"]) {
          _employedInList.add(element);
        }
      }
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getRecData() async {
    state = const AsyncLoading();

    Map<String, dynamic>? recData = await ref
        .read(recDetailServiceProvider)
        .getRecDetailByLoginAccount(authtoken: authToken);
    try {
      if (recData != null) {
        if (recData["data"] != null) {
          religion.text = (recData["data"]["religion"]["name"] != null &&
                  recData["data"]["religion"]["name"] != ""
              ? recData["data"]["religion"]["name"]
              : AppText.previousReligion);
          (recData["data"]["religion"]["name"] != null &&
                  recData["data"]["religion"]["name"] != ""
              ? recData["data"]["religion"]["name"]
              : AppText.previousReligion);

          denomination.text =
              (recData["data"]["denomination"]["name"] != null &&
                      recData["data"]["denomination"]["name"] != ""
                  ? recData["data"]["denomination"]["name"]
                  : AppText.denomination);
          (recData["data"]["denomination"]["name"] != null &&
                  recData["data"]["denomination"]["name"] != ""
              ? recData["data"]["denomination"]["name"]
              : AppText.denomination);

          church.text = (recData["data"]["church"]["name"] != null &&
                  recData["data"]["church"]["name"] != ""
              ? recData["data"]["church"]["name"]
              : AppText.church);
          (recData["data"]["church"]["name"] != null &&
                  recData["data"]["church"]["name"] != ""
              ? recData["data"]["church"]["name"]
              : AppText.church);

          education.text =
              (recData["data"]["highestEducation"]["name"] != null &&
                      recData["data"]["highestEducation"]["name"] != ""
                  ? recData["data"]["highestEducation"]["name"]
                  : AppText.highestEducation);
          (recData["data"]["highestEducation"]["name"] != null &&
                  recData["data"]["highestEducation"]["name"] != ""
              ? recData["data"]["highestEducation"]["name"]
              : AppText.highestEducation);

          occupation.text = (recData["data"]["occupation"]["name"] != null &&
                  recData["data"]["occupation"]["name"] != ""
              ? recData["data"]["occupation"]["name"]
              : AppText.occupation);
          (recData["data"]["occupation"]["name"] != null &&
                  recData["data"]["occupation"]["name"] != ""
              ? recData["data"]["occupation"]["name"]
              : AppText.occupation);

          workLocation.text =
              (recData["data"]["workLocation"]["state"] != null &&
                      recData["data"]["workLocation"]["state"] != ""
                  ? recData["data"]["workLocation"]["state"]
                  : AppText.workLocation);
          (recData["data"]["workLocation"]["state"] != null &&
                  recData["data"]["workLocation"]["state"] != ""
              ? recData["data"]["workLocation"]["state"]
              : AppText.workLocation);

          college.text = (recData["data"]["college"] != null &&
                  recData["data"]["college"] != ""
              ? recData["data"]["college"]
              : AppText.collegeInstitution);
          (recData["data"]["college"] != null &&
                  recData["data"]["college"] != ""
              ? recData["data"]["college"]
              : AppText.collegeInstitution);

          occupationdetails.text = (recData["data"]["occupationDetail"] != null)
              ? recData["data"]["occupationDetail"].toString()
              : AppText.occupationDetails;

          if (recData["data"]["employedIn"] != null &&
              recData["data"]["employedIn"] != "") {
            _selectEmployedInRadio = (getIndexFromName(
                        employedInData?["data"]?["employmentTypes"] ?? [],
                        recData["data"]["employedIn"]) ??
                    -1) +
                1;
            print("_selectEmployedInRadio ${employedInData?["data"]?["employmentTypes"]}");
          }

          religionID = getIdFromNameValidateList(
                  religionDataResponse?["data"]?["Religions"] ?? [],
                  religion.text) ??
              "";
          churchID = getIdFromNameValidateList(
                  churchDataResponse?["data"]["churchs"] ?? [], church.text) ??
              "";
          denominationID = getIdFromNameValidateList(
                  denominationDataResponse?["data"]["denominations"] ?? [],
                  denomination.text) ??
              "";
          educationID = getIdFromNameValidateList(
                  educationDataResponse?["data"]["educations"] ?? [],
                  education.text) ??
              "";
          collegeID = getIdFromNameValidateList(
                  collegeDataResponse?["data"]["colleges"] ?? [],
                  college.text) ??
              "";
          occupationID = getIdFromNameValidateList(
                  occupationDataResponse?["data"]["Occupations"] ?? [],
                  occupation.text) ??
              "";
          workLocationID = getIdFromNameValidateList(
                  workLocationDataResponse?["data"]["locations"] ?? [],
                  workLocation.text) ??
              "";
          _RECDetailCompleted = recData?["data"]?["isRECDetailCompleted"] != ""
              ? recData?["data"]?["isRECDetailCompleted"] ?? false
              : false;
        }
      } else {
        _isRECNull = true;
      }
    } catch (e, s) {}
    state = const AsyncValue.data(null);
  }

  Future<void> getAllData() async {
    state = const AsyncLoading();

    Map<String, dynamic>? allDetailsData = await ref
        .read(accountServiceProvider)
        .getAllAccountDetailsByLogin(authtoken: authToken);
    try {
      if (allDetailsData != null) {
        if (allDetailsData["data"] != null) {
          //todo other data will be fetched from this api
        }
      } else {
        _isRECNull = true;
      }
    } catch (e, s) {}
    state = const AsyncValue.data(null);
  }

  ///============================================================================ get data by sections

  /// ============================================================================= get dropdowns
  Future<void> getMartialDropDown() async {
    state = const AsyncLoading();
    _martialList.clear();
    martialDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallMaritialStatus(authtoken: authToken);

    if (martialDataResponse != null) {
      if (martialDataResponse?["data"] != null) {
        //
        for (var martialStatus in martialDataResponse?['data']
            ["martialStatus"]) {
          _martialList.add(martialStatus['name']);
        }
        _martialList.add(AppText.others);
      }
    }

    state = const AsyncValue.data(null);
  }

  Future<void> getCollegeDropDown() async {
    state = const AsyncLoading();

    collegeDataResponse = await ref
        .read(DropDownServiceProvider)
        .getAllCollege(authtoken: authToken);

    if (collegeDataResponse != null) {}

    state = const AsyncValue.data(null);
  }

  Future<void> getDenominationDropDown() async {
    state = const AsyncLoading();

    denominationDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallDenomination(authtoken: authToken);

    if (denominationDataResponse != null) {}
    state = const AsyncValue.data(null);
  }

  Future<void> getChurchDropDown() async {
    state = const AsyncLoading();

    churchDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallChurch(authtoken: authToken);

    if (churchDataResponse != null) {}
    state = const AsyncValue.data(null);
  }

  Future<void> getWorkLocationDropDown() async {
    state = const AsyncLoading();

    Map<String, dynamic>? workLocationData = await ref
        .read(DropDownServiceProvider)
        .getallWorkLocation(authtoken: authToken);
    //
    // if (workLocationData != null) {
    //   if (workLocationData?["data"] != null) {
    //
    //     for (var workLocationStatus in workLocationData?['data']) {
    //       _workLocationList.add(workLocationStatus['_id']);
    //     }
    //
    //   }
    // }

    if (workLocationData != null) {
      if (workLocationData["data"] != null &&
          workLocationData['data']["locations"] != null &&
          workLocationData['data']["locations"].isNotEmpty) {
        workLocationDataResponse = workLocationData;
        for (var workLocationStatus in workLocationData['data']["locations"]) {
          String state = workLocationStatus['state']['name'];
          String country = workLocationStatus['country']['name'];
          // Add the state to the list
        }
      }
    }

    state = const AsyncValue.data(null);
  }

  Future<void> getPhysicalDropDown() async {
    state = const AsyncLoading();

    physicalDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallPhysicalStatus(authtoken: authToken);

    if (physicalDataResponse != null) {
      if (physicalDataResponse?["data"] != null) {}
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getGenderDropDown() async {
    state = const AsyncLoading();

    genderDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallGender(authtoken: authToken);

    if (genderDataResponse != null) {
      if (genderDataResponse?["data"] != null) {}
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getCountry() async {
    state = const AsyncLoading();

    countryDataResponse = await ref
        .read(DropDownServiceProvider)
        .getAllCountry(authtoken: authToken);

    if (countryDataResponse != null) {
      if (countryDataResponse?["data"] != null) {
        for (var countryStatus in countryDataResponse?['data']["countries"]) {}
      }
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getAllStates() async {
    state = const AsyncLoading();

    getAllStatesResponse = await ref
        .read(DropDownServiceProvider)
        .getAllStates(authtoken: authToken);

    if (getAllStatesResponse != null) {
      if (getAllStatesResponse?["data"] != null) {
        for (var statesStatus in getAllStatesResponse?['data']["states"]) {}
      }
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getState() async {
    state = const AsyncLoading();
    _isStateLoaded = false;

    stateDataResponse?.clear();
    stateDataResponse = await ref
        .read(DropDownServiceProvider)
        .getAllStateByCountryId(
            authtoken: authToken,
            countryId: getIdFromNameValidateList(
                    countryDataResponse?["data"]?["countries"] ?? [],
                    personalDetailCountry.text) ??
                "");

    if (stateDataResponse != null) {
      if (stateDataResponse?["data"] != null) {
        for (var stateStatus in stateDataResponse?['data']["states"]) {}
      }
    }
    _isStateLoaded = true;

    state = const AsyncValue.data(null);
  }

  Future<void> getPartnerPrefState() async {
    state = const AsyncLoading();
    _isPartPrefStateLoaded = false;

    partnerPrefsStateDataResponse?.clear();
    partnerPrefsStateDataResponse = await ref
        .read(DropDownServiceProvider)
        .getAllStateByCountryId(
            authtoken: authToken,
            countryId: getIdFromNameValidateList(
                    countryDataResponse?["data"]?["countries"] ?? [],
                    partPrefCountry.text) ??
                "");

    if (partnerPrefsStateDataResponse != null) {
      if (partnerPrefsStateDataResponse?["data"] != null) {
        for (var partnerStateStatus in partnerPrefsStateDataResponse?['data']
            ["states"]) {}
      }
    }
    _isPartPrefStateLoaded = true;
    state = const AsyncValue.data(null);
  }

  Future<void> getDenominationByReligion() async {
    state = const AsyncLoading();
    _isDenominationLoaded = false;

    denominationDataResponse?.clear();
    denominationDataResponse = await ref
        .read(DropDownServiceProvider)
        .getallDenominationByReligion(
            authtoken: authToken,
            religionId: getIdFromNameValidateList(
                    religionDataResponse?["data"]?["Religions"] ?? [],
                    religion.text) ??
                "");

    if (denominationDataResponse != null) {
      if (denominationDataResponse?["data"] != null) {
        for (var stateStatus in denominationDataResponse?['data']
            ["denominations"]) {}
      }
    }
    _isDenominationLoaded = true;

    state = const AsyncValue.data(null);
  }

  Future<void> getReligionDropDown() async {
    state = const AsyncLoading();

    Map<String, dynamic>? religionData = await ref
        .read(DropDownServiceProvider)
        .getallReligion(authtoken: authToken);

    if (religionData != null) {
      if (religionData["data"] != null) {
        religionDataResponse = religionData;
      }
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getEducationDropDown() async {
    state = const AsyncLoading();

    Map<String, dynamic>? educationData = await ref
        .read(DropDownServiceProvider)
        .getallEducation(authtoken: authToken);

    if (educationData != null) {
      if (educationData["data"] != null) {
        educationDataResponse = educationData;
      }
    }
    state = const AsyncValue.data(null);
  }

  Future<void> getOccupationDropDown() async {
    state = const AsyncLoading();

    Map<String, dynamic>? occupationData = await ref
        .read(DropDownServiceProvider)
        .getallOccupation(authtoken: authToken);

    if (occupationData != null) {
      if (occupationData["data"] != null) {
        occupationDataResponse = occupationData;
      }
    }
    state = const AsyncValue.data(null);
  }

  /// ============================================================================= get dropdowns

  ///============================================================================ create funcions
  void onCreatePersonalDetail() async {
    PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });
    //

    //todo : validations
    if (true) {
      personalDetailsResponse =
          await ref.read(personalDetailsServiceProvider).createDetails(
                authtoken: authToken,
                name: name.text,
                about: aboutController.text,
                // age: age.text,
                OtherGender: genderID == "" &&
                        gender.text != "" &&
                        gender.text != AppText.gender
                    ? gender.text
                    : "",
                OtherMartialStatus: martialStatusID == "" &&
                        martialStatus.text != "" &&
                        martialStatus.text != AppText.maritalStatus
                    ? martialStatus.text
                    : "",
                OtherPhysicalStatus: physicalStatusID == "" &&
                        physicalStatus.text != "" &&
                        physicalStatus.text != AppText.physicalStatus
                    ? physicalStatus.text
                    : "",

                DOB: dob.text,
                height: height.text,
                weight: weight.text,
                MartialStatus: martialStatusID,
                PhysicalStatus: physicalStatusID,
                Gender: genderID,
                Address: address.text,
                image: _personalDetailImageListCompressed,
                country: getIdFromNameValidateList(
                        countryDataResponse?["data"]?["countries"] ?? [],
                        personalDetailCountry.text) ??
                    "",
                district: district.text,
                state: getIdFromNameValidateList(
                        getAllStatesResponse?["data"]?["states"] ?? [],
                        personalDetailState.text) ??
                    "",
              );

      if (personalDetailsResponse != null) {
        if (personalDetailsResponse!["success"] == true) {
          _personalDetailCompleted = true;
          ref.read(dialogServiceProvider).showSnackBar(
              content: 'Personal Information Added successfully!!',
              color: AppColors.yellow.withOpacity(0.9),
              textclr: AppColors.black);
          if (_fromRegister) {
            Navigator.pop(Globals.navigatorKey.currentContext!);
          }
          // commonNavigator(
          //   context: Globals.navigatorKey.currentContext!,
          //   child: const ProfilePageScreen(),
          //   type: PageTransitionType.rightToLeftWithFade,
          // );
        } else {
          ref.read(dialogServiceProvider).showSnackBar(
              content:
                  personalDetailsResponse?["error"] ?? "Server error occured",
              color: AppColors.yellow.withOpacity(0.9),
              textclr: AppColors.black);
        }

        togglePDEditFalse();
      }
    }
  }

  void onCreateFamilyDetail() async {
    userFamilyDetailsResponse = await ref
        .read(familydetailsRepositoryProvider)
        .createFamilyDetails(
            authToken: authToken,
            father: fatherName.text,
            fatherOccupation: fatherOccupationID,
            mother: motherName.text,
            motherOccupation: motherOccupationID,
            otherMotherOccupation: motherOccupationID == "" &&
                    motherOccupation.text != "" &&
                    motherOccupation.text != AppText.motherOccupation
                ? motherOccupation.text
                : "",
            otherFatherOccupation: fatherOccupationID == "" &&
                    fatherOccupation.text != "" &&
                    fatherOccupation.text != AppText.fatherOccupation
                ? fatherOccupation.text
                : "",
            numberOfBrother: _selectNumberOfBrothers,
            numberOfSister: _selectNumberOfSisters);
    try {
      if (userFamilyDetailsResponse != null) {
        if (userFamilyDetailsResponse!["success"] == true) {
          _familyDetailCompleted = true;
          ref.read(dialogServiceProvider).showSnackBar(
              content: 'User Family Information Added successfully!!',
              color: AppColors.yellow.withOpacity(0.9),
              textclr: AppColors.black);
          if (_fromRegister) {
            Navigator.pop(Globals.navigatorKey.currentContext!);
          }
        } else {
          ref.read(dialogServiceProvider).showSnackBar(
              content: userFamilyDetailsResponse!["error"].toString(),
              color: AppColors.yellow.withOpacity(0.9),
              textclr: AppColors.black);
        }
        toggleFDEditFalse();
      }
    } catch (e) {
      ref.read(dialogServiceProvider).showSnackBar(
          content: e.toString(),
          color: AppColors.yellow.withOpacity(0.9),
          textclr: AppColors.black);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  void onCreatePartnerPreference() async {
    PreferenceManagerUtils.getToken().then((value) {
      authToken = value;
    });

    Map<String, dynamic>? createLocationResponse =
        await ref.read(partnerPreferenceServiceProvider).createLocation(
              country: getIdFromNameValidateList(
                      countryDataResponse?["data"]?["countries"] ?? [],
                      partPrefCountry.text) ??
                  "",
              state: getIdFromNameValidateList(
                      partnerPrefsStateDataResponse?["data"]?["states"] ?? [],
                      partPrefState.text) ??
                  "",
            );

    if (_selectMartialStatusRadio != 0) {
      Map<String, dynamic>? userPartnerPrefsResponse = await ref
          .read(partnerPreferenceServiceProvider)
          .createPartnerPreference(
            otherMartialStatus:
                preferredOtherMartialStatusController.text != '' &&
                        _isOtherPartPrefMartialStatus == true
                    ? preferredOtherMartialStatusController.text
                    : "",
            authtoken: authToken,
            martialStatus: preferredOtherMartialStatusController.text == '' &&
                    _isOtherPartPrefMartialStatus != true
                ? getIdFromNameValidateList(
                        martialDataResponse?["data"]?["martialStatus"] ?? [],
                        _martialList[_selectMartialStatusRadio - 1]) ??
                    ""
                : "",
            minAge: preferredAgeFromController.text,
            maxAge: preferredAgeToController.text,
            minHeight: preferredHeightFromController.text,
            maxHeight: preferredHeightToController.text,
            gender: genderPartPrefID,
            otherGender: genderPartPrefID == "" &&
                    partPrefGender.text != "" &&
                    partPrefGender.text != AppText.preferredgender
                ? partPrefGender.text
                : "",
            religion: partnerPrefReligionID,
            otherPreferredReligion: partnerPrefReligionID == "" &&
                    partPrefReligion.text != "" &&
                    partPrefReligion.text != AppText.preferredreligion
                ? partPrefReligion.text
                : "",
            education: educationPartPrefID,

            otherPreferredEducation: educationPartPrefID == "" &&
                    partPrefEducation.text != "" &&
                    partPrefEducation.text != AppText.education
                ? partPrefEducation.text
                : "",
            occupation: occupationPartPrefID,
            otherPreferredOccupation: occupationPartPrefID == "" &&
                    partPrefOccupation.text != "" &&
                    partPrefOccupation.text != AppText.occupation
                ? partPrefOccupation.text
                : "",

            others: others.text,
            // location: createLocationResponse?["data"]?["_id"] ?? "",
            state: getIdFromNameValidateList(
                    partnerPrefsStateDataResponse?["data"]?["states"] ?? [],
                    partPrefState.text) ??
                "",
            country: getIdFromNameValidateList(
                    countryDataResponse?["data"]?["countries"] ?? [],
                    partPrefCountry.text) ??
                "",
          );

      try {
        if (userPartnerPrefsResponse != null) {
          if (userPartnerPrefsResponse["success"] == true) {
            _partPrefsDetailCompleted = true;
            ref.read(dialogServiceProvider).showSnackBar(
                content: 'User Partner Preference Added successfully!!',
                color: AppColors.yellow.withOpacity(0.9),
                textclr: AppColors.black);
            if (_fromRegister) {
              Navigator.pop(Globals.navigatorKey.currentContext!);
            }
            // commonNavigator(
            //   context: Globals.navigatorKey.currentContext!,
            //   child: const ProfilePageScreen(),
            //   type: PageTransitionType.rightToLeftWithFade,
            // );
          } else {
            ref.read(dialogServiceProvider).showSnackBar(
                content: (userPartnerPrefsResponse["error"] ??
                        userPartnerPrefsResponse["message"])
                    .toString(),
                color: AppColors.yellow.withOpacity(0.9),
                textclr: AppColors.black);
          }
          togglePPrefEditFalse();
        }
      } catch (e) {
        ref.read(dialogServiceProvider).showSnackBar(
            content: e.toString(),
            color: AppColors.yellow.withOpacity(0.9),
            textclr: AppColors.black);
        throw Exception("Exception is =-=-1 $e");
      }
    } else {
      ref.read(dialogServiceProvider).showSnackBar(
          content: "select martial status",
          color: AppColors.yellow.withOpacity(0.9),
          textclr: AppColors.black);
    }
  }

  void onCreateRecdetails() async {
    // if (selectedImage != null) {
    // Convert the selected image to a list of files
    // List<File> imageList = [selectedImage!];
    if (_employedInList.isNotEmpty && (_selectEmployedInRadio) != 0) {
      userRecDetailsResponse = await ref
          .read(recDetailServiceProvider)
          .createRecDetail(
            authtoken: authToken,
            religion: religionID,
            otherReligion: religionID == "" &&
                    religion.text != "" &&
                    religion.text != AppText.previousReligion
                ? religion.text
                : "",
            church: churchID,
            otherChurch: churchID == "" &&
                    church.text != "" &&
                    church.text != AppText.church
                ? church.text
                : "",
            denomination: denominationID,
            otherDenomination: denominationID == "" &&
                    denomination.text != "" &&
                    denomination.text != AppText.denomination
                ? denomination.text
                : "",
            highestEducation: educationID,
            otherEducation: educationID == "" &&
                    education.text != "" &&
                    education.text != AppText.highestEducation
                ? education.text
                : "",
            college: collegeID,
            otherCollege: collegeID == "" &&
                    college.text != "" &&
                    college.text != AppText.collegeInstitution
                ? college.text
                : "",
            occupation: occupationID,
            otherOccupation: occupationID == "" &&
                    occupation.text != "" &&
                    occupation.text != AppText.occupation
                ? occupation.text
                : "",
            occupationDetail: occupationdetails.text,
            employedIn: _employedInList[(_selectEmployedInRadio - 1)]["name"],
            workLocation: workLocationID,
            otherWorkLocation: workLocationID == "" &&
                    workLocation.text != "" &&
                    workLocation.text != AppText.workLocation
                ? workLocation.text
                : "",
          );

      try {
        if (userRecDetailsResponse != null) {
          if (userRecDetailsResponse?["success"] == true) {
            _RECDetailCompleted = true;
            ref.read(dialogServiceProvider).showSnackBar(
                content: 'User REC Information Added successfully!!',
                color: AppColors.yellow.withOpacity(0.9),
                textclr: AppColors.black);
            if (_fromRegister) {
              Navigator.pop(Globals.navigatorKey.currentContext!);
            }
            // commonNavigator(
            //   context: Globals.navigatorKey.currentContext!,
            //   child: const ProfilePageScreen(),
            //   type: PageTransitionType.rightToLeftWithFade,
            // );
          } else {
            // ref.read(dialogServiceProvider).showSnackBar(
            //     content: userRecDetailsResponse!["error"],
            //     color: AppColors.yellow.withOpacity(0.9),
            //     textclr: AppColors.black);
          }
          toggleRECEditFalse();
        }
      } catch (e) {
        ref.read(dialogServiceProvider).showSnackBar(
            content: e.toString(),
            color: AppColors.yellow.withOpacity(0.9),
            textclr: AppColors.black);
      }
    } else {
      DialogServiceV1().showSnackBar(
          content: "Please select emplpoyed in status",
          color: AppColors.black,
          textclr: AppColors.white);
    }
  }

  ///============================================================================ create funcions

  bool isSelected(String reason) {
    return _selectedReasons.contains(reason);
  }

  void toggleSelected(String reason) {
    if (_selectedReasons.contains(reason)) {
      _selectedReasons.remove(reason);
    } else {
      _selectedReasons.add(reason);
    }
    state = AsyncData(_selectedReasons);
  }

  void toggleEdit() {
    state = const AsyncLoading();
    _isEdit = !_isEdit;
    state = const AsyncValue.data(null);
  }

  void toggleNewAcc() {
    state = const AsyncLoading();
    if (_isRECNull == true &&
        _isPPrefNull == true &&
        _isPDNull == true &&
        _isFDNull == true) {
      _isNewAcc = true;
      _isEdit = true;
      _isLoading = false;
    } else {
      _isLoading = false;
    }

    state = const AsyncValue.data(null);
  }

  void togglePDEditFalse() {
    state = const AsyncLoading();
    _isPDEdit = false;
    state = const AsyncValue.data(null);
  }

  void togglePDEditTrue() {
    state = const AsyncLoading();
    _isPDEdit = true;
    _personalDetailCompleted = false;
    state = const AsyncValue.data(null);
  }

  void toggleRECEditFalse() {
    state = const AsyncLoading();
    _isRECDEdit = false;
    state = const AsyncValue.data(null);
  }

  void toggleRECEditTrue() {
    state = const AsyncLoading();
    _isRECDEdit = true;
    _RECDetailCompleted = false;
    state = const AsyncValue.data(null);
  }

  void toggleFDEditFalse() {
    state = const AsyncLoading();
    _isFDEdit = false;
    state = const AsyncValue.data(null);
  }

  void toggleFDEditTrue() {
    state = const AsyncLoading();
    _isFDEdit = true;
    _familyDetailCompleted = false;
    state = const AsyncValue.data(null);
  }

  void togglePPrefEditTrue() {
    state = const AsyncLoading();
    _isPPrefEdit = true;
    _partPrefsDetailCompleted = false;
    state = const AsyncValue.data(null);
  }

  void togglePPrefEditFalse() {
    state = const AsyncLoading();
    _isPPrefEdit = false;
    state = const AsyncValue.data(null);
  }

  // onRecUpdateSave() async {
  //   state = const AsyncLoading();
  //   if (validate(_selectcollege ?? "") == null &&
  //       validate(occupationdetails.text) == null &&
  //       _isRecdetailverified) {
  //     Future.delayed(const Duration(seconds: 1), () async {
  //       ref.read(recRepositoryProvider).updateRecDetail(
  //             authtoken: authToken,
  //             college: collageInstistuteController.text,
  //             occupation:  occupation.text ?? "",
  //             occupationDetail: occupationdetails.text,
  //             workLocation: "",
  //             id: Id,
  //           );
  //
  //       state = const AsyncValue.data(null);
  //     });
  //   }
  // }

  Future<void> pickDate() async {
    state = const AsyncLoading();

    String calculateAge(DateTime birthDate) {
      final now = DateTime.now();
      int age = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--;
      }
      return age.toString();
    }

    final DateTime? picked = await showDatePicker(
        context: Globals.navigatorKey.currentContext!,
        initialDate: _selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(3000),
        helpText: "Select Date of Birth",
        confirmText: "OK",
        cancelText: "Cancel");
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      dob = TextEditingController(text: formatDateTime(_selectedDate));
      age = TextEditingController(text: calculateAge(_selectedDate));
    }
    state = const AsyncValue.data(null);
  }

  Future<File?> compressFile(File file) async {
    Directory directory = await getApplicationSupportDirectory();

    String path = directory.path;
    String targetPath =
        '$path/DOC-${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}-${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}.png';

    XFile? xFileresult = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 10,
      format: CompressFormat.png,
      minHeight: 200,
      minWidth: 200,
      rotate: 0,
    );
    var results = File(xFileresult!.path.toString());

    return results;
  }

  onImgSelect({required val}) async {
    state = const AsyncLoading();
    selectedImage = val;
    if (selectedImage != null) {
      compressdFile = (await compressFile(selectedImage!));
    }
    state = const AsyncValue.data(null);
  }

  onPersonalDetailImgSelect({required File val, required index}) async {
    state = const AsyncLoading();
    _personalDetailImageList.add(val.path);

    if (_personalDetailImageList[index] != '') {
      _personalDetailImageListCompressed.add(
          (await compressFile(File(_personalDetailImageList[index])))?.path ??
              "");
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onGenderSearchChanged(String query) async {
    print("resultsresultsasdas $query");
    if (query != "") {
      Map<String, dynamic>? results = genderDataResponse;

      if (results?["data"]["genders"] != null &&
          results?["data"]["genders"] != []) {
        return results?["data"]["genders"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeNoOfBrother({required val}) {
    state = const AsyncLoading();
    _selectNumberOfBrothers = val;
    state = const AsyncValue.data(null);
  }

  Future<List> onOccupationsSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = occupationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Occupations"] != null &&
          results?["data"]["Occupations"] != []) {
        return results?["data"]["Occupations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeOccupation({required val}) {
    state = const AsyncLoading();
    occupation.text = val;
    changeFocusoccupationNode();
    occupationID = getIdFromNameValidateList(
            occupationDataResponse?["data"]["Occupations"] ?? [],
            occupation.text) ??
        "";
    if (val != AppText.others) {
      occupation.text = val;
      occupationID = getIdFromNameValidateList(
              occupationDataResponse?["data"]["Occupations"] ?? [],
              occupation.text) ??
          "";
    } else {
      occupationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        occupation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onFOccuSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = occupationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Occupations"] != null &&
          results?["data"]["Occupations"] != []) {
        return results?["data"]["Occupations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeFatherOccupation({required val}) {
    state = const AsyncLoading();
    changeFocusfatherOccupationNode();
    if (val != AppText.others) {
      fatherOccupation.text = val;
      fatherOccupationID = getIdFromNameValidateList(
              occupationDataResponse?["data"]?["Occupations"] ?? [],
              fatherOccupation.text) ??
          "";
    } else {
      fatherOccupationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        fatherOccupation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onMoccupationSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = occupationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Occupations"] != null &&
          results?["data"]["Occupations"] != []) {
        return results?["data"]["Occupations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeMotherOccupation({required val}) {
    state = const AsyncLoading();
    changeFocusmotherOccupationNode();
    if (val != AppText.others) {
      motherOccupation.text = val;
      motherOccupationID = getIdFromNameValidateList(
              occupationDataResponse?["data"]?["Occupations"] ?? [],
              motherOccupation.text) ??
          "";
    } else {
      motherOccupationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        motherOccupation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  void changeGender({required String val}) {
    print("valval %val $val");
    state = const AsyncLoading();
    if (val != AppText.others) {
      gender.text = val;
      genderID = getIdFromNameValidateList(
              genderDataResponse?["data"]?["genders"] ?? [], gender.text) ??
          "";
      print("valval %val $val id: $genderID");
    } else {
      genderID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        gender.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    changeFocusGenderNode();
    state = const AsyncValue.data(null);
  }

  Future<List> onWorkLocationSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = workLocationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["locations"] != null &&
          results?["data"]["locations"] != []) {
        return results?["data"]["locations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeWorkLocation({required val}) {
    state = const AsyncLoading();
    changeFocusworkLocationNode();
    if (val != AppText.others) {
      workLocation.text = val;
      workLocationID = getIdFromNameValidateList(
              workLocationDataResponse?["data"]["locations"] ?? [],
              workLocation.text) ??
          "";
    } else {
      workLocationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        workLocation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onCollegeSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = collegeDataResponse;
      print("resultsresults $results");
      if (results?["data"]["colleges"] != null &&
          results?["data"]["colleges"] != []) {
        return results?["data"]["colleges"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeCollege({required val}) {
    state = const AsyncLoading();
    changeFocuscollegeNode();
    if (val != AppText.others) {
      college.text = val;
      collegeID = getIdFromNameValidateList(
              collegeDataResponse?["data"]["colleges"] ?? [], college.text) ??
          "";
    } else {
      collegeID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        college.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onMartialStatusSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = martialDataResponse;
      print("resultsresults $results");
      if (results?["data"]["martialStatus"] != null &&
          results?["data"]["martialStatus"] != []) {
        return results?["data"]["martialStatus"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeMartialStatus({required val}) {
    state = const AsyncLoading();
    if (val != AppText.others) {
      martialStatus.text = val;
      martialStatusID = getIdFromNameValidateList(
              martialDataResponse?["data"]?["martialStatus"] ?? [],
              martialStatus.text) ??
          "";
    } else {
      martialStatusID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        martialStatus.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    changeFocusmartialStatusNode();
    state = const AsyncValue.data(null);
  }

  void changePhysicalStatus({required val}) {
    state = const AsyncLoading();

    if (val != AppText.others) {
      physicalStatus.text = val;
      physicalStatusID = getIdFromNameValidateList(
              physicalDataResponse!["data"]?["physicalStatus"] ?? [],
              physicalStatus.text) ??
          "";
    } else {
      physicalStatusID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        physicalStatus.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    changeFocusphysicalStatusNode();
    state = const AsyncValue.data(null);
  }

  Future<List> onPhysicalStatusSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = physicalDataResponse;
      print("resultsresults $results");
      if (results?["data"]["physicalStatus"] != null &&
          results?["data"]["physicalStatus"] != []) {
        return results?["data"]["physicalStatus"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeNoOfSisters({required val}) {
    state = const AsyncLoading();
    _selectNumberOfSisters = val;
    state = const AsyncValue.data(null);
  }

  Future<List> onReligionSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = religionDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Religions"] != null &&
          results?["data"]["Religions"] != []) {
        return results?["data"]["Religions"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  Future<void> changeReligion({required val}) async {
    state = const AsyncLoading();
    changeFocusreligionNode();
    if (val != AppText.others) {
      religion.text = val;
      _isReligionSelected = true;
      religionID = getIdFromNameValidateList(
              religionDataResponse?["data"]?["Religions"] ?? [],
              religion.text) ??
          "";
    } else {
      religionID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        religion.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    await getDenominationByReligion();

    state = const AsyncValue.data(null);
  }

  Future<List> onPartnerPrefsStateSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = partnerPrefsStateDataResponse;
      print("resultsresults $results");
      if (results?["data"]["states"] != null &&
          results?["data"]["states"] != []) {
        return results?["data"]["states"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changePartnerPrefState({required val}) {
    state = const AsyncLoading();
    partPrefState.text = val;
    changefocuspartPrefStateNode();
    state = const AsyncValue.data(null);
  }

  void changePersonalDetailState({required val}) {
    state = const AsyncLoading();
    personalDetailState.text = val;
    changeFocuspersonalDetailStateNode();
    state = const AsyncValue.data(null);
  }

  Future<List> onStateSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = stateDataResponse;
      print("resultsresults $results");
      if (results?["data"]["states"] != null &&
          results?["data"]["states"] != []) {
        return results?["data"]["states"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  Future<List> onPartnerPrefEducationSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = educationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["educations"] != null &&
          results?["data"]["educations"] != []) {
        return results?["data"]["educations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changePartnerPrefEducation({required val}) {
    state = const AsyncLoading();
    changeFocuspartPrefEducationNode();
    if (val != AppText.others) {
      partPrefEducation.text = val;
      educationPartPrefID = getIdFromNameValidateList(
              educationDataResponse?["data"]["educations"] ?? [],
              partPrefEducation.text) ??
          "";
    } else {
      educationPartPrefID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        partPrefEducation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onPartnerPrefReligionSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = religionDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Religions"] != null &&
          results?["data"]["Religions"] != []) {
        return results?["data"]["Religions"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changePartnerPrefReligion({required val}) {
    state = const AsyncLoading();
    changeFocuspartPrefReligionNode();
    if (val != AppText.others) {
      partPrefReligion.text = val;
      partnerPrefReligionID = getIdFromNameValidateList(
              religionDataResponse?["data"]?["Religions"] ?? [],
              partPrefReligion.text) ??
          "";
    } else {
      partnerPrefReligionID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        partPrefReligion.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onPartnerPrefGenderSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = genderDataResponse;
      print("resultsresults $results");
      if (results?["data"]["genders"] != null &&
          results?["data"]["genders"] != []) {
        return results?["data"]["genders"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changePartnerPrefGender({required val}) {
    state = const AsyncLoading();
    changeFocuspartPrefGenderNode();
    if (val != AppText.others) {
      partPrefGender.text = val;
      genderPartPrefID = getIdFromNameValidateList(
              genderDataResponse?["data"]?["genders"] ?? [],
              partPrefGender.text) ??
          "";
    } else {
      genderPartPrefID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        partPrefGender.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  // void changeCollege({required val}) {
  //   state = const AsyncLoading();
  //   _selectcollege = val;
  //   state = const AsyncValue.data(null);
  // }

  void changeCountry({required val}) async {
    state = const AsyncLoading();
    personalDetailCountry.text = val;
    _isCountrySelected = true;
    // countryID = getIdFromName(countryDataResponse!, personalDetailCountry.text);
    //
    changeFocuspersonalDetailCountryNode();
    await getState();
    state = const AsyncValue.data(null);
  }

  Future<List> onCountrySearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = countryDataResponse;
      print("resultsresults $results");
      if (results?["data"]["countries"] != null &&
          results?["data"]["countries"] != []) {
        return results?["data"]["countries"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changePartnerCountry({required val}) async {
    state = const AsyncLoading();
    partPrefCountry.text = val;
    changefocuspartPrefCountryNode();
    _isPartPrefCountrySelected = true;
    await getPartnerPrefState();
    state = const AsyncValue.data(null);
  }

  onSelectMartialStatus(val) {
    state = const AsyncLoading();
    _isOtherPartPrefMartialStatus = false;
    preferredOtherMartialStatusController.text = "";

    _selectMartialStatusRadio = val;
    if (_martialList[_selectMartialStatusRadio - 1] == AppText.others) {
      _isOtherPartPrefMartialStatus = true;
    }

    state = const AsyncValue.data(null);
  }

  onSelectEmployedInStatus(val) {
    state = const AsyncLoading();
    _selectEmployedInRadio = val;
    state = const AsyncValue.data(null);
  }

  Future<List> onPartnerPrefOccupationSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = occupationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["Occupations"] != null &&
          results?["data"]["Occupations"] != []) {
        return results?["data"]["Occupations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  onSelectPartnerPrefOccupationStatus({required val}) {
    state = const AsyncLoading();
    changeFocuspartPrefOccupationNode();
    if (val != AppText.others) {
      partPrefOccupation.text = val;
      occupationPartPrefID = getIdFromNameValidateList(
              occupationDataResponse?["data"]?["Occupations"] ?? [],
              partPrefOccupation.text) ??
          "";
    } else {
      occupationPartPrefID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        partPrefOccupation.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onDenominationSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = denominationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["denominations"] != null &&
          results?["data"]["denominations"] != []) {
        return results?["data"]["denominations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeDenomination({required val}) {
    state = const AsyncLoading();
    changeFocusdenominationNode();
    if (val != AppText.others) {
      denomination.text = val;
      denominationID = getIdFromNameValidateList(
              denominationDataResponse?["data"]["denominations"] ?? [],
              denomination.text) ??
          "";
    } else {
      denominationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        denomination.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onChurchSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = churchDataResponse;
      print("resultsresults $results");
      if (results?["data"]["churchs"] != null &&
          results?["data"]["churchs"] != []) {
        return results?["data"]["churchs"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeChurch({required val}) {
    state = const AsyncLoading();
    changeFocuschurchNode();
    if (val != AppText.others) {
      church.text = val;
      churchID = getIdFromNameValidateList(
              churchDataResponse?["data"]["churchs"] ?? [], church.text) ??
          "";
    } else {
      churchID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        church.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  Future<List> onEducSearchChanged(String query) async {
    if (query != "") {
      Map<String, dynamic>? results = educationDataResponse;
      print("resultsresults $results");
      if (results?["data"]["educations"] != null &&
          results?["data"]["educations"] != []) {
        return results?["data"]["educations"] ??
            [
              {"name": "Not Found"}
            ];
      } else {
        return [
          {"name": "Not Found"}
        ];
      }
    } else {
      return [];
    }
  }

  void changeHighestEducation({required val}) {
    state = const AsyncLoading();
    changeFocuseducationNode();
    if (val != AppText.others) {
      education.text = val;
      educationID = getIdFromNameValidateList(
              educationDataResponse?["data"]["educations"] ?? [],
              education.text) ??
          "";
    } else {
      educationID = "";
      DialogServiceV1().AddOtherDetailDialogue(onSubmit: (val1) {
        state = const AsyncLoading();
        education.text = val1;
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  // String getIdFromName(Map<String, dynamic> jsonData, String name) {
  //   try {
  //     if (jsonData['success'] == true && jsonData.containsKey('data')) {
  //       List<dynamic> data = jsonData['data'];
  //       for (var item in data) {
  //         if (item['name'] == name) {
  //           return item['_id'];
  //         }
  //       }
  //       return "Name not found";
  //     } else {
  //       return "Invalid JSON or unsuccessful operation";
  //     }
  //   } catch (e) {
  //     return "Error: $e";
  //   }
  // }
  int? getIndexFromName(List<dynamic> jsonData, String name) {
    try {
      if (jsonData.isNotEmpty) {
        List<dynamic> data = jsonData;
        for (Map<String, dynamic> item in data) {
          if (item.containsKey("name")) {
            if (item['name'] == name) {
              return data.indexOf(item);
            }
          }
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  int? getIndexFromId(Map<String, dynamic> jsonData, String id) {
    try {
      if (jsonData['success'] == true && jsonData.containsKey('data')) {
        List<dynamic> data = jsonData['data'];
        for (var item in data) {
          if (item['_id'] == id) {
            return data.indexOf(item);
          }
        }
        return null;
      } else {
        return null;
      }
    } catch (e, s) {
      return null;
    }
  }

  String? getIdFromNameValidateList(List<dynamic> jsonData, String name) {
    try {
      if (jsonData.isNotEmpty) {
        List<dynamic> data = jsonData;
        for (Map<String, dynamic> item in data) {
          if (item.containsKey("name")) {
            if (item['name'] == name) {
              return item['_id'];
            }
          } else if (item.containsKey("state")) {
            if (item["state"]?.containsKey("name")) {
              if (item["state"]['name'] == name) {
                return item['_id'];
              }
            }
          }
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  getAccountDetails() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  applyForVerification() async {
    await PreferenceManagerUtils.getToken().then((authtoken) {
      authToken = authtoken;
    });
    PreferenceManagerUtils.getIsPhoneVerified().then((isPhoneVerified) {
      PreferenceManagerUtils.getIsEmailVerified().then((isEmailVerified) async {
        print("sudfgj ");
        if (isPhoneVerified == true || isEmailVerified == true) {
          Map<String,dynamic>? verifiedData = await ref
              .read(accountServiceProvider)
              .applyForVerification(authtoken: authToken);
          if(verifiedData?["success"]==true){
            Navigator.pushAndRemoveUntil(
                Globals.navigatorKey
                    .currentContext!,
                PageTransition(
                    child: AfterBottomBar(),
                    type: PageTransitionType
                        .fade,
                    duration: const Duration(
                        milliseconds: 400)),
                    (Route<dynamic> route) =>
                false);
            ref
                .read(
                afterBottomBarControllerProvider(
                    startIndex: 0)
                    .notifier)
                .onItemTapped(2);
          }
        } else {
          try {
            Map<String, dynamic>? accountDetails = await ref
                .read(accountServiceProvider)
                .getAccountDetails(authtoken: authToken);

            if (accountDetails != null && accountDetails["data"] != null) {
              PreferenceManagerUtils.setIsPhoneVerified(accountDetails["data"]
                      ["accountId"]["isPhoneVerified"] ??
                  false);
              PreferenceManagerUtils.setIsEmailVerified(accountDetails["data"]
                      ["accountId"]["isEmailVerified"] ??
                  false);
              PreferenceManagerUtils.setIsProfileVerified(
                  accountDetails["data"]["accountId"]?["isVerified"] ?? false);
              if (accountDetails["data"]["accountId"]["isPhoneVerified"] ==
                      true &&
                  accountDetails["data"]["accountId"]["isEmailVerified"] ==
                      true) {
                Map<String,dynamic>? verifiedData = await ref
                    .read(accountServiceProvider)
                    .applyForVerification(authtoken: authToken);
                if(verifiedData?["success"]==true){
                  Navigator.pushAndRemoveUntil(
                      Globals.navigatorKey
                          .currentContext!,
                      PageTransition(
                          child: AfterBottomBar(),
                          type: PageTransitionType
                              .fade,
                          duration: const Duration(
                              milliseconds: 400)),
                          (Route<dynamic> route) =>
                      false);
                  ref
                      .read(
                      afterBottomBarControllerProvider(
                          startIndex: 0)
                          .notifier)
                      .onItemTapped(2);
                }
              } else {
                ref.read(dialogServiceProvider).singleButtonDialog(
                    titleText: "Verification is pending",
                    subtitleText:
                    "Please confirm your phone number and email to continue.",
                    onYesPressed: () {
                      Navigator.pop(Globals.navigatorKey.currentContext!);
                      commonNavigator(
                          context: Globals.navigatorKey.currentContext!,
                          child: RegistrationMobile(),
                          type: PageTransitionType.fade);
                    },
                    buttonText: 'Verify Now');
              }
            }else{
              DialogServiceV1().showSnackBar(
                  content: "Server Error Please Try Again.",
                  color: AppColors.black,
                  textclr: AppColors.white);
            }
          } catch (e, s) {
            DialogServiceV1().showSnackBar(
                content: "Server Error Please Try Again.",
                color: AppColors.black,
                textclr: AppColors.white);
          }
        }
      });
    });
  }

  onProfileImageTapped() async {
    await ref.read(dialogServiceProvider).commonImagePicker(
          picker: imagePicker,
          pickedImage: (file) {
            onImgSelect(
              val: file,
            );
            _imgUrl = file.path;
          },
        );
    await ref
        .read(personalDetailsServiceProvider)
        .createProfileImage(authtoken: authToken, image: _imgUrl);
  }
}
