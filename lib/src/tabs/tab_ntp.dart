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
              value: ConfigStore.checkedEnabled,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedEnabled = value!;
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
            ConfigStore.checkedEnabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.enabledDropdownValue,
                            items: ConfigStore.enabledList.map((String value) {
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
                                  ConfigStore.enabledSelected = false;
                                  ConfigStore.enabledDropdownValue =
                                      selectedValue!;
                                  ConfigStore.checkedServer = false;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.enabledSelected = true;
                                  ConfigStore.enabledDropdownValue =
                                      selectedValue!;
                                  ConfigStore.checkedServer = true;
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
            ConfigStore.checkedServer
                ? CheckboxListTile(
                    enabled: false,
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.checkedServer,
                    onChanged: (bool? value) {
                      setState(() {});
                    },
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
            ConfigStore.checkedServer
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextField(
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
                              ConfigStore.serverAddress = inputString;
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
            ConfigStore.checkedServer
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.checkedServerPort,
                    onChanged: (bool? value) {
                      setState(() {
                        ConfigStore.checkedServerPort = value!;
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
            ConfigStore.checkedServer && ConfigStore.checkedServerPort
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextField(
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
                              ConfigStore.serverPort = inputString;
                              ConfigStore.serverPortInteger =
                                  int.tryParse(ConfigStore.serverPort) ??
                                      ConfigStore.serverPortInteger;
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
            ConfigStore.checkedServer
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.checkedInterval,
                    onChanged: (bool? value) {
                      setState(() {
                        ConfigStore.checkedInterval = value!;
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
            ConfigStore.checkedServer && ConfigStore.checkedInterval
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextField(
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
                              ConfigStore.interval = inputString;
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
