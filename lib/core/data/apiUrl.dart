class APIUrl {
  // static const String BASE_URL = "http://localhost:3002";
  static const String BASE_URL = "http://192.168.1.4:3002/";
  static const String getAppQRStr = BASE_URL + "getAppDownloadLink";
  static const String getActivateQRStr = BASE_URL + "getTerminalActivateData";
  static const String internetHealthyCheck = BASE_URL + "internetHealthyCheck";
  static const String getRegisterStatus = BASE_URL + "getRegisterStatus";
  static const String deviceIsInitialized = BASE_URL + "deviceIsInitialized";
  static const String getLocalIPAddress = BASE_URL + "getLocalIPAddress";
  static const String getBleServiceName = BASE_URL + "getBleServiceName";

}