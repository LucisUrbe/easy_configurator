class ConfigStore {
  static bool checkedDisabled = true;
  static bool checkedLevel = true;
  static bool checkedOutput = false;
  static bool checkedTimestamp = true;

  static bool disabledSelected = false;
  static List<String> disabledList = <String>['false', 'true'];
  static String disabledDropdownValue = 'false';

  static List<String> levelList = <String>[
    'trace',
    'debug',
    'info',
    'warn',
    'error',
    'fatal',
    'panic',
  ];
  static String levelDropdownValue = 'info';

  static bool outputSelected = false;
  static String outputPath = 'box.log';

  static bool timestampSelected = true;
  static List<String> timestampList = <String>['true', 'false'];
  static String timestampDropdownValue = 'true';

  static bool checkedEnabled = true;
  static bool checkedServer = false;
  static bool checkedServerPort = false;
  static bool checkedInterval = false;

  static bool enabledSelected = false;
  static List<String> enabledList = <String>['false', 'true'];
  static String enabledDropdownValue = 'false';

  static String serverAddress = 'time.apple.com';
  static String serverPort = '123';
  static int serverPortInteger = 123;
  static String interval = '30m';

  static bool checkedCacheFile = false;
  static bool checkedClashAPI = false;
  static bool checkedV2RayAPI = false;
}