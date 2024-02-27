class LogCheckedStore {
  static bool disabled = true;
  static bool level = true;
  static bool output = false;
  static bool timestamp = true;
}

class LogConfigStore {
  static bool disabledSelected = false;
  static String levelDropdownValue = 'info';
  static String outputPath = 'box.log';
  static bool timestampSelected = true;
}

class LogSelectionStore {
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
  static List<String> timestampList = <String>['true', 'false'];
  static String timestampDropdownValue = 'true';
}

class NTPCheckedStore {
  static bool enabled = true;
  static bool server = false;
  static bool serverPort = false;
  static bool interval = false;
}

class NTPConfigStore {
  static bool enabledSelected = false;
  static String serverAddress = 'time.apple.com';
  static int serverPortInteger = 123;
  static String interval = '30m';
}

class NTPSelectionStore {
  static List<String> enabledList = <String>['false', 'true'];
  static String enabledDropdownValue = 'false';
  static String serverPort = '123';
}

class ExpConfigStore {
  // Here, "exp" means "experimental".
  static bool cacheFile = false;
  static bool clashAPI = false;
  static bool v2RayAPI = false;
}

class CFCheckedStore {
  // Here, "CF" means "cache file".
  static bool enabled = true;
  static bool path = false;
  static bool cacheID = false;
  static bool storeFakeIP = true;
  static bool storeRDRC = true;
  static bool rdrcTimeout = false;
}

class CFConfigStore {
  static bool enabled = true;
  static String path = "cache.db";
  static String cacheID = "";
  static bool storeFakeIP = false;
  static bool storeRDRC = false;
  static String rdrcTimeout = "7d";
}

class CFSelectionStore {
  static List<String> enabledList = <String>['true', 'false'];
  static String enabledDropdownValue = 'true';
  static List<String> storeFakeIPList = <String>['false', 'true'];
  static String storeFakeIPDropdownValue = 'false';
  static List<String> storeRDRCList = <String>['false', 'true'];
  static String storeRDRCDropdownValue = 'false';
}

class CACheckedStore {
  bool externalController = false;
  bool externalUI = false;
  bool externalUIDownloadURL = false;
  bool externalUIDownloadDetour = false;
  bool secret = false;
  bool defaultMode = false;
}

class CAConfigStore {
  String externalController = "127.0.0.1:9090";
  String externalUI = "";
  String externalUIDownloadURL =
      "https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip";
  String externalUIDownloadDetour = "";
  String secret = "";
  String defaultMode = "Rule";
}
