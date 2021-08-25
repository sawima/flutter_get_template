class APIUrl {
  static const String BASE_URL = "http://localhost:3002";
  // static const String BASE_URL = "https://api.kimacloud.com/pre";
  // static const String BASE_URL = "http://localhost:3000/test";

  static const String getAppQRStr = BASE_URL + "/getAppDownloadLink";
  static const String getActivateQRStr = BASE_URL + "/getTerminalActivateData";
  static const String internetHealthyCheck = BASE_URL + "/internetHealthyCheck";
  static const String getRegisterStatus = BASE_URL + "/getRegisterStatus";

  // static const String mobileVerifylogin = BASE_URL + "/mobileVerifylogin";
  // static const String newOrg = BASE_URL + "/newOrg";
  //
  // static const String getFullUserInfo = BASE_URL + "/getFullUserInfo";
  //
  //
  // static const String setPassword = BASE_URL + "/setPassword";
  // static const String updateUserProfile = BASE_URL + "/updateUserProfile";
  // static const String mobilepasswdlogin = BASE_URL + "/mobilepasswdlogin";
  // static const String findUserByMobile = BASE_URL + "/findUserByMobile";
  // static const String getListDevicesOfOrg = BASE_URL + "/getDevicesByOrg";
  //
  // //device
  // static const String activateDevice = BASE_URL + "/activateDevice";

}