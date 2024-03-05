import 'store.dart';

Map<String, dynamic> logMap() {
  return {
    if (LogCheckedStore.disabled) 'disabled': LogConfigStore.disabledSelected,
    if (LogCheckedStore.level) 'level': LogConfigStore.levelDropdownValue,
    if (LogCheckedStore.output) 'output': LogConfigStore.outputPath,
    if (LogCheckedStore.timestamp)
      'timestamp': LogConfigStore.timestampSelected,
  };
}

Map<String, dynamic> ntpMap() {
  return {
    if (NTPCheckedStore.enabled) 'enabled': NTPConfigStore.enabledSelected,
    if (NTPCheckedStore.server) 'server': NTPConfigStore.serverAddress,
    if (NTPCheckedStore.serverPort)
      'server_port': NTPConfigStore.serverPortInteger,
    if (NTPCheckedStore.interval) 'interval': NTPConfigStore.interval,
  };
}

Map<String, dynamic> experimentalMap() {
  return {
    if (ExpConfigStore.cacheFile) 'cache_file': {},
    if (ExpConfigStore.clashAPI) 'clash_api': {},
    if (ExpConfigStore.v2RayAPI) 'v2ray_api': {},
  };
}

Map<String, dynamic> cacheFileMap() {
  return {
    if (CFCheckedStore.enabled) 'enabled': CFConfigStore.enabled,
    if (CFCheckedStore.path) 'path': CFConfigStore.path,
    if (CFCheckedStore.cacheID) 'cache_id': CFConfigStore.cacheID,
    if (CFCheckedStore.storeFakeIP) 'store_fakeip': CFConfigStore.storeFakeIP,
    if (CFCheckedStore.storeRDRC) 'store_rdrc': CFConfigStore.storeRDRC,
    if (CFCheckedStore.rdrcTimeout) 'rdrc_timeout': CFConfigStore.rdrcTimeout,
  };
}

Map<String, dynamic> clashAPIMap() {
  return {
    if (CACheckedStore.externalController)
      'external_controller': CAConfigStore.externalController,
    if (CACheckedStore.externalUI) 'external_ui': CAConfigStore.externalUI,
    if (CACheckedStore.externalUIDownloadURL)
      'external_ui_download_url': CAConfigStore.externalUIDownloadURL,
    if (CACheckedStore.externalUIDownloadDetour)
      'external_ui_download_detour': CAConfigStore.externalUIDownloadDetour,
    if (CACheckedStore.secret) 'secret': CAConfigStore.secret,
    if (CACheckedStore.defaultMode) 'default_mode': CAConfigStore.defaultMode,
  };
}

Map<String, dynamic> dnsMap() {
  return {
    if (DNSCheckedStore.servers) 'servers': [],
    if (DNSCheckedStore.rules) 'rules': [],
    if (DNSCheckedStore.finalTag) 'final': DNSConfigStore.finalTag,
    if (DNSCheckedStore.strategy)
      'strategy': DNSConfigStore.strategyDropdownValue,
    if (DNSCheckedStore.disableCache)
      'disable_cache': DNSConfigStore.disableCache,
    if (DNSCheckedStore.disableExpire)
      'disable_expire': DNSConfigStore.disableExpire,
    if (DNSCheckedStore.independentCache)
      'independent_cache': DNSConfigStore.independentCache,
    if (DNSCheckedStore.reverseMapping)
      'reverse_mapping': DNSConfigStore.reverseMapping,
    if (DNSCheckedStore.fakeIP) 'fakeip': {},
  };
}

Map<String, dynamic> dnsServerMap(DNSServerStore server) {
  return {
    if (server.checkedTag) 'tag': server.tag,
    if (server.checkedAddress) 'address': server.address,
    if (server.checkedAR) 'address_resolver': server.addressResolver,
    if (server.checkedAS) 'address_strategy': server.addressStrategy,
    if (server.checkedStrategy) 'strategy': server.strategy,
    if (server.checkedDetour) 'detour': server.detour,
  };
}

Map<String, dynamic> buildConfig() {
  Map<String, dynamic> config = {};
  final logMapObject = logMap();
  if (logMapObject.isNotEmpty) {
    config.addAll({
      "log": logMapObject,
    });
  }
  final ntpMapObject = ntpMap();
  if (ntpMapObject.isNotEmpty) {
    config.addAll({
      "ntp": ntpMapObject,
    });
  }
  final experimentalMapObject = experimentalMap();
  if (experimentalMapObject.isNotEmpty) {
    config.addAll({
      "experimental": experimentalMapObject,
    });
  }
  final cacheFileMapObject = cacheFileMap();
  if (cacheFileMapObject.isNotEmpty && ExpConfigStore.cacheFile) {
    config["experimental"].addAll({
        "cache_file": cacheFileMapObject,
    });
  }
  final clashAPIMapObject = clashAPIMap();
  if (clashAPIMapObject.isNotEmpty && ExpConfigStore.clashAPI) {
    config["experimental"].addAll({
      "clash_api": clashAPIMapObject,
    });
  }
  final dnsMapObject = dnsMap();
  if (dnsMapObject.isNotEmpty) {
    config.addAll({
      "dns": dnsMapObject,
    });
  }
  return config;
}
