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
              value: ConfigStore.logCheckedDisabled,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.logCheckedDisabled = value!;
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
            ConfigStore.logCheckedDisabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.logDisabledDropdownValue,
                            items: ConfigStore.logDisabledList.map((String value) {
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
                                  ConfigStore.logDisabledSelected = false;
                                  ConfigStore.logDisabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.logDisabledSelected = true;
                                  ConfigStore.logDisabledDropdownValue =
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
              value: ConfigStore.logCheckedLevel,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.logCheckedLevel = value!;
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
            ConfigStore.logCheckedLevel
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: ConfigStore.logLevelDropdownValue,
                          items: ConfigStore.logLevelList.map((String value) {
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
                              ConfigStore.logLevelDropdownValue = selectedValue!;
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
              value: ConfigStore.logCheckedOutput,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.logCheckedOutput = value!;
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
            ConfigStore.logCheckedOutput
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: ConfigStore.logOutputPath,
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
                              ConfigStore.logOutputPath = inputString;
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
              value: ConfigStore.logCheckedTimestamp,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.logCheckedTimestamp = value!;
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
            ConfigStore.logCheckedTimestamp
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: ConfigStore.logTimestampDropdownValue,
                            items:
                                ConfigStore.logTimestampList.map((String value) {
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
                                  ConfigStore.logTimestampSelected = false;
                                  ConfigStore.logTimestampDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  ConfigStore.logTimestampSelected = true;
                                  ConfigStore.logTimestampDropdownValue =
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
