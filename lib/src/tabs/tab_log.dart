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
              value: LogCheckedStore.disabled,
              onChanged: (bool? value) {
                setState(() {
                  LogCheckedStore.disabled = value!;
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
            LogCheckedStore.disabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: LogSelectionStore.disabledDropdownValue,
                            items: LogSelectionStore.disabledList
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
                                  LogConfigStore.disabledSelected = false;
                                  LogSelectionStore.disabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  LogConfigStore.disabledSelected = true;
                                  LogSelectionStore.disabledDropdownValue =
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
              value: LogCheckedStore.level,
              onChanged: (bool? value) {
                setState(() {
                  LogCheckedStore.level = value!;
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
            LogCheckedStore.level
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: LogConfigStore.levelDropdownValue,
                          items: LogSelectionStore.levelList.map((String value) {
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
                              LogConfigStore.levelDropdownValue =
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
              value: LogCheckedStore.output,
              onChanged: (bool? value) {
                setState(() {
                  LogCheckedStore.output = value!;
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
            LogCheckedStore.output
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: LogConfigStore.outputPath,
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
                              LogConfigStore.outputPath = inputString;
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
              value: LogCheckedStore.timestamp,
              onChanged: (bool? value) {
                setState(() {
                  LogCheckedStore.timestamp = value!;
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
            LogCheckedStore.timestamp
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: LogSelectionStore.timestampDropdownValue,
                            items: LogSelectionStore.timestampList
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
                                  LogConfigStore.timestampSelected = false;
                                  LogSelectionStore.timestampDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  LogConfigStore.timestampSelected = true;
                                  LogSelectionStore.timestampDropdownValue =
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
