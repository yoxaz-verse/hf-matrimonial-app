class ApiConfig {
  ApiConfig._();

  static const String scheme = "http://";
  // static const String scheme = "https://";
  static const String host = "51.20.248.54:5000/";
  // static const String host = "7b9a-2409-40d1-1008-3853-d8c2-4cbd-a634-eb13.ngrok-free.app/";
  //     "a442-2401-4900-1cde-82bc-6d34-50d9-3179-8f71.ngrok-free.app/";
  // https://0ef4-2409-40d1-1a-1cc0-280d-5d2c-9a10-5dfc.ngrok-free.app/
  // https://cb36-103-211-15-150.ngrok-free.app/
  static const String mainUrl = scheme + host;
  static const String user = "user";
  static const String account = "account";
  static const String otp = "otp";
  static const String location = "location";
  static const String state = "state";
  static const String country = "country";
  static const String education = "education";
  static const String employmentType = "employment-type";
  static const String gender = "gender";
  static const String martialStatus = "martial-status";
  static const String college = "college";
  static const String occupation = "occupation";
  static const String physicalStatus = "physical-status";
  static const String denomination = "denomination";
  static const String church = "church";
  static const String religion = "religion";
  static const String family = "family";
  static const String personal = "personal";
  static const String rec = "rec";
  static const String partner = "partner";
  static const String subscription = "subscription";
  static const String addOnView = "add-on-view";
  static const String addOnInterest = "add-on-interest";
  static const String addOnSlot = "add-on-slot";
  static const String enquire = "enquire";
  static const String notification = "notification/";
  static const String interest = "interest";
  static const String sendInterest = "interest-sended";
  static const String receivedInterest = "interest-received";
  static const String offer = "offer";
  static const String aboutUs = "about-us";
  static const String carousel = "carousel";
  static const String testimony = "testimony";
  static const String blog = "blog";
  static const String accountId = "?accountId=";
  static const String login = "/login";
  static const String logOut = "/logout";
  static const String social = "/social";
  static const String password = "/password";
  static const String forgot = "/forgot";
  static const String create = "/create";
  static const String verify = "/verify";
  static const String all = "/all";
  static const String detail = "detail";
  static const String preference = "/preference";
  static const String new1 = "/new";
  static const String matches = "/matches";
  static const String address = "/address";
  static const String payment = "payment";
  static const String assigned = "/assigned";
  static const String closed = "/closed";
  static const String active = "/active";
  static const String userSubscription = "user-subscription";
  static const String userAddOnView = "user-add-on-view";
  static const String userAddonInterest = "user-add-on-interest";
  static const String userAddOnSlot = "user-add-on-slot";
  static const String userWorkingSubscription =
      "user-working-subscription-accountId";

  /// Account

  static const String createAndDeleteAccount = mainUrl + account;
  static const String profileVerification = "${mainUrl}profile/verification";
  static const String loginAccount = mainUrl + account + login;
  static const String logOutAccount = mainUrl + account + logOut;
  static const String createSocialAccount = mainUrl + account + social;
  static const String getAccountDetails = mainUrl + userWorkingSubscription;
  static const String getAllAccountDetailsByLogin = "${mainUrl}detail/account";
  static const String signupSocialAccount = mainUrl + account + social;
  static const String loginSocialAccount = mainUrl + account + social + login;
  static const String updatePassword = mainUrl + account + password;
  static const String forgotPassword = mainUrl + account + forgot + password;

  /// Otp

  static const String createOtp = mainUrl + otp + create;
  static const String verifyOtp = mainUrl + otp + verify;

  static const String createForgotPasswordOtp =
      mainUrl + otp + create + forgot + password;
  static const String verifyForgotPasswordOtp =
      mainUrl + otp + verify + forgot + password;

  /// Location

  static const String getAllLocation = mainUrl + location + all;
  static const String createLocation = mainUrl + location;

  /// Get All Country

  static const String getAllCountry = mainUrl + country + all;

  /// Get All States

  static const String getAllStates = mainUrl + state + all;

  /// Get All State By Country ID

  static const String getAllStateByCountryId =
      "$mainUrl$state/$country?$country=";

  /// Get All denomination By religion ID

  static const String getAllDenominationByReligionId =
      "$mainUrl$denomination$religion?$religion=";

  /// Education

  static const String getAllEducation = mainUrl + education + all;

  /// Employment Type

  static const String getAllEmploymentType = mainUrl + employmentType + all;

  /// Gender

  static const String getAllGender = mainUrl + gender + all;

  /// Marital Status

  static const String getAllMartialStatus = mainUrl + martialStatus + all;

  /// College

  static const String getAllCollege = mainUrl + college + all;

  /// Occupation

  static const String getAllOccupation = mainUrl + occupation + all;

  /// Physical Status

  static const String getAllPhysicalStatus = mainUrl + physicalStatus + all;

  /// Denomination Status

  static const String getAllDenomination = mainUrl + denomination + all;
  static const String getDenominationByReligion =
      "$mainUrl$denomination/$religion";

  /// church
  static const String getAllChurch = mainUrl + church + all;

  /// Religion

  static const String getAllReligion = mainUrl + religion + all;

  /// Family Details

  static const String createUpdateFamilyDetails = "$mainUrl$family/$detail";
  static const String getFamilyDetailsByAccount =
      "$mainUrl$family/$detail/$account";

  /// Personal Details

  static const String createUpdatePersonalDetails =
      "${mainUrl}app/$personal/$detail";
  static const String getPersonalDetailsByAccount =
      "$mainUrl$personal/$detail/$account";
  static const String addProfileImage = "${mainUrl}app/personal/detail/profile";
  static const String addPersonalDetailImages =
      "${mainUrl}app/personal/detail/image";

  /// REC Details

  static const String createUpdateRECDetails = "$mainUrl$rec/$detail";
  static const String getRECDetailsByAccount = "$mainUrl$rec/$detail/$account";

  /// Partner Preferences

  static const String createUpdatePartnerPreferences =
      mainUrl + partner + preference;
  static const String getPartnerPreferencesByAccount =
      "$mainUrl$partner$preference/$account";

  /// Subscription Plan

  static const String getAllSubscription = mainUrl + subscription;

  /// Add on Views

  static const String createGetUpdateAddOnView = mainUrl + addOnView;

  /// Add on Interest

  static const String createGetUpdateAddOnInterest = mainUrl + addOnInterest;

  /// Add on Slot

  static const String createGetUpdateAddOnSlot = mainUrl + addOnSlot;

  /// Enquires

  static const String createEnquire = mainUrl + enquire;
  static const String assignedEnquire = mainUrl + enquire + assigned;
  static const String activeEnquire = mainUrl + enquire + active;
  static const String closedEnquire = mainUrl + enquire + closed;

  /// Notification

  static const String createAndUpdateNotification = mainUrl + notification;
  static const String getNotificationByAccount =
      mainUrl + notification + account;

  /// Interest

  static const String createInterest = mainUrl + interest;
  static const String getSendedInterest = mainUrl + sendInterest;
  static const String getReceivedInterest = mainUrl + receivedInterest;

  /// Offer

  static const String getOffer = mainUrl + offer;

  /// About Us

  static const String getAboutUs = mainUrl + aboutUs;
  static const String getAboutUsByTitle =
      "$mainUrl$aboutUs-title?title=about US";

  /// Carousel

  static const String getCarousel = mainUrl + carousel;

  /// Testimony

  static const String getTestimony = mainUrl + testimony;

  /// Blog

  static const String getBlog = mainUrl + blog;

  /// Address

  static const String createAndUpdateAddress = mainUrl + address;
  static const String getAllAddress = mainUrl + address + all;

  /// Payment

  static const String createAndConfirmPayment = mainUrl + payment;
  static const String getPaymentKey = "$mainUrl$payment/key";
  static const String getPaymentByAccount = mainUrl + payment + account;

  /// Subscribed user

  static const String createAndUpdateUserSubscription =
      mainUrl + userSubscription;
  static const String userSubscriptionByLogin =
      "${mainUrl}user-working-subscription-accountId";

  /// User
  static const String getAllUserCards = scheme + host + detail;
  static const String createAndUpdateUser = mainUrl + user;
  static const String getAllUser = mainUrl + user + all;

  /// User Add on interest
  static const String createAndUpdateUserAddOnInterest =
      mainUrl + userAddonInterest;

  /// User Add on slot
  static const String createAndUpdateUserAddOnSlot = mainUrl + userAddOnSlot;

  /// User Add on views
  static const String createAndUpdateUserAddOnView = mainUrl + userAddOnView;

  /// Details

  static const String getDetail = mainUrl + detail;

  static const String getDetailNewMatches =
      mainUrl + detail + preference + new1 + matches;
  static const String getDetailMatchingMembers = mainUrl + detail + preference;
  static const String getDetailByAccountId =
      "${mainUrl}detail/$account/view$accountId";

  static const String getDetailByAllParametersAndSearch =
      "${mainUrl}detail/preference/search?";
}
