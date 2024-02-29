import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';

class DNSTabWidget extends StatefulWidget {
  const DNSTabWidget({super.key});

  @override
  State<DNSTabWidget> createState() => _DNSTabWidgetState();
}

class _DNSTabWidgetState extends State<DNSTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      // appBar: AppBar(title: const Text('Log')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.servers,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.servers = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServers,
                style: const TextStyle(color: white),
              ),
            ),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.rules,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.rules = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsRules,
                style: const TextStyle(color: white),
              ),
            ),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.finalTag,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.finalTag = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsFinal,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsFinalSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSCheckedStore.finalTag
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: DNSConfigStore.finalTag,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.dnsFinalHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSConfigStore.finalTag = inputString;
                            });
                          },
                        ),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.strategy,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.strategy = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsStrategy,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsStrategySubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSCheckedStore.strategy
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: DNSConfigStore.strategyDropdownValue,
                          items: DNSSelectionStore.strategyList
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: white),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedValue) {
                            setState(() {
                              DNSConfigStore.strategyDropdownValue =
                                  selectedValue!;
                            });
                          },
                        ),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.disableCache,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.disableCache = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsDisableCache,
                style: const TextStyle(color: white),
              ),
            ),
            DNSCheckedStore.disableCache
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: DNSSelectionStore.disableCacheDropdownValue,
                            items: DNSSelectionStore.disableCacheList
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              if (selectedValue == 'false') {
                                setState(() {
                                  DNSConfigStore.disableCache = false;
                                  DNSSelectionStore.disableCacheDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  DNSConfigStore.disableCache = true;
                                  DNSSelectionStore.disableCacheDropdownValue =
                                      selectedValue!;
                                });
                              }
                            }),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.disableExpire,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.disableExpire = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsDisableExpire,
                style: const TextStyle(color: white),
              ),
            ),
            DNSCheckedStore.disableExpire
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: DNSSelectionStore.disableExpireDropdownValue,
                            items: DNSSelectionStore.disableExpireList
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              if (selectedValue == 'false') {
                                setState(() {
                                  DNSConfigStore.disableExpire = false;
                                  DNSSelectionStore.disableExpireDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  DNSConfigStore.disableExpire = true;
                                  DNSSelectionStore.disableExpireDropdownValue =
                                      selectedValue!;
                                });
                              }
                            }),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.independentCache,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.independentCache = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsIndependentCache,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsIndependentCacheSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSCheckedStore.independentCache
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: DNSSelectionStore.independentDropdownValue,
                            items: DNSSelectionStore.independentList
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              if (selectedValue == 'false') {
                                setState(() {
                                  DNSConfigStore.independentCache = false;
                                  DNSSelectionStore.independentDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  DNSConfigStore.independentCache = true;
                                  DNSSelectionStore.independentDropdownValue =
                                      selectedValue!;
                                });
                              }
                            }),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.reverseMapping,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.reverseMapping = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.disableLogging,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.disableLoggingSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSCheckedStore.reverseMapping
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: DNSSelectionStore.revMapDropdownValue,
                            items: DNSSelectionStore.revMapList
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              if (selectedValue == 'false') {
                                setState(() {
                                  DNSConfigStore.reverseMapping = false;
                                  DNSSelectionStore.revMapDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  DNSConfigStore.reverseMapping = true;
                                  DNSSelectionStore.revMapDropdownValue =
                                      selectedValue!;
                                });
                              }
                            }),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.fakeIP,
              onChanged: (bool? value) {
                setState(() {
                  DNSCheckedStore.fakeIP = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsFakeIP,
                style: const TextStyle(color: white),
              ),
            ),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
