import 'dart:convert';

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

Map<String, dynamic> v2RayMap() {
  return {
    if (VACheckedStore.listen) 'listen': VAConfigStore.listen,
    "stats": {
      if (VACheckedStore.statsEnabled) 'enabled': VAConfigStore.enabled,
      if (VACheckedStore.statsInbounds) 'inbounds': VAConfigStore.inbounds,
      if (VACheckedStore.statsOutbounds) 'outbounds': VAConfigStore.outbounds,
      if (VACheckedStore.statsUsers) 'users': VAConfigStore.users,
    },
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

Map<String, dynamic> dnsFakeIPMap() {
  return {
    if (DNSCheckedStore.fakeIP) 'enabled': DNSFakeIPStore.enabled,
    if (DNSCheckedStore.fakeIP) 'inet4_range': DNSFakeIPStore.inet4Range,
    if (DNSCheckedStore.fakeIP) 'inet6_range': DNSFakeIPStore.inet6Range,
  };
}

Map<String, dynamic> routeMap() {
  return {
    if (RouteCheckedStore.rules) 'rules': [],
    if (RouteCheckedStore.ruleSet) 'rule_set': [],
    if (RouteCheckedStore.finalTag) 'final': RouteConfigStore.finalTag,
    if (RouteCheckedStore.autoDetectInterface)
      'auto_detect_interface': RouteConfigStore.autoDetectInterface,
    if (RouteCheckedStore.overrideAndroidVPN)
      'override_android_vpn': RouteConfigStore.overrideAndroidVPN,
    if (RouteCheckedStore.defaultInterface)
      'default_interface': RouteConfigStore.defaultInterface,
    if (RouteCheckedStore.defaultMark)
      'default_mark': RouteConfigStore.defaultMark,
  };
}

Map<String, dynamic> routeRuleSetMap(RouteRuleSetStore ruleSet) {
  return {
    'type': ruleSet.type,
    'tag': ruleSet.tag,
    'format': ruleSet.format,
    if (ruleSet.checkedPath) 'path': ruleSet.path,
    if (ruleSet.checkedURL) 'url': ruleSet.url,
    if (ruleSet.checkedDowDet) 'download_detour': ruleSet.downloadDetour,
    if (ruleSet.checkedUpdInv) 'update_interval': ruleSet.updateInterval,
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
  // The code below is a submodule of experimental.
  final cacheFileMapObject = cacheFileMap();
  if (cacheFileMapObject.isNotEmpty && ExpConfigStore.cacheFile) {
    config["experimental"].addAll({
      "cache_file": cacheFileMapObject,
    });
  }
  // The code below is a submodule of experimental.
  final clashAPIMapObject = clashAPIMap();
  if (clashAPIMapObject.isNotEmpty && ExpConfigStore.clashAPI) {
    config["experimental"].addAll({
      "clash_api": clashAPIMapObject,
    });
  }
  // The code below is a submodule of experimental.
  final v2RayMapObject = v2RayMap();
  if (v2RayMapObject.isNotEmpty && ExpConfigStore.v2RayAPI) {
    config["experimental"].addAll({
      "v2ray_api": v2RayMapObject,
    });
  }
  final dnsMapObject = dnsMap();
  if (dnsMapObject.isNotEmpty) {
    config.addAll({
      "dns": dnsMapObject,
    });
  }
  // The code below is a submodule of DNS.
  if (DNSServersStore.servers.isNotEmpty && DNSCheckedStore.servers) {
    for (final server in DNSServersStore.servers) {
      final dnsServerObject = dnsServerMap(server);
      config["dns"]["servers"].add(dnsServerObject);
    }
  }
  // The code below is a submodule of DNS.
  if (DNSRulesStore.rules.first.ruleJsonStub.isNotEmpty &&
      DNSCheckedStore.rules) {
    config["dns"]["rules"] = jsonDecode(DNSRulesStore.rules.first.ruleJsonStub);
  }
  // The code below is a submodule of DNS.
  final dnsFakeIPMapObject = dnsFakeIPMap();
  if (dnsFakeIPMapObject.isNotEmpty && DNSCheckedStore.fakeIP) {
    config["dns"]["fakeip"] = dnsFakeIPMapObject;
  }
  final routeMapObject = routeMap();
  if (routeMapObject.isNotEmpty) {
    config.addAll({
      "route": routeMapObject,
    });
  }
  // The code below is a submodule of route.
  if (RouteRuleSetsStore.ruleSet.isNotEmpty && RouteCheckedStore.ruleSet) {
    for (final ruleSet in RouteRuleSetsStore.ruleSet) {
      final ruleSetObject = routeRuleSetMap(ruleSet);
      config["route"]["rule_set"].add(ruleSetObject);
    }
  }
  // The code below is a submodule of route.
  if (RouteRulesStore.rules.first.ruleJsonStub.isNotEmpty &&
      RouteCheckedStore.rules) {
    config["route"]["rules"] =
        jsonDecode(RouteRulesStore.rules.first.ruleJsonStub);
  }
  if (InboundsStore.inbounds.first.inboundJsonStub.isNotEmpty) {
    config.addAll({
      "inbounds": jsonDecode(InboundsStore.inbounds.first.inboundJsonStub),
    });
  }
  if (OutboundsStore.outbounds.first.outboundJsonStub.isNotEmpty) {
    config.addAll({
      "outbounds": jsonDecode(OutboundsStore.outbounds.first.outboundJsonStub),
    });
  }
  return config;
}
