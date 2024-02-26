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
              value: ConfigStore.ntpCheckedEnabled,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.ntpCheckedEnabled = value!;
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
            ConfigStore.ntpCheckedEnabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.ntpEnabledDropdownValue,
                            items: ConfigStore.ntpEnabledList.map((String value) {
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
                                  ConfigStore.ntpEnabledSelected = false;
                                  ConfigStore.ntpEnabledDropdownValue =
                                      selectedValue!;
                                  ConfigStore.ntpCheckedServer = false;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.ntpEnabledSelected = true;
                                  ConfigStore.ntpEnabledDropdownValue =
                                      selectedValue!;
                                  ConfigStore.ntpCheckedServer = true;
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
            ConfigStore.ntpCheckedServer
                ? CheckboxListTile(
                    enabled: false,
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.ntpCheckedServer,
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
            ConfigStore.ntpCheckedServer
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.ntpServerAddress,
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
                              ConfigStore.ntpServerAddress = inputString;
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
            ConfigStore.ntpCheckedServer
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.ntpCheckedServerPort,
                    onChanged: (bool? value) {
                      setState(() {
                        ConfigStore.ntpCheckedServerPort = value!;
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
            ConfigStore.ntpCheckedServer && ConfigStore.ntpCheckedServerPort
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.ntpServerPort,
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
                              ConfigStore.ntpServerPort = inputString;
                              ConfigStore.ntpServerPortInteger =
                                  int.tryParse(ConfigStore.ntpServerPort) ??
                                      ConfigStore.ntpServerPortInteger;
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
            ConfigStore.ntpCheckedServer
                ? CheckboxListTile(
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ConfigStore.ntpCheckedInterval,
                    onChanged: (bool? value) {
                      setState(() {
                        ConfigStore.ntpCheckedInterval = value!;
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
            ConfigStore.ntpCheckedServer && ConfigStore.ntpCheckedInterval
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.ntpInterval,
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
                              ConfigStore.ntpInterval = inputString;
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
