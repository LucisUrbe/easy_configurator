import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class V2RayAPIWidget extends StatefulWidget {
  const V2RayAPIWidget({super.key});

  @override
  State<V2RayAPIWidget> createState() => _V2RayAPIWidgetState();
}

class _V2RayAPIWidgetState extends State<V2RayAPIWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.v2RayAPI),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: VACheckedStore.listen,
              onChanged: (bool? value) {
                setState(() {
                  VACheckedStore.listen = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.vaListen,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.vaListenSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            VACheckedStore.listen
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: VAConfigStore.listen,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.vaListenHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              VAConfigStore.listen = inputString;
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
              value: VACheckedStore.statsEnabled,
              onChanged: (bool? value) {
                setState(() {
                  VACheckedStore.statsEnabled = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.vaStatsEnabled,
                style: const TextStyle(color: white),
              ),
            ),
            VACheckedStore.statsEnabled
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: VASelectionStore.enabledDropdownValue,
                            items: VASelectionStore.enabledList
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
                                  VAConfigStore.enabled = false;
                                  VASelectionStore.enabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  VAConfigStore.enabled = true;
                                  VASelectionStore.enabledDropdownValue =
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
              value: VACheckedStore.statsInbounds,
              onChanged: (bool? value) {
                setState(() {
                  VACheckedStore.statsInbounds = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.vaStatsInbounds,
                style: const TextStyle(color: white),
              ),
            ),
            VACheckedStore.statsInbounds
                ? TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: VAConfigStore.inbounds.join('\n'),
                    cursorColor: gray,
                    style: const TextStyle(color: white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                      hintText: AppLocalizations.of(context)!
                          .vaStatsHintText,
                      hintStyle: const TextStyle(color: gray),
                    ),
                    onChanged: (inputString) {
                      setState(() {
                        VAConfigStore.inbounds = inputString.split('\n');
                      });
                    },
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: VACheckedStore.statsOutbounds,
              onChanged: (bool? value) {
                setState(() {
                  VACheckedStore.statsOutbounds = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.vaStatsOutbounds,
                style: const TextStyle(color: white),
              ),
            ),
            VACheckedStore.statsOutbounds
                ? TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              initialValue: VAConfigStore.outbounds.join('\n'),
              cursorColor: gray,
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                hintText: AppLocalizations.of(context)!
                    .vaStatsHintText,
                hintStyle: const TextStyle(color: gray),
              ),
              onChanged: (inputString) {
                setState(() {
                  VAConfigStore.outbounds = inputString.split('\n');
                });
              },
            )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: VACheckedStore.statsUsers,
              onChanged: (bool? value) {
                setState(() {
                  VACheckedStore.statsUsers = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.vaStatsUsers,
                style: const TextStyle(color: white),
              ),
            ),
            VACheckedStore.statsUsers
                ? TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              initialValue: VAConfigStore.users.join('\n'),
              cursorColor: gray,
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                hintText: AppLocalizations.of(context)!
                    .vaStatsHintText,
                hintStyle: const TextStyle(color: gray),
              ),
              onChanged: (inputString) {
                setState(() {
                  VAConfigStore.users = inputString.split('\n');
                });
              },
            )
                : Container(),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}

