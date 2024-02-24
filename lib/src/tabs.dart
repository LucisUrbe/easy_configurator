import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

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
  bool checkedDisabled = true;
  bool checkedLevel = true;
  bool checkedOutput = false;
  bool checkedTimestamp = true;

  bool disabledSelected = false;
  List<String> disabledList = <String>['false', 'true'];
  String disabledDropdownValue = 'false';

  List<String> levelList = <String>[
    'trace',
    'debug',
    'info',
    'warn',
    'error',
    'fatal',
    'panic',
  ];
  String levelDropdownValue = 'info';

  bool outputSelected = false;
  String outputPath = 'box.log';

  bool timestampSelected = true;
  List<String> timestampList = <String>['true', 'false'];
  String timestampDropdownValue = 'true';

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
              value: checkedDisabled,
              onChanged: (bool? value) {
                setState(() {
                  checkedDisabled = value!;
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
            checkedDisabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: disabledDropdownValue,
                            items: disabledList.map((String value) {
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
                                  disabledSelected = false;
                                  disabledDropdownValue = selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  disabledSelected = true;
                                  disabledDropdownValue = selectedValue!;
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
              value: checkedLevel,
              onChanged: (bool? value) {
                setState(() {
                  checkedLevel = value!;
                });
              },
              title: const Text(
                'Log level',
                style: TextStyle(color: white),
              ),
              subtitle: const Text(
                'One of: trace debug info warn error fatal panic.',
                style: TextStyle(color: gray),
              ),
            ),
            checkedLevel
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: levelDropdownValue,
                          items: levelList.map((String value) {
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
                              levelDropdownValue = selectedValue!;
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
              value: checkedOutput,
              onChanged: (bool? value) {
                setState(() {
                  checkedOutput = value!;
                });
              },
              title: const Text(
                'Output file path',
                style: TextStyle(color: white),
              ),
              subtitle: const Text(
                'Will not write log to console after enable.',
                style: TextStyle(color: gray),
              ),
            ),
            checkedOutput
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
                              outputPath = inputString;
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
              value: checkedTimestamp,
              onChanged: (bool? value) {
                setState(() {
                  checkedTimestamp = value!;
                });
              },
              title: const Text(
                'Show timestamp',
                style: TextStyle(color: white),
              ),
              subtitle: const Text(
                'Add time to each line.',
                style: TextStyle(color: gray),
              ),
            ),
            checkedTimestamp
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: timestampDropdownValue,
                            items: timestampList.map((String value) {
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
                                  timestampSelected = false;
                                  timestampDropdownValue = selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  timestampSelected = true;
                                  timestampDropdownValue = selectedValue!;
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



class NTPTabWidget extends StatefulWidget {
  const NTPTabWidget({super.key});

  @override
  State<NTPTabWidget> createState() => _NTPTabWidgetState();
}

class _NTPTabWidgetState extends State<NTPTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
