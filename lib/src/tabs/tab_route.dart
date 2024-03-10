import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';
import 'route/rules.dart';
import 'route/rule_set.dart';

class RouteTabWidget extends StatefulWidget {
  const RouteTabWidget({super.key});

  @override
  State<RouteTabWidget> createState() => _RouteTabWidgetState();
}

class _RouteTabWidgetState extends State<RouteTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: RouteCheckedStore.rules,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.rules = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeRules,
                style: const TextStyle(color: white),
              ),
            ),
            RouteCheckedStore.rules
                ? ListTile(
                    title: Text(AppLocalizations.of(context)!.routeRules),
                    titleTextStyle: const TextStyle(color: white),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RulesTabWidget(),
                        ),
                      );
                    },
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: RouteCheckedStore.ruleSet,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.ruleSet = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeRuleSet,
                style: const TextStyle(color: white),
              ),
            ),
            RouteCheckedStore.ruleSet
                ? ListTile(
                    title: Text(AppLocalizations.of(context)!.routeRuleSet),
                    titleTextStyle: const TextStyle(color: white),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RuleSetsTabWidget(),
                        ),
                      );
                    },
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: RouteCheckedStore.finalTag,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.finalTag = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeFinal,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.routeFinalSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            RouteCheckedStore.finalTag
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: RouteConfigStore.finalTag,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeFinalHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteConfigStore.finalTag = inputString;
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
              value: RouteCheckedStore.autoDetectInterface,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.autoDetectInterface = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeAutoDetIf,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.routeAutoDetIfSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            RouteCheckedStore.autoDetectInterface
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: RouteSelectionStore.autoDIDropdownValue,
                            items: RouteSelectionStore.autoDIList
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
                                  RouteConfigStore.autoDetectInterface = false;
                                  RouteSelectionStore.autoDIDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  RouteConfigStore.autoDetectInterface = true;
                                  RouteSelectionStore.autoDIDropdownValue =
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
              value: RouteCheckedStore.overrideAndroidVPN,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.overrideAndroidVPN = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeOrAdVPN,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.routeOrAdVPNSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            RouteCheckedStore.overrideAndroidVPN
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value:
                                RouteSelectionStore.overrideAVPNDropdownValue,
                            items: RouteSelectionStore.overrideAVPNList
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
                                  RouteConfigStore.overrideAndroidVPN = false;
                                  RouteSelectionStore
                                          .overrideAVPNDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  RouteConfigStore.overrideAndroidVPN = true;
                                  RouteSelectionStore
                                          .overrideAVPNDropdownValue =
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
              value: RouteCheckedStore.defaultInterface,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.defaultInterface = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeDefIf,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.routeDefIfSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            RouteCheckedStore.defaultInterface
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: RouteConfigStore.defaultInterface,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeDefIfHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteConfigStore.defaultInterface = inputString;
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
              value: RouteCheckedStore.defaultMark,
              onChanged: (bool? value) {
                setState(() {
                  RouteCheckedStore.defaultMark = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.routeDefMark,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.routeDefMarkSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            RouteCheckedStore.defaultMark
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: RouteConfigStore.defaultMark.toString(),
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeDefMarkHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteSelectionStore.defaultMark = inputString;
                              RouteConfigStore.defaultMark = int.tryParse(
                                      RouteSelectionStore.defaultMark) ??
                                  RouteConfigStore.defaultMark;
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
    );
  }
}
