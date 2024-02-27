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
              value: CFCheckedStore.enabled,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.enabled = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfEnabled,
                style: const TextStyle(color: white),
              ),
            ),
            CFCheckedStore.enabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: CFSelectionStore.enabledDropdownValue,
                            items: CFSelectionStore.enabledList
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
                                  CFConfigStore.enabled = false;
                                  CFSelectionStore.enabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  CFConfigStore.enabled = true;
                                  CFSelectionStore.enabledDropdownValue =
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
              value: CFCheckedStore.path,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.path = value!;
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
            CFCheckedStore.path
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: CFConfigStore.path,
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
                              CFConfigStore.path = inputString;
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
              value: CFCheckedStore.cacheID,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.cacheID = value!;
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
            CFCheckedStore.cacheID
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: CFConfigStore.cacheID,
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
                              CFConfigStore.cacheID = inputString;
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
              value: CFCheckedStore.storeFakeIP,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.storeFakeIP = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cfStoreFakeIP,
                style: const TextStyle(color: white),
              ),
            ),
            CFCheckedStore.storeFakeIP
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: CFSelectionStore.storeFakeIPDropdownValue,
                            items: CFSelectionStore.storeFakeIPList
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
                                  CFConfigStore.storeFakeIP = false;
                                  CFSelectionStore.storeFakeIPDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  CFConfigStore.storeFakeIP = true;
                                  CFSelectionStore.storeFakeIPDropdownValue =
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
              value: CFCheckedStore.storeRDRC,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.storeRDRC = value!;
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
            CFCheckedStore.storeRDRC
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: CFSelectionStore.storeRDRCDropdownValue,
                            items: CFSelectionStore.storeRDRCList
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
                                  CFConfigStore.storeRDRC = false;
                                  CFSelectionStore.storeRDRCDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  CFConfigStore.storeRDRC = true;
                                  CFSelectionStore.storeRDRCDropdownValue =
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
              value: CFCheckedStore.rdrcTimeout,
              onChanged: (bool? value) {
                setState(() {
                  CFCheckedStore.rdrcTimeout = value!;
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
            CFCheckedStore.rdrcTimeout
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: CFConfigStore.rdrcTimeout,
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
                              CFConfigStore.rdrcTimeout = inputString;
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
