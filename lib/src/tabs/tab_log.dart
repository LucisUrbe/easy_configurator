import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';

/// [CheckboxListTileApp] is never used.
class CheckboxListTileApp extends StatelessWidget {
  const CheckboxListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LogTabWidget(),
    );
  }
}

class LogTabWidget extends StatefulWidget {
  const LogTabWidget({super.key});

  @override
  State<LogTabWidget> createState() => _LogTabWidgetState();
}

class _LogTabWidgetState extends State<LogTabWidget> {
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
              value: ConfigStore.checkedDisabled,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedDisabled = value!;
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
            ConfigStore.checkedDisabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.disabledDropdownValue,
                            items: ConfigStore.disabledList.map((String value) {
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
                                  ConfigStore.disabledSelected = false;
                                  ConfigStore.disabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.disabledSelected = true;
                                  ConfigStore.disabledDropdownValue =
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
              value: ConfigStore.checkedLevel,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedLevel = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.logLevel,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.logLevelSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.checkedLevel
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: ConfigStore.levelDropdownValue,
                          items: ConfigStore.levelList.map((String value) {
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
                              ConfigStore.levelDropdownValue = selectedValue!;
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
              value: ConfigStore.checkedOutput,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedOutput = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.outputFilePath,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.outputFilePathSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.checkedOutput
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
                                AppLocalizations.of(context)!.outputHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              ConfigStore.outputPath = inputString;
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
              value: ConfigStore.checkedTimestamp,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedTimestamp = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.showTimestamp,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.showTimestampSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            ConfigStore.checkedTimestamp
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.timestampDropdownValue,
                            items:
                                ConfigStore.timestampList.map((String value) {
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
                                  ConfigStore.timestampSelected = false;
                                  ConfigStore.timestampDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.timestampSelected = true;
                                  ConfigStore.timestampDropdownValue =
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
          ],
        ),
      ),
    );
  }
}
