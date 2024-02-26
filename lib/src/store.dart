class ConfigStore {
  static bool logCheckedDisabled = true;
  static bool logCheckedLevel = true;
  static bool logCheckedOutput = false;
  static bool logCheckedTimestamp = true;

  static bool logDisabledSelected = false;
  static List<String> logDisabledList = <String>['false', 'true'];
  static String logDisabledDropdownValue = 'false';

  static List<String> logLevelList = <String>[
    'trace',
    'debug',
    'info',
    'warn',
    'error',
    'fatal',
    'panic',
  ];
  static String logLevelDropdownValue = 'info';

  static bool logOutputSelected = false;
  static String logOutputPath = 'box.log';

  static bool logTimestampSelected = true;
  static List<String> logTimestampList = <String>['true', 'false'];
  static String logTimestampDropdownValue = 'true';

  static bool ntpCheckedEnabled = true;
  static bool ntpCheckedServer = false;
  static bool ntpCheckedServerPort = false;
  static bool ntpCheckedInterval = false;

  static bool ntpEnabledSelected = false;
  static List<String> ntpEnabledList = <String>['false', 'true'];
  static String ntpEnabledDropdownValue = 'false';

  static String ntpServerAddress = 'time.apple.com';
  static String ntpServerPort = '123';
  static int ntpServerPortInteger = 123;
  static String ntpInterval = '30m';

  // Here, "exp" means "experimental".
  static bool expCheckedCacheFile = false;
  static bool expCheckedClashAPI = false;
  static bool expCheckedV2RayAPI = false;

  // Here, "cf" means "cache file".
  static bool cfCheckedEnabled = true;
  static bool cfCheckedPath = false;
  static bool cfCheckedCacheID = false;
  static bool cfCheckedStoreFakeIP = true;
  static bool cfCheckedStoreRDRC = true;
  static bool cfCheckedRDRCTimeout = false;

  static bool cfEnabled = true;
  static List<String> cfEnabledList = <String>['true', 'false'];
  static String cfEnabledDropdownValue = 'true';
  static String cfPath = "cache.db";
  static String cfCacheID = "";
  static bool cfStoreFakeIP = false;
  static List<String> cfStoreFakeIPList = <String>['false', 'true'];
  static String cfStoreFakeIPDropdownValue = 'false';
  static bool cfStoreRDRC = false;
  static List<String> cfStoreRDRCList = <String>['false', 'true'];
  static String cfStoreRDRCDropdownValue = 'false';
  static String cfRDRCTimeout = "7d";
}