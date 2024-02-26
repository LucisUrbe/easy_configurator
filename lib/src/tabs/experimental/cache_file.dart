import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class CacheFileWidget extends StatefulWidget {
  const CacheFileWidget({super.key});

  @override
  State<CacheFileWidget> createState() => _CacheFileWidgetState();
}

class _CacheFileWidgetState extends State<CacheFileWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cacheFile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: ConfigStore.cfCheckedEnabled,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedEnabled = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfEnabled,
                style: const TextStyle(color: white),
              ),
            ),
            ConfigStore.cfCheckedEnabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.cfEnabledDropdownValue,
                            items:
                                ConfigStore.cfEnabledList.map((String value) {
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
                                  ConfigStore.cfEnabled = false;
                                  ConfigStore.cfEnabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.cfEnabled = true;
                                  ConfigStore.cfEnabledDropdownValue =
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
              value: ConfigStore.cfCheckedPath,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedPath = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfPath,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.cfPathSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.cfCheckedPath
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.cfPath,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.cfPathHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              ConfigStore.cfPath = inputString;
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
              value: ConfigStore.cfCheckedCacheID,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedCacheID = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfCacheID,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.cfCacheIDSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.cfCheckedCacheID
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.cfCacheID,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.cfCacheIDHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              ConfigStore.cfCacheID = inputString;
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
              value: ConfigStore.cfCheckedStoreFakeIP,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedStoreFakeIP = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfStoreFakeIP,
                style: const TextStyle(color: white),
              ),
            ),
            ConfigStore.cfCheckedStoreFakeIP
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.cfStoreFakeIPDropdownValue,
                            items: ConfigStore.cfStoreFakeIPList
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
                                  ConfigStore.cfStoreFakeIP = false;
                                  ConfigStore.cfStoreFakeIPDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.cfStoreFakeIP = true;
                                  ConfigStore.cfStoreFakeIPDropdownValue =
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
              value: ConfigStore.cfCheckedStoreRDRC,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedStoreRDRC = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfStoreRDRC,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.cfStoreRDRCSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.cfCheckedStoreRDRC
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.cfStoreRDRCDropdownValue,
                            items:
                                ConfigStore.cfStoreRDRCList.map((String value) {
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
                                  ConfigStore.cfStoreRDRC = false;
                                  ConfigStore.cfStoreRDRCDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.cfStoreRDRC = true;
                                  ConfigStore.cfStoreRDRCDropdownValue =
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
              value: ConfigStore.cfCheckedRDRCTimeout,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.cfCheckedRDRCTimeout = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfRDRCTimeout,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.cfRDRCTimeoutSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.cfCheckedRDRCTimeout
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.cfRDRCTimeout,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .cfRDRCTimeoutHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              ConfigStore.cfRDRCTimeout = inputString;
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
          ],
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Text('Go back!'),
      //   ),
      // ),
    );
  }
}
