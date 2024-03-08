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
  static String path = 'cache.db';
  static String cacheID = '';
  static bool storeFakeIP = false;
  static bool storeRDRC = false;
  static String rdrcTimeout = '7d';
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
  static bool externalController = false;
  static bool externalUI = false;
  static bool externalUIDownloadURL = false;
  static bool externalUIDownloadDetour = false;
  static bool secret = false;
  static bool defaultMode = false;
}

class CAConfigStore {
  static String externalController = '127.0.0.1:9090';
  static String externalUI = '';
  static String externalUIDownloadURL =
      'https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip';
  static String externalUIDownloadDetour = '';
  static String secret = '';
  static String defaultMode = 'Rule';
}

class DNSCheckedStore {
  static bool servers = true;
  static bool rules = true;
  static bool finalTag = false;
  static bool strategy = false;
  static bool disableCache = false;
  static bool disableExpire = false;
  static bool independentCache = false;
  static bool reverseMapping = false;
  static bool fakeIP = false;
}

class DNSConfigStore {
  static String finalTag = '';
  static String strategyDropdownValue = 'prefer_ipv4';
  static bool disableCache = false;
  static bool disableExpire = false;
  static bool independentCache = false;
  static bool reverseMapping = false;
}

class DNSSelectionStore {
  static List<String> strategyList = <String>[
    'prefer_ipv4',
    'prefer_ipv6',
    'ipv4_only',
    'ipv6_only'
  ];
  static List<String> disableCacheList = <String>['false', 'true'];
  static String disableCacheDropdownValue = 'false';
  static List<String> disableExpireList = <String>['false', 'true'];
  static String disableExpireDropdownValue = 'false';
  static List<String> independentList = <String>['false', 'true'];
  static String independentDropdownValue = 'false';
  static List<String> revMapList = <String>['false', 'true'];
  static String revMapDropdownValue = 'false';
}

class DNSServerStore {
  bool checkedTag = true;
  bool checkedAddress = true;
  bool checkedAR = false;
  bool checkedAS = false;
  bool checkedStrategy = false;
  bool checkedDetour = false;
  final List<String> strategyList = <String>[
    'prefer_ipv4',
    'prefer_ipv6',
    'ipv4_only',
    'ipv6_only'
  ];
  String tag = '';
  String address = '';
  String addressResolver = '';
  String addressStrategy = 'prefer_ipv4';
  String strategy = 'prefer_ipv4';
  String detour = '';
}

class DNSServersStore {
  static List<DNSServerStore> servers = [];
}

class DNSRuleStore {
  String ruleJsonStub = '';
}

class DNSRulesStore {
  static List<DNSRuleStore> rules = [
    DNSRuleStore(),
  ];
}

class DNSFakeIPStore {
  static List<String> enabledList = <String>['false', 'true'];
  static String enabledDropdownValue = 'false';
  static bool enabled = false;
  static String inet4Range = '198.18.0.0/15';
  static String inet6Range = 'fc00::/18';
}

class RouteCheckedStore {
  static bool rules = true;
  static bool ruleSet = false;
  static bool finalTag = false;
  static bool autoDetectInterface = false;
  static bool overrideAndroidVPN = false;
  static bool defaultInterface = false;
  static bool defaultMark = false;
}

class RouteConfigStore {
  static String finalTag = '';
  static bool autoDetectInterface = false;
  static bool overrideAndroidVPN = false;
  static String defaultInterface = 'en0';
  static int defaultMark = 233;
}

class RouteSelectionStore {
  static List<String> autoDIList = <String>['false', 'true'];
  static String autoDIDropdownValue = 'false';
  static List<String> overrideAVPNList = <String>['false', 'true'];
  static String overrideAVPNDropdownValue = 'false';
  static String defaultMark = '123';
}

class RouteRuleSetStore {
  bool checkedPath = true;
  bool checkedURL = false;
  bool checkedDowDet = false;
  bool checkedUpdInv = false;
  final List<String> typeList = <String>['local', 'remote'];
  final List<String> formatList = <String>['source', 'binary'];
  String type = 'local';
  String tag = '';
  String format = 'source';
  String path = '';
  String url = '';
  String downloadDetour = '';
  String updateInterval = '1d';
}

class RouteRuleSetsStore {
  static List<RouteRuleSetStore> ruleSet = [];
}
