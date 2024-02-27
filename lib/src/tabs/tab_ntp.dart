import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';

class NTPTabWidget extends StatefulWidget {
  const NTPTabWidget({super.key});

  @override
  State<NTPTabWidget> createState() => _NTPTabWidgetState();
}

class _NTPTabWidgetState extends State<NTPTabWidget> {
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
              value: NTPCheckedStore.enabled,
              onChanged: (bool? value) {
                setState(() {
                  NTPCheckedStore.enabled = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.ntpService,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.ntpServiceSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            NTPCheckedStore.enabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: NTPSelectionStore.enabledDropdownValue,
                            items: NTPSelectionStore.enabledList
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
                                  NTPConfigStore.enabledSelected = false;
                                  NTPSelectionStore.enabledDropdownValue =
                                      selectedValue!;
                                  NTPCheckedStore.server = false;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  NTPConfigStore.enabledSelected = true;
                                  NTPSelectionStore.enabledDropdownValue =
                                      selectedValue!;
                                  NTPCheckedStore.server = true;
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
            NTPCheckedStore.server
                ? CheckboxListTile(
                    enabled: false,
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: NTPCheckedStore.server,
                    onChanged: (_) {},
                    title: Text(
                      AppLocalizations.of(context)!.ntpServer,
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.ntpServerSubtitle,
                      style: const TextStyle(color: gray),
                    ),
                  )
                : Container(),
            NTPCheckedStore.server
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: NTPConfigStore.serverAddress,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.ntpServerHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              NTPConfigStore.serverAddress = inputString;
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
            NTPCheckedStore.server
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: NTPCheckedStore.serverPort,
                    onChanged: (bool? value) {
                      setState(() {
                        NTPCheckedStore.serverPort = value!;
                      });
                    },
                    title: Text(
                      AppLocalizations.of(context)!.ntpServerPort,
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.ntpServerPortSubtitle,
                      style: const TextStyle(color: gray),
                    ),
                  )
                : Container(),
            NTPCheckedStore.server && NTPCheckedStore.serverPort
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              NTPConfigStore.serverPortInteger.toString(),
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .ntpServerPortHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              NTPSelectionStore.serverPort = inputString;
                              NTPConfigStore.serverPortInteger =
                                  int.tryParse(NTPSelectionStore.serverPort) ??
                                      NTPConfigStore.serverPortInteger;
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
            NTPCheckedStore.server
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: NTPCheckedStore.interval,
                    onChanged: (bool? value) {
                      setState(() {
                        NTPCheckedStore.interval = value!;
                      });
                    },
                    title: Text(
                      AppLocalizations.of(context)!.ntpInterval,
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.ntpIntervalSubtitle,
                      style: const TextStyle(color: gray),
                    ),
                  )
                : Container(),
            NTPCheckedStore.server && NTPCheckedStore.interval
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: NTPConfigStore.interval,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .ntpIntervalHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              NTPConfigStore.interval = inputString;
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
          ],
        ),
      ),
    );
  }
}
