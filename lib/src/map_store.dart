import 'store.dart';

void mapLog(Map<String, dynamic> config) {
  if (config.containsKey('log')) {
    final logConfig = config['log'];
    if (logConfig != null) {
      if (logConfig.containsKey('disabled')) {
        LogCheckedStore.disabled = true;
        LogConfigStore.disabledSelected = logConfig['disabled'];
      } else {
        LogCheckedStore.disabled = false;
      }
      if (logConfig.containsKey('level')) {
        LogCheckedStore.level = true;
        LogConfigStore.levelDropdownValue = logConfig['level'];
      } else {
        LogCheckedStore.level = false;
      }
      if (logConfig.containsKey('output')) {
        LogCheckedStore.output = true;
        LogConfigStore.outputPath = logConfig['output'];
      } else {
        LogCheckedStore.output = false;
      }
      if (logConfig.containsKey('timestamp')) {
        LogCheckedStore.timestamp = true;
        LogConfigStore.timestampSelected = logConfig['timestamp'];
      } else {
        LogCheckedStore.timestamp = false;
      }
    }
  }
}

void mapNTP(Map<String, dynamic> config) {
  if (config.containsKey('ntp')) {
    final ntpConfig = config['ntp'];
    if (ntpConfig != null) {
      if (ntpConfig.containsKey('enabled')) {
        NTPCheckedStore.enabled = true;
        NTPConfigStore.enabledSelected = ntpConfig['enabled'];
      } else {
        NTPCheckedStore.enabled = false;
      }
      if (ntpConfig.containsKey('server')) {
        NTPCheckedStore.server = true;
        NTPConfigStore.serverAddress = ntpConfig['server'];
      } else {
        NTPCheckedStore.server = false;
      }
      if (ntpConfig.containsKey('server_port')) {
        NTPCheckedStore.serverPort = true;
        NTPConfigStore.serverPortInteger = ntpConfig['server_port'];
      } else {
        NTPCheckedStore.serverPort = false;
      }
      if (ntpConfig.containsKey('interval')) {
        NTPCheckedStore.interval = true;
        NTPConfigStore.interval = ntpConfig['interval'];
      } else {
        NTPCheckedStore.interval = false;
      }
    }
  }
}

void mapExperimental(Map<String, dynamic> config) {
  if (config.containsKey('experimental')) {
    final experimentalConfig = config['experimental'];
    if (experimentalConfig != null) {
      if (experimentalConfig.containsKey('cache_file')) {
        ExpConfigStore.cacheFile = true;
        final Map<String, dynamic> cfConfig = experimentalConfig['cache_file'];
        if (cfConfig.containsKey('enabled')) {
          CFCheckedStore.enabled = true;
          CFConfigStore.enabled = cfConfig['enabled'];
        } else {
          CFCheckedStore.enabled = false;
        }
        if (cfConfig.containsKey('path')) {
          CFCheckedStore.path = true;
          CFConfigStore.path = cfConfig['path'];
        } else {
          CFCheckedStore.path = false;
        }
        if (cfConfig.containsKey('cache_id')) {
          CFCheckedStore.cacheID = true;
          CFConfigStore.cacheID = cfConfig['cache_id'];
        } else {
          CFCheckedStore.cacheID = false;
        }
        if (cfConfig.containsKey('store_fakeip')) {
          CFCheckedStore.storeFakeIP = true;
          CFConfigStore.storeFakeIP = cfConfig['store_fakeip'];
        } else {
          CFCheckedStore.storeFakeIP = false;
        }
        if (cfConfig.containsKey('store_rdrc')) {
          CFCheckedStore.storeRDRC = true;
          CFConfigStore.storeRDRC = cfConfig['store_rdrc'];
        } else {
          CFCheckedStore.storeRDRC = false;
        }
        if (cfConfig.containsKey('rdrc_timeout')) {
          CFCheckedStore.rdrcTimeout = true;
          CFConfigStore.rdrcTimeout = cfConfig['rdrc_timeout'];
        } else {
          CFCheckedStore.rdrcTimeout = false;
        }
      } else {
        ExpConfigStore.cacheFile = false;
      }
      if (experimentalConfig.containsKey('cache_file')) {
        ExpConfigStore.clashAPI = true;
        final Map<String, dynamic> caConfig = experimentalConfig['clash_api'];
        if (caConfig.containsKey('external_controller')) {
          CACheckedStore.externalController = true;
          CAConfigStore.externalController = caConfig['external_controller'];
        } else {
          CACheckedStore.externalController = false;
        }
        if (caConfig.containsKey('external_ui')) {
          CACheckedStore.externalUI = true;
          CAConfigStore.externalUI = caConfig['external_ui'];
        } else {
          CACheckedStore.externalUI = false;
        }
        if (caConfig.containsKey('external_ui_download_url')) {
          CACheckedStore.externalUIDownloadURL = true;
          CAConfigStore.externalUIDownloadURL =
              caConfig['external_ui_download_url'];
        } else {
          CACheckedStore.externalUIDownloadURL = false;
        }
        if (caConfig.containsKey('external_ui_download_detour')) {
          CACheckedStore.externalUIDownloadDetour = true;
          CAConfigStore.externalUIDownloadDetour =
              caConfig['external_ui_download_detour'];
        } else {
          CACheckedStore.externalUIDownloadDetour = false;
        }
        if (caConfig.containsKey('secret')) {
          CACheckedStore.secret = true;
          CAConfigStore.secret = caConfig['secret'];
        } else {
          CACheckedStore.secret = false;
        }
        if (caConfig.containsKey('default_mode')) {
          CACheckedStore.defaultMode = true;
          CAConfigStore.defaultMode = caConfig['default_mode'];
        } else {
          CACheckedStore.defaultMode = false;
        }
      } else {
        ExpConfigStore.clashAPI = false;
      }
      if (experimentalConfig.containsKey('v2ray_api')) {
        ExpConfigStore.v2RayAPI = true;
        final Map<String, dynamic> vaConfig = experimentalConfig['v2ray_api'];
        if (vaConfig.containsKey('listen')) {
          VACheckedStore.listen = true;
          VAConfigStore.listen = vaConfig['listen'];
        } else {
          VACheckedStore.listen = false;
        }
        if (vaConfig.containsKey('enabled')) {
          VACheckedStore.statsEnabled = true;
          VAConfigStore.enabled = vaConfig['enabled'];
        } else {
          VACheckedStore.statsEnabled = false;
        }
        if (vaConfig.containsKey('inbounds')) {
          VACheckedStore.statsInbounds = true;
          VAConfigStore.inbounds = vaConfig['inbounds'];
        } else {
          VACheckedStore.statsInbounds = false;
        }
        if (vaConfig.containsKey('outbounds')) {
          VACheckedStore.statsOutbounds = true;
          VAConfigStore.outbounds = vaConfig['outbounds'];
        } else {
          VACheckedStore.statsOutbounds = false;
        }
        if (vaConfig.containsKey('users')) {
          VACheckedStore.statsUsers = true;
          VAConfigStore.users = vaConfig['users'];
        } else {
          VACheckedStore.statsUsers = false;
        }
      } else {
        ExpConfigStore.v2RayAPI = false;
      }
    }
  }
}

void mapDNS(Map<String, dynamic> config) {
  if (config.containsKey('dns')) {
    final dnsConfig = config['dns'];
    if (dnsConfig != null) {
      if (dnsConfig.containsKey('servers')) {
        DNSCheckedStore.servers = true;
        final List<dynamic> serverConfig = dnsConfig['servers'];
        for (final server in serverConfig) {
          var serverObject = DNSServerStore();
          if (server.containsKey('tag')) {
            serverObject.checkedTag = true;
            serverObject.tag = server['tag'];
          } else {
            serverObject.checkedTag = false;
          }
          if (server.containsKey('address')) {
            serverObject.checkedAddress = true;
            serverObject.address = server['address'];
          } else {
            serverObject.checkedAddress = false;
          }
          if (server.containsKey('address_resolver')) {
            serverObject.checkedAR = true;
            serverObject.addressResolver = server['address_resolver'];
          } else {
            serverObject.checkedAR = false;
          }
          if (server.containsKey('address_strategy')) {
            serverObject.checkedAS = true;
            serverObject.addressStrategy = server['address_strategy'];
          } else {
            serverObject.checkedAS = false;
          }
          if (server.containsKey('strategy')) {
            serverObject.checkedStrategy = true;
            serverObject.strategy = server['strategy'];
          } else {
            serverObject.checkedStrategy = false;
          }
          if (server.containsKey('detour')) {
            serverObject.checkedDetour = true;
            serverObject.detour = server['detour'];
          } else {
            serverObject.checkedDetour = false;
          }
          DNSServersStore.servers.add(serverObject);
        }
      } else {
        DNSCheckedStore.servers = false;
      }
      if (dnsConfig.containsKey('rules')) {
        DNSCheckedStore.rules = true;
        // rules are JSON stub only
        DNSRulesStore.rules.first.ruleJsonStub = dnsConfig['rules'].toString();
      } else {
        DNSCheckedStore.rules = false;
      }
      if (dnsConfig.containsKey('final')) {
        DNSCheckedStore.finalTag = true;
        DNSConfigStore.finalTag = dnsConfig['final'];
      } else {
        DNSCheckedStore.finalTag = false;
      }
      if (dnsConfig.containsKey('strategy')) {
        DNSCheckedStore.strategy = true;
        DNSConfigStore.strategyDropdownValue = dnsConfig['strategy'];
      } else {
        DNSCheckedStore.strategy = false;
      }
      if (dnsConfig.containsKey('disable_cache')) {
        DNSCheckedStore.disableCache = true;
        DNSConfigStore.disableCache = dnsConfig['disable_cache'];
      } else {
        DNSCheckedStore.disableCache = false;
      }
      if (dnsConfig.containsKey('disable_expire')) {
        DNSCheckedStore.disableExpire = true;
        DNSConfigStore.disableExpire = dnsConfig['disable_expire'];
      } else {
        DNSCheckedStore.disableExpire = false;
      }
      if (dnsConfig.containsKey('independent_cache')) {
        DNSCheckedStore.independentCache = true;
        DNSConfigStore.independentCache = dnsConfig['independent_cache'];
      } else {
        DNSCheckedStore.independentCache = false;
      }
      if (dnsConfig.containsKey('reverse_mapping')) {
        DNSCheckedStore.reverseMapping = true;
        DNSConfigStore.reverseMapping = dnsConfig['reverse_mapping'];
      } else {
        DNSCheckedStore.reverseMapping = false;
      }
      if (dnsConfig.containsKey('fakeip')) {
        DNSCheckedStore.fakeIP = true;
        final Map<String, dynamic> fakeIPConfig = dnsConfig['fakeip'];
        if (fakeIPConfig.containsKey('enabled')) {
          DNSFakeIPStore.enabled = fakeIPConfig['enabled'];
        }
        if (fakeIPConfig.containsKey('inet4_range')) {
          DNSFakeIPStore.inet4Range = fakeIPConfig['inet4_range'];
        }
        if (fakeIPConfig.containsKey('inet6_range')) {
          DNSFakeIPStore.inet6Range = fakeIPConfig['inet6_range'];
        }
      } else {
        DNSCheckedStore.fakeIP = false;
      }
    }
  }
}

void mapRoute(Map<String, dynamic> config) {
  if (config.containsKey('route')) {
    final routeConfig = config['route'];
    if (routeConfig != null) {
      if (routeConfig.containsKey('rules')) {
        RouteCheckedStore.rules = true;
        // route rules are JSON stub only
        RouteRulesStore.rules.first.ruleJsonStub =
            routeConfig['rules'].toString();
      } else {
        RouteCheckedStore.rules = false;
      }
      if (routeConfig.containsKey('rule_set')) {
        RouteCheckedStore.ruleSet = true;
        final List<dynamic> ruleSetsConfig =
            routeConfig['rule_set'];
        for (final ruleSet in ruleSetsConfig) {
          var ruleSetObject = RouteRuleSetStore();
          if (ruleSet.containsKey('type')) {
            ruleSetObject.type = ruleSet['type'];
          }
          if (ruleSet.containsKey('tag')) {
            ruleSetObject.tag = ruleSet['tag'];
          }
          if (ruleSet.containsKey('format')) {
            ruleSetObject.format = ruleSet['format'];
          }
          if (ruleSetObject.type == 'local') {
            ruleSetObject.checkedPath = true;
            ruleSetObject.checkedURL = false;
            ruleSetObject.checkedDowDet = false;
            ruleSetObject.checkedUpdInv = false;
            if (ruleSet.containsKey('path')) {
              ruleSetObject.path = ruleSet['path'];
            }
          }
          if (ruleSetObject.type == 'remote') {
            ruleSetObject.checkedPath = false;
            ruleSetObject.checkedURL = true;
            ruleSetObject.checkedDowDet = false;
            ruleSetObject.checkedUpdInv = false;
            if (ruleSet.containsKey('url')) {
              ruleSetObject.url = ruleSet['url'];
            }
            if (ruleSet.containsKey('download_detour')) {
              ruleSetObject.checkedDowDet = true;
              ruleSetObject.downloadDetour = ruleSet['download_detour'];
            }
            if (ruleSet.containsKey('update_interval')) {
              ruleSetObject.checkedUpdInv = true;
              ruleSetObject.updateInterval = ruleSet['update_interval'];
            }
          }
          RouteRuleSetsStore.ruleSet.add(ruleSetObject);
        }
      } else {
        RouteCheckedStore.ruleSet = false;
      }
      if (routeConfig.containsKey('final')) {
        RouteCheckedStore.finalTag = true;
        RouteConfigStore.finalTag = routeConfig['final'];
      } else {
        RouteCheckedStore.finalTag = false;
      }
      if (routeConfig.containsKey('auto_detect_interface')) {
        RouteCheckedStore.autoDetectInterface = true;
        RouteConfigStore.autoDetectInterface =
            routeConfig['auto_detect_interface'];
      } else {
        RouteCheckedStore.autoDetectInterface = false;
      }
      if (routeConfig.containsKey('override_android_vpn')) {
        RouteCheckedStore.overrideAndroidVPN = true;
        RouteConfigStore.overrideAndroidVPN =
            routeConfig['override_android_vpn'];
      } else {
        RouteCheckedStore.overrideAndroidVPN = false;
      }
      if (routeConfig.containsKey('default_interface')) {
        RouteCheckedStore.defaultInterface = true;
        RouteConfigStore.defaultInterface = routeConfig['default_interface'];
      } else {
        RouteCheckedStore.defaultInterface = false;
      }
      if (routeConfig.containsKey('default_mark')) {
        RouteCheckedStore.defaultMark = true;
        RouteConfigStore.defaultMark = routeConfig['default_mark'];
      } else {
        RouteCheckedStore.defaultMark = false;
      }
    }
  }
}

void loadConfig(Map<String, dynamic> config) {
  mapLog(config);
  mapNTP(config);
  mapExperimental(config);
  mapDNS(config);
  mapRoute(config);
}
