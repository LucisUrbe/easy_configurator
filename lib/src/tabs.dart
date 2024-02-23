import 'package:flutter/material.dart';

import 'colors.dart';

/// [CheckboxListTileApp] is never used.
class CheckboxListTileApp extends StatelessWidget {
  const CheckboxListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool checkedDisabled = true;
  bool checkedLevel = true;
  bool checkedOutput = false;
  bool checkedTimestamp = true;

  bool disabledSelected = false;
  List<String> disabledList = <String>['false', 'true'];
  String disabledDropdownValue = 'false';

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
              title: const Text(
                'Disable logging',
                style: TextStyle(color: white),
              ),
              subtitle: const Text(
                'Disable logging, no output after start.',
                style: TextStyle(color: gray),
              ),
            ),
            checkedDisabled
                ? SizedBox(
                    width: 200.0,
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
                            disabledSelected = false;
                            setState(() {
                              disabledDropdownValue = selectedValue!;
                            });
                          }
                          if (selectedValue == 'true') {
                            disabledSelected = true;
                            setState(() {
                              disabledDropdownValue = selectedValue!;
                            });
                          }
                        }),
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
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
